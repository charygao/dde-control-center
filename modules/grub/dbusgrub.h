/*
 * This file was generated by qdbusxml2cpp version 0.8
 * Command line was: qdbusxml2cpp -c GrubDbus -p dbusgrub.h:dbusgrub.cpp dbus.xml
 *
 * qdbusxml2cpp is Copyright (C) 2015 Digia Plc and/or its subsidiary(-ies).
 *
 * This is an auto-generated file.
 * Do not edit! All changes made to it will be lost.
 */

#ifndef DBUSGRUB_H_1438827682
#define DBUSGRUB_H_1438827682

#include <QtCore/QObject>
#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>
#include <QtDBus/QtDBus>

/*
 * Proxy class for interface com.deepin.daemon.Grub2
 */
class GrubDbus: public QDBusAbstractInterface
{
    Q_OBJECT

    Q_SLOT void __propertyChanged__(const QDBusMessage& msg)
    {
        QList<QVariant> arguments = msg.arguments();
        if (3 != arguments.count())
            return;
        QString interfaceName = msg.arguments().at(0).toString();
        if (interfaceName !="com.deepin.daemon.Grub2")
            return;
        QVariantMap changedProps = qdbus_cast<QVariantMap>(arguments.at(1).value<QDBusArgument>());
        foreach(const QString &prop, changedProps.keys()) {
        const QMetaObject* self = metaObject();
            for (int i=self->propertyOffset(); i < self->propertyCount(); ++i) {
                QMetaProperty p = self->property(i);
                if (p.name() == prop) {
                    QVariant v = p.read(this);
                    Q_EMIT p.notifySignal().invoke(this, QGenericArgument(v.typeName(), v.data()));
                }
            }
        }
    }
public:
    static inline const char *staticServerPath()
    { return "com.deepin.daemon.Grub2"; }
    static inline const char *staticInterfacePath()
    { return "/com/deepin/daemon/Grub2"; }
    static inline const char *staticInterfaceName()
    { return "com.deepin.daemon.Grub2"; }

public:
    GrubDbus(QObject *parent = 0);

    ~GrubDbus();

    Q_PROPERTY(QString DefaultEntry READ defaultEntry WRITE setDefaultEntry NOTIFY DefaultEntryChanged)
    inline QString defaultEntry() const
    { return qvariant_cast< QString >(property("DefaultEntry")); }
    inline void setDefaultEntry(const QString &value)
    { setProperty("DefaultEntry", QVariant::fromValue(value)); }

    Q_PROPERTY(bool EnableTheme READ enableTheme WRITE setEnableTheme NOTIFY EnableThemeChanged)
    inline bool enableTheme() const
    { return qvariant_cast< bool >(property("EnableTheme")); }
    inline void setEnableTheme(bool value)
    { setProperty("EnableTheme", QVariant::fromValue(value)); }

    Q_PROPERTY(bool FixSettingsAlways READ fixSettingsAlways WRITE setFixSettingsAlways NOTIFY FixSettingsAlwaysChanged)
    inline bool fixSettingsAlways() const
    { return qvariant_cast< bool >(property("FixSettingsAlways")); }
    inline void setFixSettingsAlways(bool value)
    { setProperty("FixSettingsAlways", QVariant::fromValue(value)); }

    Q_PROPERTY(QString Resolution READ resolution WRITE setResolution NOTIFY ResolutionChanged)
    inline QString resolution() const
    { return qvariant_cast< QString >(property("Resolution")); }
    inline void setResolution(const QString &value)
    { setProperty("Resolution", QVariant::fromValue(value)); }

    Q_PROPERTY(int Timeout READ timeout WRITE setTimeout NOTIFY TimeoutChanged)
    inline int timeout() const
    { return qvariant_cast< int >(property("Timeout")); }
    inline void setTimeout(int value)
    { setProperty("Timeout", QVariant::fromValue(value)); }

    Q_PROPERTY(bool Updating READ updating NOTIFY UpdatingChanged)
    inline bool updating() const
    { return qvariant_cast< bool >(property("Updating")); }

public Q_SLOTS: // METHODS
    inline QDBusPendingReply<QString> GetAvailableResolutions()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("GetAvailableResolutions"), argumentList);
    }

    inline QDBusPendingReply<QStringList> GetSimpleEntryTitles()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("GetSimpleEntryTitles"), argumentList);
    }

    inline QDBusPendingReply<> Reset()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("Reset"), argumentList);
    }

    inline QDBusPendingReply<> Setup(const QString &in0)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(in0);
        return asyncCallWithArgumentList(QStringLiteral("Setup"), argumentList);
    }

    inline QDBusPendingReply<> SetupTheme(const QString &in0)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(in0);
        return asyncCallWithArgumentList(QStringLiteral("SetupTheme"), argumentList);
    }

Q_SIGNALS: // SIGNALS
    void DefaultEntryChanged(QString DefaultEntry);
    void EnableThemeChanged(bool EnableTheme);
    void FixSettingsAlwaysChanged(bool FixSettingsAlways);
    void ResolutionChanged(QString Resolution);
    void TimeoutChanged(int Timeout);
    void UpdatingChanged(bool Updating);
};

namespace com {
namespace deepin {
namespace daemon {
//typedef ::GrubDbus Grub2;
}
}
}
#endif
