import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {

    property string name
    property string phone

    DialogHeader {
        acceptText: qsTr("Register")
        cancelText: qsTr("Done")
    }

    Column {
        anchors.centerIn: parent
        width: parent.width
        spacing: Theme.paddingLarge
        TextField {
            id: lastnameUser
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            placeholderText: qsTr("Enter lastname")
            label: qsTr("Lastname")
            text: ""
        }
        TextField {
            id: nameUser
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            placeholderText: qsTr("Enter name")
            label: qsTr("Name")
            enabled: false
            text: name
        }
        TextField {
            id: surnameUser
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            placeholderText: qsTr("Enter surname")
            label: qsTr("Surname")
            text: ""
        }
        TextField {
            id: phoneUser
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            placeholderText: qsTr("Enter phone")
            label: qsTr("Phone")
            enabled: false
            text: phone
        }
        TextField {
            id: emailUser
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            placeholderText: qsTr("Enter email")
            label: qsTr("Email")
            text: ""
        }
        ComboBox {
            id: comboBoxTopics
            width: parent.width
            label: qsTr("Topics")
            menu: ContextMenu {
                MenuItem { text: qsTr("Cars") }
                MenuItem { text: qsTr("News") }
                MenuItem { text: qsTr("Politics") }
                MenuItem { text: qsTr("Science") }
                MenuItem { text: qsTr("Weather") }
                MenuItem { text: qsTr("Art") }
            }
        }

        TextSwitch {
            id: switchPersonal
            width: parent.width
            text: checked ? qsTr("Agree") : qsTr("I don't agree")
            description: qsTr("Consent to the processing of personal data.")
        }
        TextSwitch {
            id: switchMailing
            width: parent.width
            text: checked ? qsTr("Agree") : qsTr("I don't agree")
            description: qsTr("consent to mailing.")
        }
    }

    onDone: if (result != DialogResult.Accepted) {
                lastnameUser.text = ""
                nameUser.text = ""
                surnameUser.text = ""
                phoneUser.text = ""
                emailUser.text = ""
                switchPersonal.checked = false
                switchMailing.checked = false
            }
}
