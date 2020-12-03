import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    property double midx1: 0
    property double midx2: 0
    property double midy1: 0
    property double midy2: 0
    property double firstMidPair: 0
    property double secondMidPair: 0

    header: Label {
        text: qsTr("Midpoint Formula")
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
            midx1 = textField1.text
        }
    }

    TextField {
        id: textField2
        x: 400
        y: 68
        placeholderText: qsTr("input y1")

        onTextChanged:{
            midy1 = textField2.text
        }
    }

    TextField {
        id: textField3
        x: 400
        y: 136
        placeholderText: qsTr("input x2")

        onTextChanged:{
            midx2 = textField3.text
        }
    }

    TextField {
        id: textField4
        x: 400
        y: 182
        placeholderText: qsTr("input y2")

        onTextChanged:{
            midy2 = textField4.text
        }
    }

    Button {
        id: button
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            firstMidPair = midx1 + midx2
            firstMidPair /= 2
            secondMidPair = (midy1 + midy2) / 2
            text1.text = "Midpoint = (" + firstMidPair + ", " + secondMidPair + ")"
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
