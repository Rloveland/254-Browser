//Authors: Nathan Tran, Reeder Loveland, Richard Vu

import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    property double pi: 3.14159265359

    property double h: 0.0
    property double k: 0.0
    property double r: 0.0

    property double diameter: 0.0
    property double circumference: 0.0
    property double area: 0.0

    header: Label {
        text: qsTr("Equation of a Circle")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    TextField {
        id: input_h
        x: 400
        y: 22
        placeholderText: qsTr("input h")
    }

    TextField {
        id: input_k
        x: 400
        y: 68
        placeholderText: qsTr("input k")
    }

    TextField {
        id: input_r
        x: 400
        y: 136
        placeholderText: qsTr("input r")
    }


    Button {
        id: calculateCircleButton
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            h = input_h.displayText
            k = input_k.displayText
            r = input_r.displayText

            circleEquationOutput.text = "(x - " + h + ")^2 + (y - " + k + ")^2 = " + r + "^2"

            diameter = 2 * r
            circumference = 2 * pi * r
            area = pi * r * r

            circleDataOutput.text = "d = " + diameter + ", C = " + circumference + ", A = " + area
        }
    }

    Text {
        id: label_h
        x: 368
        y: 33
        text: qsTr("h")
        font.pixelSize: 16
    }

    Text {
        id: label_k
        x: 368
        y: 79
        text: qsTr("k")
        font.pixelSize: 16
    }

    Text {
        id: label_r
        x: 370
        y: 147
        text: qsTr("r")
        font.pixelSize: 16
    }

    Text {
        id: circleDataOutput
        x: 59
        y: 353
        color: "#7fdd0000"
        text: qsTr("Data Output")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }

    Text {
        id: circleEquationOutput
        x: 59
        y: 315
        width: 152
        height: 23
        color: "#7f0011fb"
        text: qsTr("Equation Output")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
