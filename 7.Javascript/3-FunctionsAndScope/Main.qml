// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*

    . Function scope is where you can call the function without getting an error.

    . Things you should know about JS functions in QML
        . A function you define on the root level like min below, is callable anywhere
            in child elements of the root element. For ex, min can be called inside Rectangle

        . Functions defined in nested elements can't be called from parent scopes without
            going through the id. See sayMessage here. You can't call it in Component.onCompleted
            without using the id.

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Functions and Scope Demo")

    function min(a, b): real { // This function is set up in the global scope, it can be called anywhere in this QML file.
        return Math.min(a, b);
    }

    Rectangle {
        id: mRectId
        width: min(500, 400)
        height: 100
        anchors.centerIn: parent
        color: "blue"
    }

    MouseArea {
        id: mMouseAreaId
        anchors.fill: parent

        function sayMessage() { // This function is set up in a nested scope. To call it from parent scopes, one has to go throug its container ID.
            console.log("Hello there");
        }

        onClicked: {
            sayMessage();
            console.log(min(10, 12));
        }
    }

    Component.onCompleted: {
        console.log("The width of the rect is: " + min(500, 400));
        mMouseAreaId.sayMessage();
    }
}
