import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.12
import QtQml 2.3

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
//    visibility: Window.FullScreen
    title: qsTr("Hello World")
//    onClosing: {
//        close.accepted = false
//    }
    Button{
        id: connect_btn
        text: "Connect"
        onClicked: {
            back.onConnectButtonClicked()
        }
    }
    Button{
        x: connect_btn.width + 50
        id: show_btn
        text: "Show Data"
        onClicked: {
            back.get()
        }
    }
    Button{
        x: connect_btn.width + 50
        y: connect_btn.height +50
        id: on_btn
        text: "on"
        onClicked: {
            back.setHreg()
        }
    }
    Button{
        x: connect_btn.width + 50
        y: connect_btn.height +100
        id: off_btn
        text: "off"
        onClicked: {
            back.resetHreg()
        }
    }
    Label{
        id: label
        x: 23
        y: Window.height/2.0
        width: 355
        height: 62
        text: qsTr("Label")
        Connections{
            target: back
            onStateChanged: label.text = s;
        }
    }
    Text {
            id: showTime
            x: window.width/2.0 - showTime.width/2.0
            y: window.height/2.0 - showTime.height/2.0 - 200
            height: 59
            text: qsTr("Time")
            //fontSizeMode: Text.Fit
            Layout.fillWidth: true
            color: "#E56717"//"#D9E2EC"
            style: Text.Normal
            //font.bold: true
            wrapMode: Text.NoWrap
            //font.weight: Font.Normal
            font.pointSize: 100
            horizontalAlignment: Text.AlignHCenter
            font{
                family: robotoLight.name
            }
        }
    FontLoader{
        id: robotoLight
        source: "qrc:/Fonts/Roboto/Roboto-Light.ttf"
    }

    Timer{
            interval: 500
            running: true
            repeat: true
            onTriggered: {
                var date = new Date()
                showTime.text = date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm:ss")
                //showDate.text = date.toLocaleDateString(Qt.locale("en_US"))
                //find_Alarm_Element(alarmListMainView.count)

            }
        }
//    Loader{
//        id: mainLoader
//        anchors.fill: parent
//        source: "qrc:/UI/HomeScreen/HomeScreen.qml"

//    }


}
