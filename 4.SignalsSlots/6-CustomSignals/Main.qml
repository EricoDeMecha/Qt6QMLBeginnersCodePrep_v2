// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Custom Signals")

    Rectangle {
        id: rectId
        width: 300
        height: 300
        color: "dodgerblue"

        //Note: In a large project, signals and slots(UI logic) can be implemented in a separate file and imported
        //Set up the signal
        signal greet(string message)

        //Once you set up the signal, Qt setup a signal handler automatically
        onGreet: function (message) {
            console.log("Greeting with message: " + message);
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //Fire the signal by just calling it like a function
                rectId.greet("The sky is blue");
                // greet("Message from undefined reference"); // Error: should have a reference
            }
        }
    }
}
