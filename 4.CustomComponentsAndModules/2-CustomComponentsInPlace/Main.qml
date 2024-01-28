// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Working with custom componets, without external files.
        . We set up the components where they are used( in the Main.qml file).
            . Use the Component together with Loader
            . Show inlined compoments as in component MButton: Rectangle

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom Components Demo")

    //Component and Loader
    Row{
        spacing: 20
        Loader {
            id: firstButton
            sourceComponent: buttonComponent // Loading the component inline

            onLoaded: {
                var customButton = firstButton.item; // Retrieve the loaded item
                // Access the loaded component's properties and signals
                customButton.buttonText = "Button1";
                customButton.buttonClicked.connect(function() {
                    console.log("Button1 Clicked!");
                });
            }
        }
        Loader{
            id: secondButton
            sourceComponent: buttonComponent
            onLoaded: {
                var customButton = secondButton.item; // Retrieve the loaded item
                // Access the loaded component's properties and signals
                customButton.buttonText = "Button2";
                customButton.buttonClicked.connect(function() {
                    console.log("Button2 Clicked!");
                });
            }
        }
    }


    Component {
        id: buttonComponent
        Item {
            id: rootId
            property alias buttonText: buttonTextId.text
            width: containerRectId.width
            height: containerRectId.height
            signal buttonClicked

            Rectangle {
                id: containerRectId
                width: buttonTextId.implicitWidth + 20
                height: buttonTextId.implicitHeight + 20
                color: "red"
                border {
                    color: "blue"
                    width: 3
                }

                Text {
                    id: buttonTextId
                    text: "Button"
                    anchors.centerIn: parent
                    onTextChanged: {
                        console.log("Text changed to " + buttonTextId.text);
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rootId.buttonClicked();
                    }
                }
            }
        }
    }



    // inlined component(same button as above but inlined)
    // resource(https://www.qt.io/blog/new-qml-language-features-in-qt-5.15)
    /*
    component MButton: Rectangle {
        id: mButtonId
        property alias buttonText: buttonTextId.text
        signal buttonClicked
        width: buttonTextId.implicitWidth + 20
        height: buttonTextId.implicitHeight + 20
        color: "red"
        border {
            color: "blue"
            width: 3
        }

        Text {
            id: buttonTextId
            text: "Button"
            anchors.centerIn: parent
            onTextChanged: {
                console.log("Text changed to " + buttonTextId.text);
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //console.log("Clicked on :"+ buttonTextId.text)
                mButtonId.buttonClicked();
            }
        }
    }

    Column {
        MButton {
            buttonText: "Button3"
            onButtonClicked: {
                console.log("Clicked on inlined component button3");
            }
        }
        MButton {
            buttonText: "Button4"
            onButtonClicked: {
                console.log("clicked on inlined component button4");
            }
        }
    }

    */


}
