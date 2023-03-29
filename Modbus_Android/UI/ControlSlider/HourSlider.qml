import QtQuick 2.0
import QtQuick.Controls 2.5

Slider{
    id: hourSlider
    value: 0
    from: 0
    to: 23
    stepSize: 1
    orientation: Qt.Horizontal
    enabled: true

    background: Rectangle{
        x: hourSlider.leftPadding + hourSlider.visualPosition * (hourSlider.availableWidth - width)
        height: 5
        color: "white"
        implicitWidth: 500

        //width: hourSlider.availableWidth

        anchors.centerIn: parent
    }

    handle: Rectangle{
        x: hourSlider.visualPosition * (hourSlider.availableWidth - width)
        width: 76
        height: 76
        radius: width/2
        color: "black"
        border.color: "white"
        border.width: 10
        anchors.verticalCenter: parent.verticalCenter
        Text {
             anchors.centerIn: parent
             color: "white"
             font.pixelSize: 30
             text:hourSlider.value //hourSlider.visualPosition * (hourSlider.availableHeight - height)//hourSlider.value//temperatureControlSlider.topPadding + temperatureControlSlider.bottomPadding +temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)//temperatureControlSlider.value
             FontLoader{
                 id: robotoLight
                 source: "qrc:/Fonts/Roboto/Roboto-Light.ttf"
             }
             font.family: robotoLight.name
        }
    }
}
