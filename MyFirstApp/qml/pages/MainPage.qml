import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("MyFirstApp")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Label {
        id: labelRegister
        visible: false
        text: qsTr("Registration completed!")
        font.pixelSize: Theme.fontSizeExtraLarge
        anchors {
            centerIn: parent
            topMargin: Theme.paddingLarge
        }
    }

    TextField {
        id: nameUser
        anchors.centerIn: parent
        width: parent.width
        placeholderText: qsTr("Enter name")
        label: qsTr("Name")
        text: ""
    }
    TextField {
        id: phoneUser
        anchors.top: nameUser.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        placeholderText: qsTr("Enter phone")
        label: qsTr("Phone")
        text: ""
    }
    Button {
        id: btnReg
        text: qsTr("Registration")
        anchors.top: phoneUser.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if ((nameUser.text != "")&&(phoneUser.text != "")) {
                var dialog =
                    pageStack.push(Qt.resolvedUrl("RegistrationPage.qml"),
                                   {"name": nameUser.text,
                                    "phone": phoneUser.text});
                dialog.accepted.connect(function() {
                    btnReg.visible = false;
                    phoneUser.visible = false;
                    phoneUser.focus = false;
                    nameUser.visible = false;
                    nameUser.focus = false;
                    labelRegister.visible = true;
                });
                dialog.done.connect(function() {
                    nameUser.text = "";
                    phoneUser.text = "";
                    nameUser.focus = true;
                });
            } else {
                if ( nameUser.text == "" ) {
                    nameUser.focus = true;
                } else if ( phoneUser.text == "" ) {
                    phoneUser.focus = true;
                }
            }
        }
    }
}
