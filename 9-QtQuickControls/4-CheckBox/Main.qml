// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
    . Exploring CheckBox
    . Giving the user exclusive choices
    . Start by going through the docs
    . Improvise on this as it has become second nature to you.
  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("CheckBox")

    Column {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        CheckBox {
            text: "Option1"
            checked: true
            onCheckStateChanged: {
                if (checked) {
                    console.log("Option1 is checked");
                } else {
                    console.log("Option1 is unchecked");
                }
            }
        }
        CheckBox {
            text: "Option2"
        }
        CheckBox {
            text: "Option3"
            checked: false
            enabled: false
        }

        ButtonGroup {
            id: childGroupId
            exclusive: false
            checkState: parentCheckBoxId.checkState
        }
        CheckBox {
            id: parentCheckBoxId
            text: "Parent"
            checkState: childGroupId.checkState
        }
        Repeater {
            model: ["Child 1", "Child 2", "Child 2"]
            CheckBox {
                text: modelData
                leftPadding: 20
                ButtonGroup.group: childGroupId
            }
        }
    }
}
