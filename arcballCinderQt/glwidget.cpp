#include <QtGui>
#include <QtOpenGL>
#include <math.h>

#include "glwidget.h"

#ifndef GL_MULTISAMPLE
#define GL_MULTISAMPLE  0x809D
#endif

#define Q2C(a) Vec2i(a.x(),a.y())


GLWidget::GLWidget(QWidget *parent)
: QGLWidget(QGLFormat(QGL::SampleBuffers), parent) {
	
	_mouseState = UP;
	
	
}

GLWidget::~GLWidget(){}

QSize GLWidget::minimumSizeHint() const {
    return QSize(50, 50);
}

QSize GLWidget::sizeHint() const {
    return QSize(400, 400);
}

void GLWidget::initializeGL() {
	
	// setup our default camera, looking down the z-axis
	_cam.lookAt( Vec3f( 0, 0, -20 ), Vec3f::zero() );
    glClearColor(0, 0, 0, 0);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glShadeModel(GL_SMOOTH);
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_MULTISAMPLE);
    static GLfloat lightPosition[4] = { 0.5, 5.0, 7.0, 1.0 };
    glLightfv(GL_LIGHT0, GL_POSITION, lightPosition);
}

void GLWidget::paintGL() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
	glPushMatrix();	
	gl::setMatrices( _cam );
	//gl::translate( Vec2i( width() , height()) / 2.0f );	// window size
	//gl::scale( Vec3f( 200.0f, 200.0f, 200.0f ) );
	gl::rotate( _arcball.getQuat() );
	
	
	gl::drawCube(Vec3f(0,0,0), Vec3f(2,2,2));
	glPopMatrix();
}

void GLWidget::resizeGL(int width, int height) {
	
	_arcball.setWindowSize(Vec2i(width, height));
	_arcball.setCenter(Vec2i(width/2.0f,height/2.0f));
	_arcball.setRadius(150);
	
    int side = qMin(width, height);
    glViewport((width - side) / 2, (height - side) / 2, side, side);
	
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
#ifdef QT_OPENGL_ES_1
    glOrthof(-0.5, +0.5, -0.5, +0.5, 4.0, 15.0);
#else
    glOrtho(-0.5, +0.5, -0.5, +0.5, 4.0, 15.0);
#endif
    glMatrixMode(GL_MODELVIEW);
}

void GLWidget::mouseReleaseEvent(QMouseEvent * event) {
	_mouseState = UP;
}

void GLWidget::mousePressEvent(QMouseEvent *event) {
    _lastPos = event->pos();
	_arcball.mouseDown(Q2C(event->pos()));
	
	if (event->buttons() & Qt::LeftButton) {
		_mouseState = LEFT;
	} else if (event->buttons() & Qt::RightButton) {
		_mouseState = RIGHT;
    } else if (event->buttons() & Qt::MiddleButton) {
		_mouseState = MIDDLE;
    }
}

void GLWidget::mouseMoveEvent(QMouseEvent *event) {
    _lastPos = event->pos();
	if (_mouseState != UP) _arcball.mouseDrag(Q2C(event->pos()));
	updateGL();
	printf("(x,y) (%d,%d)\n,", event->pos().x(), event->pos().y());
	
}
