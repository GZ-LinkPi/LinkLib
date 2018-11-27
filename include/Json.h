#ifndef JSON_H
#define JSON_H
#include <QVariant>
#include <QString>
class Json
{
public:
    Json();
    static QString encode(QVariant data);
    static QVariant decode(const QString &jsonStr);
    static QVariant loadFile(QString path);
    static bool saveFile(QVariant data, QString path);
};

#endif // JSON_H
