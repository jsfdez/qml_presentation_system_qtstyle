import QtQuick 2.8
import QtQuick.Shapes 1.0
import Qt.labs.presentation 1.0
import QtWebView 1.1

Presentation {
    id: presentation
    width: 1091
    height: 770

    property real fontScale: 0.7
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
            text: "10 April 2018 - Jesús Fernández"
        }
    }

    Clock {
        anchors {  left: null; right: introSlide.right }
        color: style.gray
    }

    Slide {
        id: introSlide
        Text {
            text: "Qt Roadmap"
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
            text: "April, 2018"
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
            " Past",
            "  What we worked on?",
            " Present",
            "  What we work on?",
            " Future",
            "  What's next?",
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
        title: "Past: [Qt 5.6, Qt 5.9)"
        content: [
            " C++11 Support",
            " New modules:",
            "  Qt Quick Controls 2",
            "  Qt Serial Bus",
            "  Qt Wayland Compositor",
            "  Qt SCXML",
            "  Qt Speech",
            "  Qt NetworkAuth",
        ]
    }

    Slide {
        title: "Past: Qt 5.9"
        content: [
            " LTS",
            " QtQuick optimizations",
            " Qt3D improvements",
            " INTEGRITY support is back",
            " HTTP Strict Transport Security (HSTS)",
            " New modules:",
            "  Qt Remote Objects",
        ]

        Text {
            anchors.bottom: parent.bottom
            font.family: presentation.fontFamily
            font.pixelSize: parent.baseFontSize
            text: "<a href=\"http://wiki.qt.io/New_Features_in_Qt_5.9\">
                   http://wiki.qt.io/New_Features_in_Qt_5.9</a>"
        }
    }

    Slide {
        title: "Past: Qt 5.10"
        content: [
            " Vulkan",
            " Introduction of QStringView and QRandomGenerator",
            " QtQuickShapes 1.0 and Qt.labs.handlers",
            " Qt3D: Skeletal Animation System (TP) and new Scene2D",
            " New modules:",
            "  Qt WebGL Streaming",
        ]

        Text {
            anchors.bottom: parent.bottom
            font.family: presentation.fontFamily
            font.pixelSize: parent.baseFontSize
            text: "<a href=\"http://wiki.qt.io/New_Features_in_Qt_5.10\">
                   http://wiki.qt.io/New_Features_in_Qt_5.10</a>"
        }
    }

    Slide {
        title: "Past: More info"

        WebView {
            anchors { top: parent.top; left: parent.left; right: parent.right;
                bottom: pastMoreInfo.top }
            url: "http://blog.qt.io/blog/2017/02/22/qt-roadmap-for-2017/"
        }
        Text {
            id: pastMoreInfo
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"http://blog.qt.io/blog/2017/02/22/qt-roadmap-for-2017/\">
                   http://blog.qt.io/blog/2017/02/22/qt-roadmap-for-2017/</a>";
        }
    }

    Slide {
        title: "Present: Qt 5.11"
        content: [
            " 3D Engine unification (Qt 3D and NVIDIA 3D Engine)",
            " QtQml: Compiler pipeline rewrite. New bytecode interpreter. QMLC files are now fully platform dependant",
            " Added QStringView y QRandomGenerator",
            " New templates to use with QtQuickControls 2 (Photoshop, Sketch, Illustrator, ...)",
            " Accessibility improvements",
            " Qt for Python",
        ]

        Text {
            anchors.bottom: parent.bottom
            font.family: presentation.fontFamily
            font.pixelSize: parent.baseFontSize
            text: "<a href=\"http://wiki.qt.io/New_Features_in_Qt_5.11\">
                   http://wiki.qt.io/New_Features_in_Qt_5.11</a>"
        }
    }

    Slide {
        title: "Present: Qt 3D Studio"
        WebView {
            anchors.fill: parent
            url: slides[currentSlide].title === parent.title
                 ? "http://www.youtube.com/embed/YKuuDtEMjpk?autoplay=1&start=7&allowfullscreen=1"
                 : ""
        }
    }

    Slide {
        title: "Present: More info"

        WebView {
            anchors { top: parent.top; left: parent.left; right: parent.right;
                bottom: presentMoreInfo.top }
            url: "http://blog.qt.io/blog/2018/02/22/qt-roadmap-2018"
        }
        Text {
            id: presentMoreInfo
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"http://blog.qt.io/blog/2018/02/22/qt-roadmap-2018/\">
                   http://blog.qt.io/blog/2018/02/22/qt-roadmap-2018/</a>";
        }
    }

    Slide {
        title: "Future: Qt 5.12"
        content: [
            " LTS",
            " WebAssembly",
            " Metal Support",
            " Qt on Microcontrollers",
            " QtQuickControls 2: TableView",
            " QtHttpServer",
        ]
    }

    Slide {
        title: "Future: Improved tooling"
        WebView {
            anchors.fill: parent
            url: slides[currentSlide].title === parent.title
                 ? "http://www.youtube.com/embed/wRMkfdZ_ZxI?autoplay=1&start=12&allowfullscreen=1"
                 : ""
        }
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
            text: "<a href=\"https://github.com/jsfdez/qpresentation/tree/qt_roadmap_2018/\">
                   https://github.com/jsfdez/qpresentation/tree/qt_roadmap_2018</a>";
        }
    }
}
