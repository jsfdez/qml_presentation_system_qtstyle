import QtQuick 2.8
import QtQuick.Shapes 1.0
import Qt.labs.presentation 1.0

Presentation {
    id: presentation
    width: 1091
    height: 770

    property string title: "Creating a Qt Quick application"
    property string url: "https://github.com/jsfdez/qpresentation/tree/ubuconeu18_qtquick"
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
            " QML",
            " Qt Quick",
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
            "Different modules (core, gui, widgets, quick, network, 3D, multimedia, ...)"
        ]
    }

    Slide {
        title: "QML"
        content: [
            "Declarative language",
            "Bindings, allowing relations between objects",
            "Embed Javascript code",
            "Debugging integrated in Qt Creator",
            "It can be compiled to bytecode to improve application loading times"
        ]
    }

    Slide {
        title: "Qt Quick"
        content: [
            " Fast and easy way to create applications",
            " Responsive applications, suitable for mobile devices",
            " Anchor based",
            " Easy to use",
            " Requires a QGuiApplication",
            " You can build custom components from other components, from QML",
            " You can build custom components from scratch, from C++",
            " Hardware accelerated",
            " Qt Quick Designer in QtCreator",
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
