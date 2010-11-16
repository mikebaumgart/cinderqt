
#include "window.h"
#include "glwidget.h"

#include <QtGui>


Window::Window() {
    glWidget = new GLWidget;
	
    QHBoxLayout *mainLayout = new QHBoxLayout;
    mainLayout->addWidget(glWidget);
    setLayout(mainLayout);

    setWindowTitle(tr("helloCinderQT"));
}

void Window::keyPressEvent(QKeyEvent *e) {
    if (e->key() == Qt::Key_Escape)
        close();
    else
        QWidget::keyPressEvent(e);
}
