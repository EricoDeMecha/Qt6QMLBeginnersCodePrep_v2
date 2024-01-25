// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Setting up a bunch of QML custom elements as part of a QML module


  */

import QtQuick
import GreatButtons

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Components Demo")

    // Components
    Column {
        x: 10
        y: 10
        MButton {
            buttonText: "Button1"
            onButtonClicked: {
                console.log("Clicked on component button1");
            }
        }
        RedButton {
            buttonText: "Button2"
            onButtonClicked: {
                console.log("clicked on component button2");
            }
        }
        GreenButton{
            buttonText: "Button3"
        }
        BlueButton{
            buttonText: "Button4"
        }
    }
}
