import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    property double slopex1: 0
    property double slopex2: 0
    property double slopey1: 0
    property double slopey2: 0
    property double firstSlopePair: 0
    property double secondSlopePair: 0
    property double slopeResult: 0

    header: Label {
        text: qsTr("Slope Formula")
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
            slopex1 = textField1.text
        }
    }

    TextField {
        id: textField2
        x: 400
        y: 68
        placeholderText: qsTr("input y1")

        onTextChanged:{
            slopey1 = textField2.text
        }
    }

    TextField {
        id: textField3
        x: 400
        y: 136
        placeholderText: qsTr("input x2")

        onTextChanged:{
            slopex2 = textField3.text
        }
    }

    TextField {
        id: textField4
        x: 400
        y: 182
        placeholderText: qsTr("input y2")

        onTextChanged:{
            slopey2 = textField4.text
        }
    }

    Button {
        id: button
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            firstSlopePair = slopey2 - slopey1
            secondSlopePair = slopex2 - slopex1
            slopeResult = firstSlopePair / secondSlopePair
            text1.text = "m = " + slopeResult
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
