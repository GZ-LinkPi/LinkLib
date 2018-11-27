#ifndef LINK_H
#define LINK_H

#include "LinkObject.h"
#include <QObject>
#include <QMap>
#include <QHash>
#include <QVariant>
#include <QByteArray>
#include <QThread>
#include <QDebug>
#if defined(LINK_LIBRARY)
#include "header.h"
#include "LinkHi.h"
#include <QMetaObject>
#  define LINKSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LINKSHARED_EXPORT Q_DECL_IMPORT
#endif



class LINKSHARED_EXPORT Link : public QObject
{
    Q_OBJECT
public:
    friend class LinkObject;
    explicit Link(QObject *parent = 0);
    template<typename T>
    static int registerClass();


    static bool init(bool sys=true);
    static LinkObject* create(QString className, QString name="");
    static LinkObject* find(QString name);
    static QByteArray sn;
    static QVariantMap getConfig();
    static bool setConfig(QString path);
    static QVariant o2v(LinkObject *obj);
    static LinkObject* v2o(QVariant var);
    static QThread *newThread(QString &name,QThread::Priority priority=QThread::NormalPriority);
    static void delThread(QString name);
private:
    typedef LinkObject* (*Constructor)( QObject* parent );
    template<typename T>
    static LinkObject* constructorHelper( QObject* parent );
    static QHash<QString, Constructor>& constructors();
    static bool initSys();
    static LinkObject* linkA(LinkObject *src, LinkObject *dst);
    static LinkObject* linkV(LinkObject *src, LinkObject *dst);
    static void unLinkA(LinkObject *src, LinkObject *dst);
    static void unLinkV(LinkObject *src, LinkObject *dst);
    static void delObject(LinkObject *obj);
private:
    static QMap<QString,int> classCount;
    static QMap<QString,LinkObject*> objectMap;

    static QMap<QString,QThread*> threadMap;
    static QMap<QString,int> threadCount;
    static QMutex lockThread;
    static QVariantMap Config;
signals:

public slots:
};

#endif // LINK_H
