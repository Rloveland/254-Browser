import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0


Page {
    id: homePage
    width: 600
    height: 450
    font.pointSize: 8

    header: Label {
        height: 50
        color: "#ffffff"
        text: qsTr("Blood Alcohol Content")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Rectangle {
        x: 0
        y: -51
        width: 600
        height: 51
        color: "#000000"
    }

    background: Rectangle {
        radius: 2
        color: "light gray"
        border.color: "light gray"
        border.width: 1
        implicitWidth: 200
        implicitHeight: 24
    }

    Pane {
        id: userInfoPane
        x: 30
        y: 209
        width: 556
        height: 125
        font.pointSize: 10

        background: Rectangle {
            color: "light gray"
        }

        Label {
            id: nameLabel
            x: 0
            y: 15
            text: "Name:"
        }

        Label {
            id: weightLabel
            x: 390
            y: 62
            width: 57
            height: 16
            text: qsTr("Weight:")
        }

        Label {
            id: genderLabel
            x: 0
            y: 62
            text: qsTr("Gender:")
        }

        Label {
            id: ageLabel
            x: 388
            y: 15
            width: 36
            height: 21
            text: qsTr("Age:")
        }

        TextArea {
            id: nameDisplayText
            x: 41
            y: 9
            width: 107
            height: 41
            text: nameString
        }

        TextArea {
            id: genderDisplayText
            x: 51
            y: 56
            width: 94
            height: 33
            text: genderString
        }

        TextArea {
            id: ageDisplayText
            x: 414
            y: 9

            text: ageValue
            placeholderText: ""
        }

        TextArea {
            id: weightDisplayText
            x: 440
            y: 56

            text: weightValue + " lb"
        }
    }


    Button {
        id: resetButton
        x: 227
        y: 218
        width: 148
        height: 102
        text: qsTr("Reset")
        onPressed:
            bloodAlcoholContent = 0
    }

    Timer {
        interval: 0; running: true; repeat: false;
        onTriggered:{
            secondsPassed = (Math.round(((startTime - newStartTime) / 1000)) - sessionSeconds)
            bloodAlcoholContent -= (eliminationRate * secondsPassed)
            newStartTime = startTime
            sessionSeconds = 0
            if (bloodAlcoholContent < 0)
                bloodAlcoholContent = 0
        }
    }

    Text {
        id: disclaimer
        x: 14
        y: 172
        text: qsTr("DISCLAIMER: This is just an estimation and not guaranteed to be completely accurate.")
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered:{
            sessionSeconds++
            if (bloodAlcoholContent > 0)
                bloodAlcoholContent -= eliminationRate
            else if (bloodAlcoholContent < 0)
                bloodAlcoholContent = 0

            if (bloodAlcoholContent <= 0){
                warningLabel.text = "None"
                warningLabel.color = "green"
            }
            else if (bloodAlcoholContent > 0 && bloodAlcoholContent < 0.05){
                warningLabel.text = "Mild"
                warningLabel.color = "yellow"
            }
            else if (bloodAlcoholContent > 0.05 && bloodAlcoholContent < 0.08){
                warningLabel.text = "Near Intoxicated"
                warningLabel.color = "orange"
            }
            else if (bloodAlcoholContent > 0.08 && bloodAlcoholContent < 0.12){
                warningLabel.text = "Intoxicated"
                warningLabel.color = "red"
            }
            else if (bloodAlcoholContent > 0.12 && bloodAlcoholContent < 0.15){
                warningLabel.text = "Severely Intoxicated"
                warningLabel.color = "dark red"
            }
            else {
                warningLabel.text = "STOP DRINKING"
                warningLabel.color = "dark red"
            }
        }
    }

    Label {
        id: impairmentLabel
        x: 14
        y: 15
        color: "#000000"
        text: qsTr("Impairment Level:")
        font.pointSize: 20
    }

    Text {
        id: warningLabel
        x: 288
        y: 17
        width: 25
        height: 19
        text: qsTr("")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }

    TextArea {
        id: bloodAlcoholTextArea
        x: -46
        y: 108
        width: 689
        height: 52
        text: bloodAlcoholContent.toFixed(4) + "% BAC"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 20
        placeholderText: qsTr("Text Area")
    }
    ProgressBar {
        id: bloodAlcoholProgressBar
        x: 14
        y: 85
        width: 572
        height: 13
        to: 0.15
        value: bloodAlcoholContent
    }
}