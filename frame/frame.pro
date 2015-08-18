QT += widgets dbus

HEADERS    = frame.h \
             interfaces.h \
    homescreen.h \
    modulemetadata.h \
    constants.h \
    sidebar.h \
    contentview.h \
    dtipsframe.h \
    dbuscontrolcenter.h
SOURCES    = frame.cpp \
             main.cpp \
    homescreen.cpp \
    sidebar.cpp \
    contentview.cpp \
    dtipsframe.cpp \
    dbuscontrolcenter.cpp

include(../cutelogger/cutelogger.pri)
TARGET     = dde-control-center
DESTDIR    = $$_PRO_FILE_PWD_/../

CONFIG += c++11

LIBS += -ldui

RESOURCES += \
    qss.qrc \
    images.qrc
