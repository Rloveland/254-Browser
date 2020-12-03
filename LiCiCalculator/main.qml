//Authors: Nathan Tran, Reeder Loveland, Richard Vu
import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 1000
    height: 480
    visible: true
    title: qsTr("Line & Circle Equation Calculator")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {

        }

        Page2Form {

        }
    }

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
