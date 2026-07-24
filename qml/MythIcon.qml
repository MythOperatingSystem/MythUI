import QtQuick 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Canvas {
    id: iconCanvas
    property string name: "cmd"
    property color iconColor: MythColors.mythCyan
    property int iconSize: 18

    implicitWidth: iconSize
    implicitHeight: iconSize
    width: iconSize
    height: iconSize

    onNameChanged: requestPaint()
    onIconColorChanged: requestPaint()
    onIconSizeChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        ctx.fillStyle = "transparent";
        ctx.strokeStyle = iconColor;
        ctx.lineWidth = Math.max(1.5, iconSize / 12);
        ctx.lineCap = "round";
        ctx.lineJoin = "round";

        var w = width;
        var h = height;

        var lowerName = name.toLowerCase();

        if (lowerName === "cmd" || lowerName === "myth") {
            ctx.beginPath();
            ctx.moveTo(w*0.5, h*0.1);
            ctx.lineTo(w*0.9, h*0.5);
            ctx.lineTo(w*0.5, h*0.9);
            ctx.lineTo(w*0.1, h*0.5);
            ctx.closePath();
            ctx.stroke();
            ctx.fillStyle = iconColor;
            ctx.beginPath();
            ctx.arc(w*0.5, h*0.5, w*0.12, 0, Math.PI*2);
            ctx.fill();
        } else if (lowerName === "terminal") {
            ctx.beginPath();
            ctx.rect(w*0.1, h*0.15, w*0.8, h*0.7);
            ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(w*0.25, h*0.4);
            ctx.lineTo(w*0.45, h*0.5);
            ctx.lineTo(w*0.25, h*0.6);
            ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(w*0.52, h*0.65);
            ctx.lineTo(w*0.72, h*0.65);
            ctx.stroke();
        } else if (lowerName === "hub" || lowerName === "activity") {
            ctx.beginPath();
            ctx.moveTo(w*0.2, h*0.8); ctx.lineTo(w*0.2, h*0.5);
            ctx.moveTo(w*0.5, h*0.8); ctx.lineTo(w*0.5, h*0.25);
            ctx.moveTo(w*0.8, h*0.8); ctx.lineTo(w*0.8, h*0.4);
            ctx.stroke();
            ctx.fillStyle = iconColor;
            ctx.beginPath();
            ctx.arc(w*0.5, h*0.25, w*0.08, 0, Math.PI*2);
            ctx.fill();
        } else if (lowerName === "store" || lowerName === "shoppingbag") {
            ctx.beginPath();
            ctx.moveTo(w*0.5, h*0.15); ctx.lineTo(w*0.85, h*0.35); ctx.lineTo(w*0.85, h*0.75);
            ctx.lineTo(w*0.5, h*0.95); ctx.lineTo(w*0.15, h*0.75); ctx.lineTo(w*0.15, h*0.35);
            ctx.closePath(); ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(w*0.5, h*0.15); ctx.lineTo(w*0.5, h*0.95);
            ctx.moveTo(w*0.15, h*0.35); ctx.lineTo(w*0.5, h*0.55); ctx.lineTo(w*0.85, h*0.35);
            ctx.stroke();
        } else if (lowerName === "ai" || lowerName === "sparkles" || lowerName === "bot") {
            ctx.beginPath();
            ctx.moveTo(w*0.5, h*0.05);
            ctx.quadraticCurveTo(w*0.5, h*0.5, w*0.95, h*0.5);
            ctx.quadraticCurveTo(w*0.5, h*0.5, w*0.5, h*0.95);
            ctx.quadraticCurveTo(w*0.5, h*0.5, w*0.05, h*0.5);
            ctx.quadraticCurveTo(w*0.5, h*0.5, w*0.5, h*0.05);
            ctx.closePath();
            ctx.fillStyle = iconColor;
            ctx.fill();
        } else if (lowerName === "handoff" || lowerName === "docs" || lowerName === "code") {
            ctx.beginPath();
            ctx.moveTo(w*0.2, h*0.1); ctx.lineTo(w*0.6, h*0.1); ctx.lineTo(w*0.8, h*0.3);
            ctx.lineTo(w*0.8, h*0.9); ctx.lineTo(w*0.2, h*0.9); ctx.closePath();
            ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(w*0.35, h*0.4); ctx.lineTo(w*0.65, h*0.4);
            ctx.moveTo(w*0.35, h*0.6); ctx.lineTo(w*0.65, h*0.6);
            ctx.stroke();
        } else if (lowerName === "search") {
            ctx.beginPath(); ctx.arc(w*0.45, h*0.45, w*0.3, 0, Math.PI*2); ctx.stroke();
            ctx.beginPath(); ctx.moveTo(w*0.65, h*0.65); ctx.lineTo(w*0.9, h*0.9); ctx.stroke();
        } else if (lowerName === "wifi") {
            ctx.beginPath(); ctx.arc(w*0.5, h*0.8, w*0.6, Math.PI*1.2, Math.PI*1.8); ctx.stroke();
            ctx.beginPath(); ctx.arc(w*0.5, h*0.8, w*0.38, Math.PI*1.25, Math.PI*1.75); ctx.stroke();
            ctx.fillStyle = iconColor;
            ctx.beginPath(); ctx.arc(w*0.5, h*0.8, w*0.1, 0, Math.PI*2); ctx.fill();
        } else if (lowerName === "volume") {
            ctx.beginPath();
            ctx.moveTo(w*0.15, h*0.4); ctx.lineTo(w*0.35, h*0.4); ctx.lineTo(w*0.55, h*0.2);
            ctx.lineTo(w*0.55, h*0.8); ctx.lineTo(w*0.35, h*0.6); ctx.lineTo(w*0.15, h*0.6);
            ctx.closePath(); ctx.stroke();
            ctx.beginPath(); ctx.arc(w*0.55, h*0.5, w*0.25, -Math.PI*0.3, Math.PI*0.3); ctx.stroke();
        } else if (lowerName === "battery") {
            ctx.beginPath(); ctx.rect(w*0.15, h*0.3, w*0.65, h*0.4); ctx.stroke();
            ctx.fillStyle = iconColor;
            ctx.fillRect(w*0.82, h*0.4, w*0.08, h*0.2);
            ctx.fillRect(w*0.2, h*0.36, w*0.4, h*0.28);
        } else if (lowerName === "bell") {
            ctx.beginPath();
            ctx.moveTo(w*0.5, h*0.15); ctx.lineTo(w*0.75, h*0.65); ctx.lineTo(w*0.25, h*0.65);
            ctx.closePath(); ctx.stroke();
            ctx.beginPath(); ctx.arc(w*0.5, h*0.75, w*0.1, 0, Math.PI*2); ctx.stroke();
        } else if (lowerName === "user") {
            ctx.beginPath(); ctx.arc(w*0.5, h*0.35, w*0.22, 0, Math.PI*2); ctx.stroke();
            ctx.beginPath(); ctx.arc(w*0.5, h*0.95, w*0.42, Math.PI*1.1, Math.PI*1.9); ctx.stroke();
        } else if (lowerName === "power") {
            ctx.beginPath(); ctx.arc(w*0.5, h*0.5, w*0.35, -Math.PI*0.3, Math.PI*1.3); ctx.stroke();
            ctx.beginPath(); ctx.moveTo(w*0.5, h*0.12); ctx.lineTo(w*0.5, h*0.48); ctx.stroke();
        } else if (lowerName === "bluetooth") {
            ctx.beginPath();
            ctx.moveTo(w*0.3, h*0.25); ctx.lineTo(w*0.7, h*0.75); ctx.lineTo(w*0.5, h*0.95);
            ctx.lineTo(w*0.5, h*0.05); ctx.lineTo(w*0.7, h*0.25); ctx.lineTo(w*0.3, h*0.75);
            ctx.stroke();
        } else if (lowerName === "tools" || lowerName === "settings") {
            ctx.beginPath();
            ctx.moveTo(w*0.2, h*0.8); ctx.lineTo(w*0.8, h*0.2);
            ctx.moveTo(w*0.4, h*0.2); ctx.lineTo(w*0.8, h*0.2); ctx.lineTo(w*0.8, h*0.6);
            ctx.stroke();
        } else if (lowerName === "metrics") {
            ctx.beginPath();
            ctx.moveTo(w*0.1, h*0.7); ctx.lineTo(w*0.35, h*0.3); ctx.lineTo(w*0.6, h*0.6); ctx.lineTo(w*0.9, h*0.2);
            ctx.stroke();
        } else {
            ctx.beginPath(); ctx.rect(w*0.15, h*0.15, w*0.7, h*0.7); ctx.stroke();
            ctx.moveTo(w*0.15, h*0.38); ctx.lineTo(w*0.85, h*0.38); ctx.stroke();
        }
    }
}
