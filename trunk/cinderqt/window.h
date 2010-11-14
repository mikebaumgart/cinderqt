#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>

QT_BEGIN_NAMESPACE
class QSlider;
QT_END_NAMESPACE

class GLWidget;
class Window : public QWidget {
    Q_OBJECT

public:
    Window();

protected:
    void keyPressEvent(QKeyEvent *event);

private:

    GLWidget *glWidget;

};

#endif
