import QtQuick 2.8
import QtQuick.Layouts 1.11
import Qt.labs.presentation 1.0
import QtWebEngine 1.8

Presentation {
    id: presentation

    property string title: "QCoroutines"
    property string branch: "coroutines"
    property string url: "https://github.com/jsfdez/qpresentation/tree/" + branch
    property string baseUrl: "https://raw.githubusercontent.com/jsfdez/qpresentation/" + branch + "/"

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
            text: (new Date).getDate() + "/" + ((new Date).getMonth() + 1)  + "/" +
                  (new Date).getFullYear() + " - Jesús Fernández"
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
        id: index
        title: "Index"
        content: {
            var titles = []
            for (var i=0; i < presentation.children.length; ++i) {
                var r = presentation.children[i];
                if (r.isSlide && r !== introSlide && r !== index
                        && r.title[r.title.length - 1] !== ')') {
                    titles.push("   " + r.title)
                }
            }
            return titles
        }
    }

    Slide {
        title: "Coroutines?"
        textFormat: Text.StyledText
        content: [
            " <i>Coroutines are computer program components that generalize subroutines for " +
                "non-preemptive multitasking, by allowing execution to be suspended and " +
                "resumed.</i>",
            " Types:",
            "  Stackless",
            "   Store local variables and registers",
            "  Stackful",
            "   Store the full stack",
        ]
    }

    Slide {
        title: "Supported languagues"

        WebEngineView {
            anchors.fill: parent
            url: "https://en.wikipedia.org/wiki/Coroutine#Programming_languages_with_native_support"
            zoomFactor: 1.25
        }
    }

    Slide {
        title: "Use-cases"
        content: [
            "Generators",
            "Ease asynchronous code",
            "Cooperative multitasking",
            "State-machines",
            "Event dispatchers",
        ]
    }

    Slide {
        title: "Requirements"
        content: [
            "Clang >= 5",
            " -fcoroutines-ts",
            " -stdlib=libc++",
            "Visual Stuatio C++ >= 2015 ⛐"
        ]
    }

    CustomCodeSlide {
        title: "co_return y co_await"
        Component.onCompleted: makeRequest(baseUrl + "co_return.cpp", this, "code")
    }

    CustomCodeSlide {
        title: "co_yield"
        Component.onCompleted: makeRequest(baseUrl + "fibonacci.cpp", this, "code")
    }

    CustomCodeSlide {
        title: "struct promise_type"
        Component.onCompleted: makeRequest(baseUrl + "promise_type.h", this, "code")
    }

    CustomCodeSlide {
        title: "operator co_await"
        Component.onCompleted: makeRequest(baseUrl + "operator_coawait.h", this, "code")
    }

    CustomCodeSlide {
        title: "operator co_await (2)"
        Component.onCompleted: makeRequest(baseUrl + "co_await2.cpp", this, "code")
    }

    Slide {
        title: "Demo"

        Image {
            source: "https://mentorphiledotcom.files.wordpress.com/2018/09/livedemo-1.png?w=840"
            anchors.centerIn: parent
        }
    }

    Slide {
        title: "Conclusions"

        Image {
            source: "https://openclipart.org/download/238687/Boy-asking-question.svg"
            anchors.centerIn: parent
        }
    }

    Slide {
        title: "Questions?"
        centeredText: "Thank you!"

        Timer {
            id: thanksTimer
            running: parent.visible
            interval: 3000
            repeat: false
            onTriggered: {
                parent.content = [
                            " IRC 💬 jefernan @ #qt-labs (freenode)",
                            " Twitter 🐦 @jsfdez",
                            " E-Mail 📬 jesus.fernandez@qt.io // jsfdez@gmail.com",
                        ]
            }
        }

        Text {
            font.family: style.fontFamily
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"" + presentation.url + "\">" + presentation.url + "</a>";
        }
    }
}
