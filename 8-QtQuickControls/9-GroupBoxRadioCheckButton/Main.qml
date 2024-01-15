// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 560
    title: qsTr("GroupBox")

    Column {
        spacing: 10
        anchors.fill: parent

        //RadioButton controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around RadioButtons."
        }

        GroupBox {
            title: "Choose bonus"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {

                RadioButton {
                    text: "Coke"
                    onCheckedChanged: {
                        if (checked) {
                            console.log("Coke button checked");
                        } else {
                            console.log("Coke button is NOT checked");
                        }
                    }
                }
                RadioButton {
                    text: "Green Tea"
                }
                RadioButton {
                    text: "Ice Cream"
                }
            }
        }

        //CheckBox Controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around CheckBoxes."
        }

        GroupBox {
            title: "Choose Qt supported Desktop Platform"
            anchors.horizontalCenter: parent.horizontalCenter
            Column {

                CheckBox {
                    text: "Windows"
                    onCheckedChanged: {
                        if (checked) {
                            console.log("Windows button checked");
                        } else {
                            console.log("Windows button is NOT checked");
                        }
                    }
                }
                CheckBox {
                    text: "Mac"
                }
                CheckBox {
                    text: "Linux"
                }
            }
        }
        // Disable and enable a groupbox
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A Groupbox that can enabled and disabled"
        }

        GroupBox {
            anchors.horizontalCenter: parent.horizontalCenter
            label: CheckBox {
                id: checkBox
                checked: true
                text: checked ? "Disable" : "Enable"
                onCheckedChanged: {
                    console.log("Status: " + text + "d");
                }
            }

            Column {
                enabled: checkBox.checked
                CheckBox {
                    text: qsTr("Item 1")
                }
                CheckBox {
                    text: qsTr("Item 2")
                }
                CheckBox {
                    text: qsTr("Item 3")
                }
            }
        }
    }
}
