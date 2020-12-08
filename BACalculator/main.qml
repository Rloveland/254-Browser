import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0

ApplicationWindow {
    id: applicationWindow
    width: 600
    height: 450
    visible: true
    title: qsTr("BACalculator")

    property string genderString:""
    property string weightContent: ""
    property string nameString:""
    property double ageValue: 0.0
    property double genderConstant: 0.0

    property double startTime: new Date().getTime()
    property double newStartTime: 0.0
    property double secondsPassed: 0.0
    property double sessionSeconds: 0.0

    property double bloodAlcoholContent: 0.0
    property double weightValue: 0.0
    property double portionSize: 0.0
    property double alcoholValue: 0.0

    property double eliminationRate: 0.00000472222

    Settings {
        property alias bloodAlcoholContent: applicationWindow.bloodAlcoholContent
        property alias genderString: applicationWindow.genderString
        property alias weightValue: applicationWindow.weightValue
        property alias ageValue: applicationWindow.ageValue
        property alias genderConstant: applicationWindow.genderConstant
        property alias nameString: applicationWindow.nameString
        property alias sessionSeconds: applicationWindow.sessionSeconds
        property alias newStartTime: applicationWindow.newStartTime
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }

        Page3Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Blood Alcohol Content")
        }
        TabButton {
            text: qsTr("Enter Drinks")
        }
        TabButton {
            text: qsTr("User Profile Settings")
        }
    }
}
