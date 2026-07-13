import QtQuick 6.0


Rectangle {


property string title:
"Myth Application"


color:
"#12141D"


radius:
28



Rectangle {


height:
64

width:
parent.width


radius:
28


color:
"#171A24"



Text {


anchors.centerIn:
parent


text:
title


color:
"#F5F7FF"


font.pixelSize:
18


}

}


}