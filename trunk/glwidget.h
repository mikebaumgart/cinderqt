#ifndef GLWIDGET_H
#define GLWIDGET_H

#include <QGLWidget>
#include "cinder/app/AppBasic.h"
#include "cinder/Camera.h"
using namespace ci;

class QtLogo;

class GLWidget : public QGLWidget
{
    Q_OBJECT

public:
    GLWidget(QWidget *parent = 0);
    ~GLWidget();

    QSize minimumSizeHint() const;
    QSize sizeHint() const;
	
	CameraPersp				mCam;
	
	
public slots:


signals:
    void xRotationChanged(int angle);
    void yRotationChanged(int angle);
    void zRotationChanged(int angle);

protected:
    void initializeGL();
    void paintGL();
    void resizeGL(int width, int height);
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);

private:
    QPoint lastPos;
};

#endif
