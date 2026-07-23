import QtQuick 6.0
import MythUI 1.0

Canvas {
    id: canvas
    anchors.fill: parent
    property color gridColor: Qt.rgba(0, 0.898, 1, 0.025)
    property int gridSize: 72
    
    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        
        ctx.strokeStyle = gridColor;
        ctx.lineWidth = 1;
        
        ctx.beginPath();
        for (var x = 0; x < width; x += gridSize) {
            ctx.moveTo(x, 0);
            ctx.lineTo(x, height);
        }
        for (var y = 0; y < height; y += gridSize) {
            ctx.moveTo(0, y);
            ctx.lineTo(width, y);
        }
        ctx.stroke();
    }
    
    onWidthChanged: requestPaint()
    onHeightChanged: requestPaint()
}
