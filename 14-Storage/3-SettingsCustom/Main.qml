// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
    . We don't want for the settings to be saved automatically
    . We actively save them at a time and place we choose
    . In this case, se save them when the window is destroyed
    . Flow :
        . 1. Don't use property aliases in settings objects
        . 2. Read the data from the settings objects
        . 3. Save the data when the window object is about to die.
  */

import QtQuick
import QtQuick.Dialogs
import QtCore
import QtQuick.Controls

Window {
    id: rootId
    visible: true

    //2.Read data from the Settings object
    x: windowSettingsId.x
    y: windowSettingsId.y
    width: windowSettingsId.width
    height: windowSettingsId.height

    title: qsTr("Custom Settings")

    Rectangle {
        id: rectId
        anchors.fill: parent

        //2.Read data from the Settings object
        color: colorSettingsId.rectColor

        MouseArea {
            anchors.fill: parent
            onClicked: {
                colorDialogId.open();
            }

            ColorDialog {
                id: colorDialogId
                title: "Please choose a color"
                onAccepted: {
                    console.log("The new color is: " + selectedColor);
                    rectId.color = selectedColor;
                }
                onRejected: {
                    console.log("Canceled");
                }
            }
        }
        Button {
            id: clearSettingBtnId
            // anchors.right: parent.left
            // anchors.top: parent.top
            text: "Restore Settings"
            onClicked: {
                // windowSettingsId.destroy()
                // colorSettingsId.destroy()
                rootId.x = 300;
                rootId.y = 300;
                rootId.height = 480;
                rootId.width = 640;
                rootId.color = "red";
            }
        }
    }

    //1. Don't use property aliases in the Settings objects
    Settings {
        id: windowSettingsId
        category: "window"
        property int x: 300
        property int y: 300
        property int width: 640
        property int height: 480
    }

    Settings {
        id: colorSettingsId
        category: "colors"
        property color rectColor: "red"
    }

    //3.Save the data when the Window object is about to die
    Component.onDestruction: {
        //Save the window properties
        windowSettingsId.x = rootId.x;
        windowSettingsId.y = rootId.y;
        windowSettingsId.width = rootId.width;
        windowSettingsId.height = rootId.height;

        //Save the color property
        colorSettingsId.rectColor = rectId.color;
    }
}
