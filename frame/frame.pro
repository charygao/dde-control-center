load(deepin_qt)

include(../config.pri)
include(../interfaces/interfaces.pri)
include(../widgets/widgets.pri)

# modules
include(../modules/modules.pri)

QT += widgets dbus svg sql x11extras concurrent

greaterThan(QT_MAJOR_VERSION, 5)|greaterThan(QT_MINOR_VERSION, 7): QT += gui-private
else: QT += platformsupport-private

TARGET     = dde-control-center
DESTDIR    = $$_PRO_FILE_PWD_/../
TEMPLATE   = app
CONFIG += c++14 link_pkgconfig
LIBS += -L../widgets
PKGCONFIG      += dtkwidget dframeworkdbus xcb xext gsettings-qt dde-network-utils
LIBS += -lcrypt

# for gperftools
#LIBS += -lprofiler
#INCLUDEPATH += /usr/include/gperftools

HEADERS    += \
    frame.h \
    pluginscontroller.h \
    framewidget.h \
    mainwidget.h \
    settingswidget.h \
    moduleinitthread.h \
    dbuscontrolcenterservice.h \
#    quick_control/quickcontrolpanel.h \
#    quick_control/basicsettingspage.h \
#    quick_control/quickswitchbutton.h \
#    quick_control/vpn/vpncontrolpage.h \
#    quick_control/vpn/vpnlistmodel.h \
#    quick_control/display/displaycontrolpage.h \
#    quick_control/display/displaycontrolmodel.h \
#    quick_control/wifi/wifipage.h \
#    quick_control/wifi/wifilistmodel.h \
#    quick_control/vpn/vpnlistdelegate.h \
#    quick_control/wifi/wifilistdelegate.h \
#    quick_control/display/displayitemdelegate.h \
    indicatorwidget.h \
    updatenotifier.h \
    navigationview.h \
    navigationmodel.h \
    navigationdelegate.h \
    navigationbar.h \
    framecontentwrapper.h \
    navigation/navwidget.h \
    navigation/navmodel.h \
    navigation/navdelegate.h \
    notify/notifymodel.h \
    notify/notifywidget.h \
    notify/notifyview.h \
    notify/notifydelegate.h

SOURCES    += \
            main.cpp \
    frame.cpp \
    pluginscontroller.cpp \
    framewidget.cpp \
    mainwidget.cpp \
    settingswidget.cpp \
    moduleinitthread.cpp \
    dbuscontrolcenterservice.cpp \
#    quick_control/quickcontrolpanel.cpp \
#    quick_control/basicsettingspage.cpp \
#    quick_control/quickswitchbutton.cpp \
#    quick_control/vpn/vpncontrolpage.cpp \
#    quick_control/vpn/vpnlistmodel.cpp \
#    quick_control/display/displaycontrolpage.cpp \
#    quick_control/display/displaycontrolmodel.cpp \
#    quick_control/wifi/wifipage.cpp \
#    quick_control/wifi/wifilistmodel.cpp \
#    quick_control/vpn/vpnlistdelegate.cpp \
#    quick_control/wifi/wifilistdelegate.cpp \
#    quick_control/display/displayitemdelegate.cpp \
    indicatorwidget.cpp \
    updatenotifier.cpp \
    navigationview.cpp \
    navigationmodel.cpp \
    navigationdelegate.cpp \
    navigationbar.cpp \
    framecontentwrapper.cpp \
    navigation/navmodel.cpp \
    navigation/navdelegate.cpp \
    navigation/navwidget.cpp \
    notify/notifydelegate.cpp \
    notify/notifyview.cpp \
    notify/notifywidget.cpp \
    notify/notifymodel.cpp

#!isEqual(DISABLE_BLUETOOTH, YES) {
#HEADERS += \
#    quick_control/bluetooth/bluetoothlist.h \
#    quick_control/bluetooth/bluetoothlistmodel.h \
#    quick_control/bluetooth/bluetoothdelegate.h \

#SOURCES    += \
#    quick_control/bluetooth/bluetoothlist.cpp \
#    quick_control/bluetooth/bluetoothlistmodel.cpp \
#    quick_control/bluetooth/bluetoothdelegate.cpp \
#}

#RESOURCES += \
#    qss.qrc \
#    images.qrc

