import QtQuick 2.8
import QtQuick.Shapes 1.0
import Qt.labs.presentation 1.0

Presentation {
    id: presentation
    width: 1091
    height: 770

    property string title: "Creating a Qt Widgets application"
    property string url: "https://github.com/jsfdez/qpresentation/tree/ubuconeu18_qtwidgets"
    QtStyle { id: style }
    fontFamily: style.fontFamily
    codeFontFamily: style.codeFontFamily

    SlideCounter {
        visible: presentation.currentSlide != 0
        anchors {  left: introSlide.left; right: introSlide.right }
        color: style.gray

        Text {
            font.family: parent.font.family
            font.pixelSize: parent.font.pixelSize
            color: style.gray
            anchors { baseline: parent.baseline; horizontalCenter: parent.horizontalCenter }
            text: new Date().toDateString() + " - Jesús Fernández"
        }
    }

    Clock {
        anchors {  left: null; right: introSlide.right }
        color: style.gray
    }

    Slide {
        id: introSlide
        Text {
            text: presentation.title
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize * 2
        }

        Text {
            text: "Jesús Fernández"
            anchors.verticalCenter: parent.verticalCenter
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
        }

        Text {
            property var months: ["January", "February", "March", "April", "May", "June", "July",
                "August", "September", "October", "November", "December"]
            property string year: new Date().getFullYear()
            property string month: months[new Date().getMonth()]
            text: month + ", " + year
            color: style.gray
            anchors.bottom: parent.bottom
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
        }
    }

    Slide {
        title: "Agenda"
        content: [
            " Intro",
            " What's Qt?",
            " Qt Widgets",
            " Live coding",
            " Questions?",
        ]
    }

    Slide {
        title: "Intro: Jesús Fernández"
        content: [
            "Senior Software Engineer @ The Qt Company",
            "@Qt Project:",
            " Maintainer of:",
            "  Qt Network Auth (since 5.8)",
            "  Qt WebGL Streaming (since 5.10)",
        ]
    }

    Slide {
        title: "What's Qt?"
        content: [
            "/kjuːt/",
            "C++ framework",
            "Multiporpuse framework",
            "Different modules (core, gui, widgets, quick, network, 3D, multimedia, ...)",
        ]
    }

    Slide {
        title: "Qt Widgets"
        content: [
            "  Components to develop UI applications",
            "  Widgets should inherit from QWidget",
            "  Layout based",
            "  Suitable for desktop applications",
            "  Easy to use",
            "  Requires a QApplication",
            "  Custom components are easy to develop",
            "  QPainter is used to paint the widgets",
            "  Raster",
            "  Qt Designer and QtCreator",
            "  UIC: .ui parser and code generator",
            "  Considered stable",
        ]
    }

    Slide {
        centeredText: "Live coding"
    }

    Slide {
        title: "Questions?"
        content: [
            "IRC 💬 jefernan @ #qt-labs (freenode)",
            "Twitter 🐦 @jsfdez",
            "E-Mail 📬 jesus.fernandez@qt.io",
        ]
        Text {
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"" + presentation.url + "\">" + presentation.url + "</a>";
        }
    }
}
