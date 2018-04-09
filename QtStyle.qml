import QtQuick 2.0
import QtQuick.Shapes 1.0

Item {
    id: root
    property alias fontFamily: titilium.name
    property alias codeFontFamily: titiliumLight.name
    property color green: "#21be2b"
    property color gray: "#9d9faa"

    FontLoader {
        id: titilium
        source: "TitilliumWeb-SemiBold.ttf"
    }

    FontLoader {
        id: titiliumLight
        source: "TitilliumWeb-Light.ttf"
    }

    anchors.fill: parent
    Shape {
        id: topLeftCorner
        anchors.top: parent.top; anchors.left: parent.left
        width: root.width * 0.036
        height: width
        ShapePath {
            fillColor: green
            strokeColor: fillColor
            startX: 0
            startY: topLeftCorner.width
            PathLine { x: topLeftCorner.width; y: 0 }
            PathLine { x: 0; y: 0 }
        }
    }

    Shape {
        id: bottomRightCorner
        anchors.bottom: parent.bottom; anchors.right: parent.right
        width: root.width * 0.036
        height: width
        ShapePath {
            fillColor: green
            strokeColor: fillColor
            startX: 0
            startY: bottomRightCorner.width
            PathLine { x: bottomRightCorner.width; y: bottomRightCorner.width }
            PathLine { x: bottomRightCorner.width; y: 0 }
        }
    }

    Image {
        visible: parent.parent.currentSlide === 0
        source: "qt.png"
        anchors.left: topLeftCorner.right
        anchors.top: topLeftCorner.bottom
        width: (sourceSize.width / 2.5 / 1920) * root.width
        height: (sourceSize.height / 2.5 / 1080) * root.height
        fillMode: Image.PreserveAspectFit
    }
}
