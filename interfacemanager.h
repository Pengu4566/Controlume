#ifndef INTERFACEMANAGER_H
#define INTERFACEMANAGER_H

#include <QObject>

class InterfaceManager : public QObject
{
    Q_OBJECT
public:
    explicit InterfaceManager(QObject *parent = nullptr);

    Q_INVOKABLE void test();
    Q_INVOKABLE float opacity_transform(float value);
    Q_INVOKABLE float speed_transform(float value);


signals:

public slots:
};

#endif // INTERFACEMANAGER_H
