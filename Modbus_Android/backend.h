#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QModbusDataUnit>
#include <QModbusClient>
#include <QModbusReply>
#include <QModbusTcpClient>
#include <QSerialPort>
#include <QtSerialBus/qtserialbusglobal.h>

class QModbusClient;
class QModbusReply;

class BackEnd : public QObject
{
    Q_OBJECT
public:
    explicit BackEnd(QObject *parent = nullptr);
    struct Setting{
        QString modbusSlaveUrl = "192.168.1.211:502";
        int responseTime = 100;
        int numberOfretries = 3;
    }m_setting;
signals:
    void stateChanged(QString s);
private:
    QModbusDataUnit readRequest() const;
    QModbusDataUnit writeRequest() const;


    Setting setting() const;
public slots:
    void onConnectButtonClicked();
    void show();
    void get();
    void setHreg();
    void resetHreg();
private:
    QModbusReply *lastRequest = nullptr;
    QModbusTcpClient modbusDevice;
signals:

};

#endif // BACKEND_H
