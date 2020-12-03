import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 1000
    height: 480
    visible: true
    title: qsTr("Common Formula Calculator")

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

        Page4Form {

        }

        Page5Form {

        }

        Page6Form {

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Distance Formula")
        }
        TabButton {
            text: qsTr("Slope Formula")
        }
        TabButton {
            text: qsTr("Midpoint Formula")
        }
        TabButton {
            text: qsTr("Triangle Area")
        }
        TabButton {
            text: qsTr("Pythagorean Theorem")
        }
        TabButton {
            text: qsTr("Circle Area")
        }
    }
}
