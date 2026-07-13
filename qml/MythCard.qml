import QtQuick 6.0


Rectangle {

    id: root


    property color background:
        "#171A24"


    property int radius:
        24


    width: 320
    height: 180


    radius: root.radius


    color: root.background


    border.color:
        "#FFFFFF12"


    border.width:
        1



    layer.enabled: true


    layer.effect:
        DropShadow {

            horizontalOffset: 0

            verticalOffset: 20

            radius: 40

            samples: 32

            color:
            "#00000066"

        }



}