// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Working with custom componets in QML
            . We start out by exploring Row and Column
                . We will use this info to arrange buttons either horizontally or vertically
            . Then we build the button in the main.qml file
            . We export the button code to its own qml file
            . Encapsulate some properties as invisible from the outside
            . Make sure the button has width and height information exposed so that
                it plays well with positioning mechanisms in QML

            . NOTE: the next lecture is an extension of this one. It:
                . uses the Component together with Loader
                . shows inlined compoments as in component MButton: Rectangle

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom Components Demo")

    //You can change Column to Row to have rectangles laid out horizontally
    /*
    Column {
        spacing: 20
        Rectangle {
            width: 300
            height: 100
            color: "red"
        }
        Rectangle {
            width: 300
            height: 100
            color: "blue"
        }
    }
    */

    /*
    //Button code living in the main.qml file
    Rectangle {
        id: containerRectId
        color: "red"
        border {
            color: "blue"
            width: 3
        }

        //The width and height of the rectangle depend on the dimensions of the text in buttonTextId
        width: buttonTextId.implicitWidth + 20
        height: buttonTextId.implicitHeight + 20

        Text {
            id: buttonTextId
            text: "Button"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Clicked on the button")
            }
        }
    }
    */

    /*
    MButton {
        id: button1
        buttonText: "Button1"
    }
    MButton {
        id: button2
        buttonText: "Button2"
        anchors.top: button1.bottom
    }
    */

    // Buttons in a Column element

    Column {
        x: 10
        y: 10
        MButton {
            buttonText: "Button1"
            onButtonClicked: {
                console.log("Clicked on component button1");
            }
        }
        MButton {
            buttonText: "Button2"
            onButtonClicked: {
                console.log("clicked on component button2");
            }
        }
    }





}
