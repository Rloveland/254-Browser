import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    property double distx1: 0
    property double distx2: 0
    property double disty1: 0
    property double disty2: 0
    property double firstDistPair: 0
    property double secondDistPair: 0
    property double distResult: 0

    header: Label {
        text: qsTr("Distance Formula")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    TextField {
        id: textField1
        x: 400
        y: 22
        placeholderText: qsTr("input x1")

        onTextChanged:{
            distx1 = textField1.text
        }
    }

    TextField {
        id: textField2
        x: 400
        y: 68
        placeholderText: qsTr("input y1")

        onTextChanged:{
            disty1 = textField2.text
        }
    }

    TextField {
        id: textField3
        x: 400
        y: 136
        placeholderText: qsTr("input x2")

        onTextChanged:{
            distx2 = textField3.text
        }
    }

    TextField {
        id: textField4
        x: 400
        y: 182
        placeholderText: qsTr("input y2")

        onTextChanged:{
            disty2 = textField4.text
        }
    }

    Button {
        id: button
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            firstDistPair = distx1 - distx2
            firstDistPair *= firstDistPair

            secondDistPair = disty1 - disty2
            secondDistPair *= secondDistPair

            distResult = Math.sqrt(firstDistPair + secondDistPair)

            text1.text = "d = " + distResult
        }
    }

    Text {
        id: text2
        x: 368
        y: 33
        text: qsTr("x1")
        font.pixelSize: 16
    }

    Text {
        id: text3
        x: 368
        y: 79
        text: qsTr("y1")
        font.pixelSize: 16
    }

    Text {
        id: text4
        x: 368
        y: 193
        text: qsTr("y2")
        font.pixelSize: 16
    }

    Text {
        id: text5
        x: 368
        y: 147
        text: qsTr("x2")
        font.pixelSize: 16
    }

    Text {
        id: text1
        x: 392
        y: 318
        color: "#7f353637"
        text: qsTr("Result Will Appear Here")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
