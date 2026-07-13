import QtQuick 6.0
import QtQuick.Controls 6.0


Rectangle {


property string text:
"Myth Button"


width:
160


height:
48


radius:
12


color:
"#00E5FF"



Text {

anchors.centerIn:
parent


text:
parent.text


color:
"#0D0E15"


font.pixelSize:
16


font.bold:
true

}



MouseArea {

anchors.fill:
parent


hoverEnabled:
true


onEntered:
parent.opacity = 0.8


onExited:
parent.opacity = 1


}



Behavior on opacity {

NumberAnimation {

duration:
150

}

}



}