import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    TextField {
        id: textField1
        x: 200
        y: 74
        placeholderText: qsTr("Text Field")

        onTextChanged: console.log("Help")
    }

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 4.")
        anchors.centerIn: parent
    }
}
