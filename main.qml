import QtQuick 2.13
import QtQuick.Controls 2.13

ApplicationWindow {
    visible: true

    title: Qt.application.name

    Style { id: style }

    SlideDeck {
        anchors.fill: parent
    }
}
