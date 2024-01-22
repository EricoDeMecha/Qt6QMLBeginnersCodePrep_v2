// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
    . Show three ways to run QML code:
        . Qt creator project
        . Qt creator UI prototype
        . qml tool on the terminal

  */
import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        anchors.centerIn: parent
        text : "Hello World";
        color: "red"
        font.pointSize: 20
    }
}
