#ifndef LINKOBJECT_H
#define LINKOBJECT_H
#include <QObject>
#include <QMetaType>
#include <QMutex>
#include <QList>
#include <QVariantMap>
#include <QThread>
#include <QReadWriteLock>

class Link;
class LinkObject : public QObject
{
    Q_OBJECT
public:
    friend class Link;
    explicit LinkObject(QObject *parent = 0);
    struct Packet{
        char *data;
        int len;
        qint64 pts;
        qint64 dts;
        enum  PacketType{
            IFrame, PFrame, BFrame, AFrame, SPFrame, SPFrame_info
        }type;
        LinkObject *sender;
        Packet(){data=NULL;len=0;pts=0;sender=NULL;dts=-1;}
    };

    struct StreamInfo{
        enum DataType{
            UnKnow, VPSS, Raw, FLTP, H264, H265, MJPEG, PCMA, PCMU, G722, AAC, MP2, MPEGTS, RTSP
        }type;
        QVariantMap info;
        LinkObject *sender;
        StreamInfo(){type=UnKnow;sender=NULL;}
    };

    struct Buffer{
        QReadWriteLock lock;
        QList<Packet> buffer;
        int len;
    };

    void destroy();
    LinkObject* linkA(LinkObject* dst);
    LinkObject* linkV(LinkObject* dst);
    LinkObject* unLinkA(LinkObject* dst);
    LinkObject* unLinkV(LinkObject* dst);
    QVariant invoke(QString func, QVariant value=QVariant());
    enum State{
        created,started,stoped,destroyed
    }state;
    Q_ENUM(State);
protected:
    QVariantMap data,dataTemp,dataUser;
    StreamInfo infoSrcA,infoSrcV,infoSelfA,infoSelfV,infoATemp,infoVTemp;
    Buffer bufferA,bufferV;
    QStringList directFunc;
    QString threadName;
    QThread::Priority threadPriority;
protected:
    char* bufferData(char *data,int size);
    void sendPacketA(Packet pkt);
    void sendPacketV(Packet pkt);
    void sendInfoA(StreamInfo info);
    void sendInfoV(StreamInfo info);
    void sendEvent(QString type, QVariant msg);
    bool bufferPacketA(Packet pkt);
    bool bufferPacketV(Packet pkt);
    void memInit(int size);
private:
    char *memPool;
    char *memPtr;
    int memSize;
    void invokeInfoA(StreamInfo info);
    void invokeInfoV(StreamInfo info);
signals:
    void newEvent(QString type, QVariant msg);
    void newPacketA(Packet pkt);
    void newPacketV(Packet pkt);
    void newInfoA(StreamInfo info);
    void newInfoV(StreamInfo info);
public slots:
    bool setData(QVariantMap data);
    const QVariantMap getData();
    const QVariantMap getUserData();
    bool start();
    bool start(QVariantMap data);
    bool stop(bool block=false);
    QString name();
    QString getState();
    virtual void onNewPacketA(Packet);
    virtual void onNewPacketV(Packet );
private slots:
    void onNewInfoAPriv(StreamInfo info);
    void onNewInfoVPriv(StreamInfo info);
    void onSetDataPriv(QVariantMap data);
    QVariantMap doGetData();
    virtual void onNewInfoA(StreamInfo);
    virtual void onNewInfoV(StreamInfo );
    virtual void onSetData(QVariantMap);
    virtual void onStart();
    virtual void onStop();
};

#endif // LINKOBJECT_H