#INCLUDEPATH    += ../widgets ../modules/display

#include(../interfaces/interfaces.pri)

#isEqual(DCC_DISABLE_ANIMATION, YES){
#    DEFINES += DCC_DISABLE_ANIMATION
#}

#isEqual(DCC_CACHE_MODULES, YES){
#    DEFINES += DCC_CACHE_MODULES
#}

RESOURCES += \
    frame.qrc \
    navigation/navigation.qrc \
    notify/images.qrc

isEqual(DISABLE_SYS_UPDATE, YES) {
    DEFINES += DISABLE_SYS_UPDATE
}

isEqual(DISABLE_SYS_UPDATE_SOURCE_CHECK, YES) {
    DEFINES += DISABLE_SYS_UPDATE_SOURCE_CHECK
}

isEqual(DISABLE_SYS_UPDATE_MIRRORS, YES) {
    DEFINES += DISABLE_SYS_UPDATE_MIRRORS
}

isEqual(DCC_DISABLE_OPACITY_ANIMATION, YES) {
    DEFINES += DISABLE_OPACITY_ANIMATION
}

isEqual(DCC_DISABLE_MIRACAST, YES) {
    DEFINES += DCC_DISABLE_MIRACAST
}

isEqual(DCC_DISABLE_TIMEZONE, YES) {
    DEFINES += DCC_DISABLE_TIMEZONE
}

isEqual(DCC_DISABLE_KBLAYOUT, YES) {
    DEFINES += DCC_DISABLE_KBLAYOUT
}

isEqual(DCC_DISABLE_LANGUAGE, YES) {
    DEFINES += DCC_DISABLE_LANGUAGE
}

isEqual(DCC_DISABLE_GRUB, YES) {
    DEFINES += DCC_DISABLE_GRUB
}

isEqual(DCC_KEEP_SETTINGS_LIVE, YES) {
    DEFINES += DCC_KEEP_SETTINGS_LIVE
}

isEqual(DCC_DISABLE_FEEDBACK, YES) {
    DEFINES += DCC_DISABLE_FEEDBACK
}

isEqual(DCC_DISABLE_ROTATE, YES) {
    DEFINES += DCC_DISABLE_ROTATE
}

isEqual(DCC_ENABLE_ADDOMAIN, YES) {
    DEFINES += DCC_ENABLE_ADDOMAIN
}

deepin_professional {
    host_x86_64: {
        DEFINES += DCC_ENABLE_ADDOMAIN
        DEFINES += DISABLE_SYS_UPDATE_SOURCE_CHECK
        DEFINES += DISABLE_SYS_UPDATE_MIRRORS
        DEFINES += DCC_DISABLE_MIRACAST
    }
}

host_mips64: {
    DEFINES += DISABLE_SYS_UPDATE_SOURCE_CHECK
    DEFINES += DISABLE_SYS_UPDATE_MIRRORS
    DEFINES += DCC_DISABLE_MIRACAST
    DEFINES += DCC_ENABLE_AUTOSTART
    DEFINES += DCC_DISABLE_OPACITY_ANIMATION
    DEFINES += DCC_KEEP_SETTINGS_LIVE
    DEFINES += DCC_DISABLE_GRUB
    DEFINES += DISABLE_NETWORK_PROXY
    DEFINES += DCC_DISABLE_POWERSAVE
}

host_sw_64 {
    DEFINES += DISABLE_SYS_UPDATE_SOURCE_CHECK
    DEFINES += DISABLE_SYS_UPDATE_MIRRORS
    DEFINES += DCC_DISABLE_MIRACAST
    DEFINES += DCC_ENABLE_AUTOSTART
    DEFINES += DCC_DISABLE_POWERSAVE
    DEFINES += DCC_KEEP_SETTINGS_LIVE
    DEFINES += DCC_DISABLE_OPACITY_ANIMATION
    DEFINES += DCC_DISABLE_TIMEZONE
    DEFINES += DCC_DISABLE_GRUB
    DEFINES += DISABLE_SYS_UPDATE_MIRRORS
    DEFINES += DCC_DISABLE_FEEDBACK
    DEFINES += DCC_DISABLE_ROTATE
    DEFINES += DISABLE_NETWORK_PROXY
    QMAKE_CXXFLAGS += -mieee
}
