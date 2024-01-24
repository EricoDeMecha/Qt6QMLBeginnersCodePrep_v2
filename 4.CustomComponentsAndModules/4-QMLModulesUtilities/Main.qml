// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import MyComponents
import MyConstants
import MyUtilities

Window {
    visible: true
    width: Constants.windowWidth
    height: Constants.windowHeight
    title: qsTr("QML Modules Properties")

    // Components
    Column {
        x: 10
        y: 10
        MButton {
            buttonText: "Button1"
            onButtonClicked: {
                // console.log("Clicked on component button1");
                Utils.buttonAlert(buttonText);
            }
        }
        MButton {
            buttonText: "Button2"
            onButtonClicked: {
                Utils.buttonAlert(buttonText);
            }
        }
    }
}
