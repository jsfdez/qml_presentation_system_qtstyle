import Presentation 1.0
import Qt.labs.presentation 1.0
import QtQuick 2.13
import QtQuick.Controls 2.13

Presentation {
    id: presentation

    anchors.fill: parent

    SlideCounter {
        visible: presentation.currentSlide != 0
        anchors {  left: introSlide.left; right: introSlide.right }

        Label {
            font.family: parent.font.family
            font.pixelSize: parent.font.pixelSize
            anchors { baseline: parent.baseline; horizontalCenter: parent.horizontalCenter }
            text: "%1 - Jesús Fernández".arg(new Date().toLocaleDateString(Qt.locale()))
        }
    }

    Clock {
        anchors {  left: undefined; right: introSlide.right }
    }

    Slide {
        id: introSlide
        Label {
            anchors.fill: parent
            textFormat: Text.PlainText
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: Constants.title
            font.pixelSize: introSlide.baseFontSize * 2
        }

        Label {
            text: "Jesús Fernández"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: introSlide.baseFontSize
        }

        Label {
            text: new Date().toLocaleDateString(Qt.locale())
            anchors.bottom: parent.bottom
            font.pixelSize: introSlide.baseFontSize
        }
    }

    Slide {
        title: "Agenda"
        content: [
            " Intro",
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
        title: "Questions?"
        content: [
            "IRC 💬 jefernan @ #qt-labs (freenode)",
            "Twitter 🐦 @jsfdez",
            "E-Mail 📧 jesus.fernandez@qt.io",
        ]

        Label {
            font.pixelSize: introSlide.baseFontSize / 2
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"%1\">%1</a>".arg(Constants.url)
        }
    }
}
