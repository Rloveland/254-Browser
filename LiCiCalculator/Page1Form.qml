//Authors: Nathan Tran, Reeder Loveland, Richard Vu
import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1000
    height: 480

    property double x1: 0.0
    property double x2: 0.0
    property double y1: 0.0
    property double y2: 0.0

    property double firstDistPair: 0.0
    property double secondDistPair: 0.0
    property double distResult: 0.0

    property double firstSlopePair: 0.0
    property double secondSlopePair: 0.0
    property double slopeResult: 0.0

    property double firstMidPair: 0.0
    property double secondMidPair: 0.0
    property double midResult: 0.0

    property double yIntercept: 0.0

    header: Label {
        text: qsTr("Equation of a Line")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    TextField {
        id: input_x1
        x: 400
        y: 22
        placeholderText: qsTr("input x1")
    }

    TextField {
        id: input_y1
        x: 400
        y: 68
        placeholderText: qsTr("input y1")
    }

    TextField {
        id: input_x2
        x: 400
        y: 136
        placeholderText: qsTr("input x2")
    }

    TextField {
        id: input_y2
        x: 400
        y: 182
        placeholderText: qsTr("input y2")
    }

    Button {
        id: calculateLineButton
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            x1 = input_x1.displayText
            y1 = input_y1.displayText
            x2 = input_x2.displayText
            y2 = input_y2.displayText

            firstDistPair = x1 - x2
            firstDistPair *= firstDistPair
            secondDistPair = y1 - y2
            secondDistPair *= secondDistPair
            distResult = Math.sqrt(firstDistPair + secondDistPair)

            firstMidPair = (x1 + x2) / 2
            secondMidPair = (y1 + y2) / 2

            firstSlopePair = y2 - y1
            secondSlopePair = x2 - x1
            slopeResult = firstSlopePair / secondSlopePair

            yIntercept = y1 - (slopeResult * x1)

            lineEquationOutput.text = "y = " + slopeResult + "x + " + yIntercept
            lineDataOutput.text = "d = " + distResult + ", midpoint = (" + firstMidPair + ", " + secondMidPair + ")" + ", b = " + yIntercept + ", m = " + slopeResult
        }
    }

    Text {
        id: label_x1
        x: 368
        y: 33
        text: qsTr("x1")
        font.pixelSize: 16
    }

    Text {
        id: label_y1
        x: 368
        y: 79
        text: qsTr("y1")
        font.pixelSize: 16
    }

    Text {
        id: label_y2
        x: 368
        y: 193
        text: qsTr("y2")
        font.pixelSize: 16
    }

    Text {
        id: label_x2
        x: 368
        y: 147
        text: qsTr("x2")
        font.pixelSize: 16
    }

    Text {
        id: lineDataOutput
        x: 59
        y: 353
        color: "#7fdd0000"
        text: qsTr("Data Output")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }

    Text {
        id: lineEquationOutput
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
