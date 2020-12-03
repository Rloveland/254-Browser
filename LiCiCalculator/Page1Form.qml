//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//This file forms the page for line equations and line data output
import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    //Initialize the page dimensions
    width: 1000
    height: 480

    //Initialize variables to hold user-inputted data
    property double x1: 0.0
    property double x2: 0.0
    property double y1: 0.0
    property double y2: 0.0

    //Initialize variables to hold calculation results
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

    //Header for the application window
    header: Label {
        text: qsTr("Equation of a Line")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    //TextField objects for users to input point coordinates
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

    //Corresponding text labels for each TextField
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

    //Placeholder text to be later modified into output
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

    //Button to begin calculations
    Button {
        id: calculateLineButton
        x: 450
        y: 254
        text: qsTr("Calculate")

        onPressed:{
            //When this button is pressed, set the previously initialized variables to
            //the user-inputted data by accessing the properties of the TextFields, then perform calculations on them
            x1 = input_x1.displayText
            y1 = input_y1.displayText
            x2 = input_x2.displayText
            y2 = input_y2.displayText

            //Calculate the distance between the two points
            firstDistPair = x1 - x2
            firstDistPair *= firstDistPair
            secondDistPair = y1 - y2
            secondDistPair *= secondDistPair
            distResult = Math.sqrt(firstDistPair + secondDistPair)

            //Calculate the midpoint of the two points
            firstMidPair = (x1 + x2) / 2
            secondMidPair = (y1 + y2) / 2

            //Calculate the slope of the two points
            firstSlopePair = y2 - y1
            secondSlopePair = x2 - x1
            slopeResult = firstSlopePair / secondSlopePair

            //Calculate the y-intercept
            yIntercept = y1 - (slopeResult * x1)

            //Output the equation of the line and its data
            lineEquationOutput.text = "y = " + slopeResult + "x + " + yIntercept
            lineDataOutput.text = "d = " + distResult + ", midpoint = (" + firstMidPair + ", " + secondMidPair + ")" + ", b = " + yIntercept + ", m = " + slopeResult
        }
    }
}
