import QtQuick 2.0

Item {
    FontLoader{
        id: robotoLight
        source: "qrc:/Fonts/Roboto/Roboto-Light.ttf"
    }
    Rectangle{
        id: mainBackground
        anchors.fill: parent
        color: "black"
    }
    Text {
        id: currentTempText
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 200
        font.family: robotoLight.name
        text: "65"
    }
    Text {
        id: systemStatus
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: currentTempText.bottom
            topMargin: 40
        }
        font.pixelSize: 30
        font.family: robotoLight.name
        color: "white"
        text: "Heating..."

    }
    Loader{
        id: sliderLoader
        source: "qrc:/UI/ControlSlider/ControlSlider.qml"
        anchors{
            top: parent.top
                topMargin: 80
            bottom: parent.bottom
                bottomMargin: 80
            left: currentTempText.right
                leftMargin: 100


        }
    }
    Loader{
        id: hourSliderLoader
        source: "qrc:/UI/ControlSlider/HourSlider.qml"
        anchors{
            top: currentTempText.bottom
                topMargin: 10
            bottom: parent
                bottomMargin: -50
            left: parent.left
                leftMargin: 100
        }
    }



}
