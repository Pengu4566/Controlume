#include "interfacemanager.h"
#include "qdebug.h"
#include "QVariantList"
#include "controller.h"


InterfaceManager::InterfaceManager(QObject *parent) : QObject(parent)
{

}

void InterfaceManager::test()
{
    qDebug() << "Hello from c++!";
}


float InterfaceManager::opacity_transform(float value)
{

    float threshold = 0.25;

    if(value > threshold)
    {
        return value;
    }
    else
    {
        return threshold;
    }

}

float InterfaceManager::speed_transform(float value)
{

    float max_speed = 0.35;
    float min_speed = 0.01;

    if(value > max_speed)
    {
        qDebug() << "max_speed, " + int(max_speed);
        return max_speed;
    }
    else if(value < min_speed)
    {
        return min_speed;
    }
    else
    {
        return value;
    }

}
