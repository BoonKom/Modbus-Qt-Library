import QtQuick 2.0
import QtQuick.Controls 2.5

Slider {
        id: temperatureControlSlider
        //anchors.fill: parent
        value: 70
        from: 19
        to: 30
        stepSize: 1
        orientation: Qt.Vertical
        enabled: true

        background: Rectangle{
            y:temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)
            height: 388 //มาจาก มากสุด = 388 อันนี้นะ temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)
            color: "white"
            width: 5
            anchors.centerIn: parent
        }

        handle: Rectangle{
            y:temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height) //temperatureControlSlider.topPadding + temperatureControlSlider.bottomPadding
            width: 76
            height: 76
            radius: width/2
            color: "black"
            border.color: "white"
            border.width: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                 anchors.centerIn: parent
                 color: "white"
                 font.pixelSize: 30
                 text: temperatureControlSlider.value//temperatureControlSlider.topPadding + temperatureControlSlider.bottomPadding +temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)//temperatureControlSlider.value
                 FontLoader{
                     id: robotoLight
                     source: "qrc:/Fonts/Roboto/Roboto-Light.ttf"
                 }
                 font.family: robotoLight.name
            }
        }
}
