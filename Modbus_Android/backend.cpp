#include "backend.h"

#include <QModbusTcpClient>
#include <QDebug>
#include <QUrl>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
BackEnd::BackEnd(QObject *parent): QObject(parent)
{

}

//void BackEnd::showHoldingRegister()
//{
//    QModbusReply* reply = qobject_cast<QModbusReply*>(sender());
//    if (!reply) return;
//    QModbusDataUnit data1 = reply->result();
//    for (qint16 i = 0 ; i < 1 ; i++)
//    {
//      qDebug()<<i;
//    }
//    reply->deleteLater();
//}

BackEnd::Setting BackEnd::setting() const
{
    return m_setting;
}

void BackEnd::onConnectButtonClicked()
{
    QString modbus_slave_url = setting().modbusSlaveUrl;

    qDebug() << "modbusDevice" << modbusDevice.device();

    if (!modbusDevice.device())
        return;
    if (modbusDevice.state() != QModbusDevice::ConnectedState) {
        const QUrl url = QUrl::fromUserInput(modbus_slave_url);
        qint64 port = 502;
        modbusDevice.setConnectionParameter(QModbusDevice::NetworkPortParameter, port);
        modbusDevice.setConnectionParameter(QModbusDevice::NetworkAddressParameter, "169.254.120.233");//192.168.1.211

        modbusDevice.setTimeout(setting().responseTime);
        modbusDevice.setNumberOfRetries(setting().numberOfretries);

        //modbusDevice->connectDevice();
        if (modbusDevice.connectDevice())
        {
            qDebug() << "connected";
            emit stateChanged("connected");
        }
        else if (!modbusDevice.connectDevice())
        {
            qDebug() << "Connect failed: " << modbusDevice.errorString();
            emit stateChanged("Connect failed");
        }

//        qDebug() << "else connectDevice";
//        stateChanged("else connectDevice");
    } else {
        modbusDevice.disconnectDevice();
        qDebug() << "else disconnectDevice";
    }
    //delete modbusDevice;


}

void BackEnd::show()
{
    QModbusReply* reply = qobject_cast<QModbusReply*>(sender());
    if (!reply) return;
    QModbusDataUnit data1 = reply->result();
    for (qint16 i = 0 ; i < 5 ; i++)
    {
      qDebug()<<"start"<<data1.value(i);
    }
    reply->deleteLater();
}

void BackEnd::get()
{
    QModbusDataUnit dataUnit(QModbusDataUnit::HoldingRegisters, 100, 5);
  //  dataUnit.setStartAddress(m_startAddress);
  //  dataUnit.setValueCount(m_values);
    auto reply = modbusDevice.sendReadRequest(dataUnit, 1);
    connect(reply, &QModbusReply::finished, this, &BackEnd::show);
}

void BackEnd::setHreg()
{
    qint64 value = 1;//1ติด 0 ดับ

    QModbusDataUnit dataUnit;
    dataUnit.setRegisterType(QModbusDataUnit::HoldingRegisters);
    dataUnit.setStartAddress(0);//101
    QVector<quint16> vec;
    vec << value;
    dataUnit.setValues(vec);
    modbusDevice.sendWriteRequest(dataUnit,1);
    auto reply = modbusDevice.sendReadRequest(dataUnit,1);
    if (reply->isFinished())
    {
        qDebug()<<"write success";
    }
}

void BackEnd::resetHreg()
{
    qint64 value = 0;//1ติด 0 ดับ

    QModbusDataUnit dataUnit;
    dataUnit.setRegisterType(QModbusDataUnit::HoldingRegisters);
    dataUnit.setStartAddress(101);
    QVector<quint16> vec;
    vec << value;
    dataUnit.setValues(vec);
    modbusDevice.sendWriteRequest(dataUnit,1);
    auto reply = modbusDevice.sendReadRequest(dataUnit,1);
    if (reply->isFinished())
    {
        qDebug()<<"write success";
    }
}
