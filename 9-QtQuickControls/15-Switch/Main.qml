// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
        . Exploring the Switch control
            . Allows you to turn things on and off
            . Show it in different styles for the best experience.

  */

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Switch")

    Column {
        width: parent.width
        spacing: 20

        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "WiFi"
            checked: true
            onCheckedChanged: {
                if (checked) {
                    console.log("WiFi switch is turned ON");
                } else {
                    console.log("WiFi switch is turned OFF");
                }
            }
        }
        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Bluetooth"
        }
        Switch {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "NFC"
            enabled: false
        }
    }
    // Resource: https://doc.qt.io/qt-6/qtquickcontrols-customize.html#customizing-switch
}
