import QtQuick 6.0


Rectangle {


property string message:
"Myth Notification"



width:
360

height:
90


radius:
20


color:
"#171A24"



border.color:
"#00E5FF"


border.width:
1



Text {


anchors.centerIn:
parent


text:
message


color:
"#F5F7FF"


font.pixelSize:
16


}


}