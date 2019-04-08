import QtQuick 2.8
import QtQuick.Shapes 1.0
import Qt.labs.presentation 1.0

Presentation {
    id: presentation

    property string title: "Qt Http Server"
    property string url: "https://github.com/jsfdez/qpresentation/tree/pf_qhttpserver"
    QtStyle { id: style }
    fontFamily: style.fontFamily
    codeFontFamily: style.codeFontFamily

    function makeRequest(url, object, prop) {
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
            } else if (doc.readyState === XMLHttpRequest.DONE) {
                object[prop] = doc.responseText
            }
        }

        doc.open("GET", url);
        doc.send();
        return doc;
    }

    SlideCounter {
        visible: presentation.currentSlide != 0
        anchors {  left: introSlide.left; right: introSlide.right }
        color: style.gray

        Text {
            font.family: parent.font.family
            font.pixelSize: parent.font.pixelSize
            color: style.gray
            anchors { baseline: parent.baseline; horizontalCenter: parent.horizontalCenter }
            text: new Date().toDateString() + " - C&N Team"
        }
    }

    Clock {
        anchors {  left: undefined; right: introSlide.right }
        color: style.gray
    }

    Slide {
        id: introSlide
        Text {
            anchors.fill: parent
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: presentation.title
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize * 2
        }

        Text {
            text: "C&N (Oslo)"
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
            " QAbstractHttpServer",
            "  QHttpServerResponder",
            " QHttpServer",
            " QML Http Server",
            " Questions?",
        ]
    }

    Slide {
        title: "Intro"
        delayPoints: true
        content: [
            "Created by the C&N Team in Oslo",
            "qt-labs/qthttpserver @ Gerrit (WIP)",
            "Targets:",
            " Avoid code duplication",
            " Easy to integrate in Qt applications",
            " Not intrusive",
            " Ease creation of REST services",
            " Explore new APIs",
        ]
    }

    CustomCodeSlide {
        title: "QAbstractHttpServer"
        code: "struct HttpServer : QAbstractHttpServer {
    bool handleRequest(const QHttpServerRequest &request, QTcpSocket *socket) override {
        socket->write(...);
        return true;
    }
} server;
server.bind();"
    }

    Slide {
        title: "QHttpServerResponder"
        centeredText: "It wraps a QAbstractSocket* and creates an interface to make replying " +
            "HTTP requests easier"
    }

    Slide {
        title: "QHttpServer"
        content: [
            "Easy to write",
            "Syntax inspired by Flask",
            "Extensible API",
        ]
    }

    CustomCodeSlide {
        title: "QHttpServer"
        Component.onCompleted: makeRequest("https://raw.githubusercontent.com/jsfdez/qpresentation/pf_qhttpserver/simple.cpp",
                                           this, "code")
    }

    Slide {
        title: "QML Http Server"
        content: [
            "Creates an HTTP Server from QML",
            "It can be used for debugging",
            "Allows authorization flows",
            "Prototyping",
        ]
    }

    CustomCodeSlide {
        title: "QML Http Server"
        Component.onCompleted: makeRequest("https://raw.githubusercontent.com/jsfdez/qpresentation/pf_qhttpserver/declarativehttpserver.qml",
                                           this, "code")
    }

    Slide {
        title: "Questions?"
        centeredText: "Thank you!"
        Text {
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"" + presentation.url + "\">" + presentation.url + "</a>";
        }
    }
}
