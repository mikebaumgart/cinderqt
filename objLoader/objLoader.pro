win32 {
	TEMPLATE=vcapp
	CINDER="../cinder_0.8.2_vc2008"
}

macx {
	CINDER="../cinder_0.8.2_mac"
	FRAMEWORKS=/System/Library/Frameworks
}

VPATH += $${CINDER}/include/
INCLUDEPATH += $${CINDER}/include/
INCLUDEPATH += $${CINDER}/boost/

win32 {
    debug {
	LIBS += $${CINDER}/lib/cinder_d.lib
	LIBS += $${CINDER}"/lib/msw/libboost_date_time-vc90-mt-sgd-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_filesystem-vc90-mt-sgd-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_system-vc90-mt-sgd-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_thread-vc90-mt-sgd-1_44.lib"
    } else {
	LIBS += $${CINDER}/lib/cinder.lib
	LIBS += $${CINDER}"/lib/msw/libboost_date_time-vc90-mt-s-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_filesystem-vc90-mt-s-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_system-vc90-mt-s-1_44.lib"
	LIBS += $${CINDER}"/lib/msw/libboost_thread-vc90-mt-s-1_44.lib"
    }
	LIBS += $${CINDER}"/lib/msw/atls.lib"
	LIBS += $${CINDER}"/lib/msw/atlthunk.lib"
	LIBS += $${CINDER}"/lib/msw/cairo-static.lib"
	LIBS += $${CINDER}"/lib/msw/pixman-1.lib"
	LIBS += $${CINDER}"/lib/msw/libpng.lib"
	LIBS += $${CINDER}"/lib/msw/libjpeg.lib"
	LIBS += $${CINDER}"/lib/msw/Wldap32.lib"
	LIBS += $${CINDER}"/lib/msw/zlib.lib"
}

macx {
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/Accelerate.framework
	LIBS += -framework Accelerate
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/AudioToolbox.framework
	LIBS += -framework AudioToolbox
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/AudioUnit.framework
	LIBS += -framework AudioUnit
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/CoreAudio.framework
	LIBS += -framework CoreAudio
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/QuickTime.framework
	LIBS += -framework QuickTime
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/QTKit.framework
	LIBS += -framework QTKit
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/CoreVideo.framework
	LIBS += -framework CoreVideo
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/Carbon.framework
	LIBS += -framework Carbon
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/OpenGL.framework
	LIBS += -framework OpenGL
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/Cocoa.framework
	LIBS += -framework Cocoa
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/AppKit.framework
	LIBS += -framework AppKit
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/CoreData.framework
	LIBS += -framework CoreData
	QMAKE_LFLAGS += -L$${FRAMEWORKS}/Foundation.framework
	LIBS += -framework Foundation
}

macx {
	LIBS += $${CINDER}/lib/libcinder.a
	LIBS += $${CINDER}"/lib/macosx/libboost_date_time.a"
	LIBS += $${CINDER}"/lib/macosx/libboost_filesystem.a"
	LIBS += $${CINDER}"/lib/macosx/libboost_system.a"
	LIBS += $${CINDER}"/lib/macosx/libboost_thread.a"
	LIBS += $${CINDER}"/lib/macosx/libcairo.a"
	LIBS += $${CINDER}"/lib/macosx/libpixman-1.a"
	LIBS += $${CINDER}"/lib/macosx/libpng14.a"
	LIBS += $${CINDER}"/lib/macosx/libz.a"
}

HEADERS       = glwidget.h \
                window.h 
SOURCES       = glwidget.cpp \
                main.cpp \
                window.cpp 
QT           += opengl
