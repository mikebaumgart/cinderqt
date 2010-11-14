VPATH += "../cinder_0.8.2_mac/include/"
INCLUDEPATH += "../cinder_0.8.2_mac/include/"
INCLUDEPATH += "../cinder_0.8.2_mac/boost/"

QMAKE_LFLAGS += -L/System/Library/Frameworks/Accelerate.framework
LIBS += -framework Accelerate
QMAKE_LFLAGS += -L/System/Library/Frameworks/AudioToolbox.framework
LIBS += -framework AudioToolbox
QMAKE_LFLAGS += -L/System/Library/Frameworks/AudioUnit.framework
LIBS += -framework AudioUnit
QMAKE_LFLAGS += -L/System/Library/Frameworks/CoreAudio.framework
LIBS += -framework CoreAudio
QMAKE_LFLAGS += -L/System/Library/Frameworks/QuickTime.framework
LIBS += -framework QuickTime
QMAKE_LFLAGS += -L/System/Library/Frameworks/QTKit.framework
LIBS += -framework QTKit
QMAKE_LFLAGS += -L/System/Library/Frameworks/CoreVideo.framework
LIBS += -framework CoreVideo
QMAKE_LFLAGS += -L/System/Library/Frameworks/Carbon.framework
LIBS += -framework Carbon
QMAKE_LFLAGS += -L/System/Library/Frameworks/OpenGL.framework
LIBS += -framework OpenGL
QMAKE_LFLAGS += -L/System/Library/Frameworks/Cocoa.framework
LIBS += -framework Cocoa
QMAKE_LFLAGS += -L/System/Library/Frameworks/AppKit.framework
LIBS += -framework AppKit
QMAKE_LFLAGS += -L/System/Library/Frameworks/CoreData.framework
LIBS += -framework CoreData
QMAKE_LFLAGS += -L/System/Library/Frameworks/Foundation.framework
LIBS += -framework Foundation

LIBS += "../cinder_0.8.2_mac/lib/libcinder.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libboost_date_time.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libboost_filesystem.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libboost_system.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libboost_thread.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libcairo.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libpixman-1.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libpng14.a"
LIBS += "../cinder_0.8.2_mac/lib/macosx/libz.a"

HEADERS       = glwidget.h \
                window.h 
SOURCES       = glwidget.cpp \
                main.cpp \
                window.cpp 
QT           += opengl
