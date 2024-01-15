// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FocusScope Demo")

    Column {
        spacing: 20
        anchors {
            centerIn: parent
        }

        MButton {
            color: "yellow"
            focus: true
        }

        MButton {
            color: "green"
            // focus: true
        }
    }
}
