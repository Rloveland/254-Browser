//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//CPSC 254-01 25615 Group Project
//This is a QML driver file that handles the window and initalizes the pages within it
import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    //Initialize window dimensions and title in the header
    width: 1000
    height: 480
    visible: true
    title: qsTr("Line & Circle Equation Calculator")

    //Creates pages with the functionality of swiping
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            //Coded in Page1Form.qml
        }

        Page2Form {
            //Coded in Page2Form.qml
        }
    }

    //Creates tabs to switch between each page
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Equation of a Line")
        }
        TabButton {
            text: qsTr("Equation of a Circle")
        }
    }
}
