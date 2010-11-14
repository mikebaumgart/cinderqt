#ifndef GLWIDGET_H
#define GLWIDGET_H

#include <QGLWidget>
#include "cinder/app/AppBasic.h"
#include "cinder/Camera.h"
#include "cinder/Arcball.h"


using namespace ci;

enum MouseState {
	UP,
	LEFT,
	RIGHT,
	MIDDLE
};


class GLWidget : public QGLWidget {
    Q_OBJECT

public:
    GLWidget(QWidget *parent = 0);
    ~GLWidget();

    QSize minimumSizeHint() const;
    QSize sizeHint() const;
	
		
	
	
public slots:


signals:


protected:
    void initializeGL();
    void paintGL();
    void resizeGL(int width, int height);
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);


private:
    QPoint _lastPos;
	Arcball _arcball;
	CameraPersp _cam;
	MouseState _mouseState;

};

#endif
