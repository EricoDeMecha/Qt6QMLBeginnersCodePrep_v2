// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
        . Exploring FileDialog
            . The docs
            . The API has changed from Qt5 to Qt 6
            . You get the selected file  by going through the selectedFile property.
            . Use the doc and improvise.

            . Availability : A native platform file dialog is currently
                    available on the following platforms:
                       .  iOS
                       .  Android
                       .  Linux (when running with the GTK+ platform theme)
                       .  macOS
                       .  Windows

            . Mention filters

  */

import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FileDialog")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Choose File"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fileDialogId.open();
            }
        }

        Text {
            id: textId
            text: "Use hasn't chosen yet"
            wrapMode: Text.Wrap
        }

        FileDialog {
            id: fileDialogId
            title: "Choose File"
            nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)", "Images (*.jpg *.png)"]
            fileMode: FileDialog.OpenFiles	// allow for selecting multiple files
            onAccepted: {
                textId.text = currentFile;
            }

            onRejected: {
                textId.text = "Dialog rejected";
            }
        }

        Button {
            text: "Choose Multiple File"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                multipleFileDialogId.open();
            }
        }

        Text {
            id: multipleTextId
            text: "Use hasn't chosen yet"
            wrapMode: Text.Wrap
        }

        FileDialog {
            id: multipleFileDialogId
            title: "Choose Multiple Files"
            nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)", "Images (*.jpg *.png)"]
            fileMode: FileDialog.OpenFiles	// allow for selecting multiple files
            onAccepted: {
                multipleTextId.text = currentFiles.join('\n');
            }

            onRejected: {
                multipleTextId.text = "Dialog rejected";
            }
        }
    }
}
