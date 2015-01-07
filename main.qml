import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import cppClasses 1.0
import QtQuick.Controls.Styles 1.2
import Enginio 1.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    EnginioClient {
        id: client
        backendId: {"54a9c4b05a3d8b5e1a00c046"} // copy/paste your EDS instance backend id here
        onFinished: console.log("Request served." + reply.data)
        onError: console.log("Ooops! Something went wrong!", JSON.stringify(reply.data))
    }

    menuBar: MenuBar {
        Menu {
            visible: true
            title: qsTr("&Tracking")
        }
        Menu {
            visible: true
            title: qsTr("&Federal")
        }
        Menu {
            visible: true
            title: qsTr("&State")
        }
        Menu {
            visible: true
            title: qsTr("&Local")

            Loader {
                id: localFeed
                source: "LocalFeed.qml"
                anchors.fill: parent
            }
        }

        Menu {
            visible: true
            title: qsTr("&options")
            MenuItem {
                id: feeds
                text: qsTr("&Feeds")
                //onTriggered:
                visible: true
                onTriggered: content.source = "TabView.qml"
            }
            MenuItem {
                id: account
                text: qsTr("&Account")
                //onTriggered:
                visible: true
                onTriggered: content.source = "AcctInfoPage.qml"
            }
            MenuItem {
                id: logout
                text: qsTr("&Logout")
                //onTriggered:
                visible: true
                onTriggered: content.source = "LoginPage.qml"
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    statusBar: StatusBar {
        visible: false
            RowLayout {
                anchors.fill: parent
                Label { text: "Ivalid email or password" } // Initial label
            }
        }

    User {
        id: user
    }

    Loader {
        id: content
        source: "RegisterUser.qml"
        anchors.fill: parent
    }


}
