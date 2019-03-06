import QtQuick 2.8
import QtQuick.Layouts 1.11
import Qt.labs.presentation 1.0
import QtWebEngine 1.8

Presentation {
    id: presentation

    property string title: "Corrutinas y Qt"
    property string url: "https://github.com/jsfdez/qpresentation/tree/coroutines_and_qt"

    codeFontFamily: "Source Code Pro"

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

        Text {
            font.family: parent.font.family
            font.pixelSize: parent.font.pixelSize
            anchors { baseline: parent.baseline; horizontalCenter: parent.horizontalCenter }
            text: (new Date).getDate() + "/" + ((new Date).getMonth() + 1)  + "/" +
                  (new Date).getFullYear() + " - Jesús Fernández"
        }
    }

    Clock { anchors {  left: undefined; right: introSlide.right } }

    Slide {
        id: introSlide
        Text {
            anchors.fill: parent
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: presentation.title
            font.pixelSize: introSlide.baseFontSize * 2
        }

        Text {
            text: "Jesús Fernández"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: introSlide.baseFontSize
        }

        Text {
            property var months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
                "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
            property string year: new Date().getFullYear()
            property string month: months[new Date().getMonth()]
            text: month + ", " + year
            anchors.bottom: parent.bottom
            font.pixelSize: introSlide.baseFontSize
        }
    }

    Slide {
        id: index
        title: "Índice"
        content: {
            var titles = []
            for (var i=0; i<presentation.children.length; ++i) {
                var r = presentation.children[i];
                if (r.isSlide && r !== introSlide && r !== index) {
                    titles.push("   " + r.title)
                }
            }
            return titles
        }
    }

    Slide {
        title: "¿Quién soy?"
        content: [
            "Jesús Fernández",
            " IRC 💬 jefernan @ #qt-labs (freenode)",
            " Twitter 🐦 @jsfdez",
            " E-Mail 📬 jesus.fernandez@qt.io // jsfdez@gmail.com",
            "Desarrollador C/C++",
            "Contribuidor de Qt",
        ]
    }

    Slide {
        title: "¿Qué es Qt?"
        content: [
            "Framework C++",
            "Usado en desarrollo de aplicaciones de escritorio, móviles, automoción, automatización"
            + " dispositivos médicos, MCUs, ...",
            "⚠️",
        ]
    }

    Slide {
        title: "¿Qué es C++?"
        Image {
            source: "https://www.shankman.com/wp-content/uploads/shankman.comimagesimguploaderimagesare-you-kidding-me-6a0ac179c573171e9b9fa5b7b9bc7c366275b640-380x365.jpg"
            anchors.centerIn: parent
        }
    }

    Slide {
        title: "¿Qué son las corrutinas?"
        textFormat: Text.StyledText
        content: [
            " <i>Una corrutina es una unidad de tratamiento semejante a una subrutina, "
            + "con la diferencia de que, mientras que la salida de una subrutina pone fin a esta, "
            + "la salida de una corrutina puede ser el resultado de una suspensión de su "
            + "tratamiento hasta que se le indique retomar su ejecución (multitarea cooperativa). "
            +"La suspensión de la corrutina y su reanudación pueden ir acompañadas de una "
            +"transmisión de datos.</i>",
            " Dos tipos:",
            "  Stackless",
            "   Sólo guardan el las variables locales y su posición en la ejecución",
            "  Stackful",
            "   Guardan toda la pila",
        ]
    }

    Slide {
        title: "¿Qué lenguajes soportan corrutinas?"

        WebEngineView {
            anchors.fill: parent
            url: "https://en.wikipedia.org/wiki/Coroutine#Programming_languages_with_native_support"
            zoomFactor: 1.25
        }
    }

    Slide {
        title: "Casos de uso en corrutinas"
        content: [
            "Generadores",
            "Facilitar la creación de código asíncrono",
            "Multitarea cooperativa",
        ]
    }

    Slide {
        title: "Disponibilidad en C++"
        content: [
            "Clang >= 5",
            " -fcoroutines-ts",
            " -stdlib=libc++",
            "Visual Stuatio C++ >= 2015 ⛐"
        ]
    }

    Slide {
        id: coReturnSlide
        title: "co_return y co_await"

        baseFontSize: fontSize * fontScale * 0.7

        ColumnLayout {
            anchors.fill: parent
            Code {
                property real baseFontSize: coReturnSlide.baseFontSize
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: parent.height * 2 / 3
                Component.onCompleted: makeRequest("http://localhost:8080/co_return.cpp", this,
                                                   "code")
            }
            Code {
                property real baseFontSize: coReturnSlide.baseFontSize
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: parent.height / 3
                Component.onCompleted: makeRequest("http://localhost:8080/co_return.txt", this,
                                                   "code")
            }
        }
    }

    CodeSlide {
        title: "co_yield"
        Component.onCompleted: makeRequest("http://localhost:8080/fibonacci.cpp", this, "code")
    }

    CodeSlide {
        title: "struct promise_type"
        Component.onCompleted: makeRequest("http://localhost:8080/promise_type.h", this, "code")
    }

    CodeSlide {
        title: "operator co_await()"
        Component.onCompleted: makeRequest("http://localhost:8080/operator_coawait.h", this, "code")
    }

    Slide {
        title: "Demo"

        Image {
            source: "https://ak9.picdn.net/shutterstock/videos/21743569/thumb/1.jpg"
            anchors.centerIn: parent
        }
    }

    Slide {
        title: "Conclusiones"

        Image {
            source: "https://openclipart.org/download/238687/Boy-asking-question.svg"
            anchors.centerIn: parent
        }
    }

    Slide {
        title: "¿Preguntas?"
        centeredText: "¡Muchas gracias!"

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
            font.pixelSize: introSlide.baseFontSize
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            text: "<a href=\"" + presentation.url + "\">" + presentation.url + "</a>";
        }
    }
}
