import Presentation 1.0
import Qt.labs.presentation 1.0
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Presentation {
    id: presentation

    anchors.fill: parent
    fontFamily: fontLoader.name


    FontLoader {
        id: fontLoader
        source: "qrc:///OpenSansEmoji.ttf"
    }

    SlideCounter {
        visible: presentation.currentSlide != 0
        anchors {  left: introSlide.left; right: introSlide.right }

        Label {
            font.family: fontLoader.name
            font.pixelSize: parent.font.pixelSize
            anchors { baseline: parent.baseline; horizontalCenter: parent.horizontalCenter }
            text: "%1 - Jesús Fernández".arg(new Date().toLocaleDateString(Qt.locale()))
        }
    }

    RowLayout {
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        Image {
            height: qtVersionLabel.paintedHeight
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/build_with_qt.png"
        }

        Label {
            id: qtVersionLabel
            text: NativeInterface.qtVersion
            font.bold: true
        }
    }

    Clock {
        anchors {  left: undefined; right: introSlide.right }
    }

    Slide {
        id: introSlide

        Text {
            anchors.fill: parent
            textFormat: Text.PlainText
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: NativeInterface.title
            font.family: fontLoader.name
            font.pixelSize: introSlide.baseFontSize * 2
        }

        Text {
            text: "Jesús Fernández"
            anchors.verticalCenter: parent.verticalCenter
            font.family: fontLoader.name
            font.pixelSize: introSlide.baseFontSize
        }

        Text {
            text: new Date().toLocaleDateString(Qt.locale())
            anchors.bottom: parent.bottom
            font.family: fontLoader.name
            font.pixelSize: introSlide.baseFontSize
        }
    }

    Slide {
        title: "Agenda"
        content: [
            " Intro",
            " Qt for WebAssembly",
            "  Features",
            "  Limitations",
            "  Demos",
            " Questions?",
        ]
    }

    Slide {
        title: "Intro: Jesús Fernández"
        content: [
            "Current:",
            " Technical Lead @ Pix4D",
            " @Qt Project:",
            "  Maintainer of:",
            "   Qt Http Server (not merged)",
            "   Qt Network Auth (since 5.8)",
            "   Qt WebGL Streaming (since 5.10)",
            "Previous:",
            " The Qt Company, Gameloft, HP, Panda Security"
        ]
    }

    Slide {
        title: "Qt for WebAssembly"
        content: [
            "Introduced in Qt 5.12 as a Tech Preview",
            "Recommended emscripten versions:",
            " Qt 5.12 ➡️ 1.38.16",
            " Qt 5.13 ➡️ 1.38.27, multithreading support: 1.38.30",
            " Qt 5.14 ➡️ 1.38.27"
        ]
    }

    Slide {
        title: "Qt for WebAssembly - Features"
        content: [
            "HiDPI support (from Qt)",
            "Network Access:",
            " HTTP request to the web origin server, or to a server which supports CORS",
            " WebSocket support to any server",
            " TCP and UDP support using a websockify server",
            "Local file system support",
        ]
    }

    Slide {
        title: "Qt for WebAssembly - LFS support"

        Label {
            anchors.fill: parent
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: NativeInterface.fileContent
        }

        Button {
            anchors.centerIn: parent
            text: "Choose a file"
            onClicked: NativeInterface.openFile()
        }
    }

    Slide {
        title: "Qt for WebAssembly - Limitations"
        content: [
            "No nested event loops",
            "It renders everything into a Canvas element",
            " Accesibility problems",
            " Text inputs won't trigger virtual keyboards",
            "OpenGL is required even if the application does not use it",
            "Mixing OpenGL and raster is not supported",
        ]
    }

    Slide {
        title: "Demo - %1".arg(helloWindowButton.text)
        Button {
            id: helloWindowButton
            anchors.fill: parent
            text: "Hello Window"
            onClicked: Qt.openUrlExternally("https://www.qt.io/web-assembly-example-hello-window")
        }
    }

    Slide {
        title: "Demo - %1".arg(quickControlsGalleryButton.text)
        Button {
            id: quickControlsGalleryButton
            anchors.fill: parent
            text: "Qt Quick Controls 2 Gallery"
            onClicked: Qt.openUrlExternally("https://www.qt.io/web-assembly-example-gallery")
        }
    }

    Slide {
        title: "Demo - %1".arg(slateButton.text)

        Button {
            id: slateButton
            anchors.fill: parent
            text: "Slate"
            onClicked: Qt.openUrlExternally("https://www.qt.io/web-assembly-example-slate")
        }
    }

    Slide {
        title: "Qt for WebAssembly - Limitations - No nested loops"
        Button {
            anchors.fill: parent
            text: "qApp->aboutQt();"
            onClicked: NativeInterface.showAboutQt()
        }
    }

    Slide {
        title: "More information"
        Button {
            property string url: "https://doc.qt.io/qt-5/wasm.html"
            anchors.centerIn: parent
            text: "<a href=\"%1\">%1</a>".arg(url)
            onClicked: Qt.openUrlExternally(url)
        }
    }

    Slide {
        title: "Questions?"
        content: [
            "IRC 💬 jefernan @ #qt-labs (freenode)",
            "Twitter 🐦 @jsfdez",
            "E-Mail 📧 jesus.fernandez@qt.io",
        ]
        Text {
            font.pixelSize: introSlide.baseFontSize / 2
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"%1\">%1</a>".arg(NativeInterface.url)
        }
    }
}
