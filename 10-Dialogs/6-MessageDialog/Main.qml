// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*

        . Exploring MessageDialog
        . Allow to show prompt messages to users
        . Use the doc and improvise.

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("MessageDialog ")

    Column {
        Button {
            text: "Push Me"
            onClicked: {
                messageDialog.open();
            }
        }

        Button {
            text: "Push Me for help"
            onClicked: {
                messageDialog2.open();
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Message"
        text: "Lie down and watch the sky."
        buttons: MessageDialog.Ok | MessageDialog.Close
        onAccepted: {
            console.log("Dialog accepted.");
        }
        onRejected: {
            console.log("Dialog rejected");
        }
    }
    MessageDialog {
        id: messageDialog2
        title: "Message"
        text: "Need Help?"
        buttons: MessageDialog.Help | MessageDialog.No
        // onAccepted: {
        //     console.log("Dialog accepted.")
        // }
        // onRejected: {
        //     console.log("Dialog rejected")
        // }
        onButtonClicked: (button, role) => {
            // you can check with buttons
            switch (button) {
            case MessageDialog.Help:
                console.log("Help Button clicked");
                messageDialog2.close();
                break;
            }
            // or roles(resource: https://doc.qt.io/qt-6/qml-qtquick-dialogs-messagedialog.html)
            switch (role) {
            case MessageDialog.NoRole:
                console.log("No Button clicked");
                break;
            }
        }
    }
}
