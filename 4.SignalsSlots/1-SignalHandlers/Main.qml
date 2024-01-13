// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Signal Handlers")

    property bool isMouseWithinParent: false

    Rectangle {
        id: rect
        width: 150
        height: 150
        color: "red"

        MouseArea {
            anchors.fill: parent

            //hoverEnabled: true

            onClicked: {
                console.log("Clicked on the rect");
            }

            onDoubleClicked: {
                console.log("Double clicked on the rect");
            }

            onEntered: {
                console.log("You're in!");
                isMouseWithinParent = true;
            }

            onExited: {
                console.log("You're out!");
                isMouseWithinParent = false;
            }

            onWheel: function (wheel) {
                console.log("Wheel: " + wheel.x);
            }

            onCanceled: {
                console.log("Cancelled");
            }

            onReleased: mouse => {
                console.log("Released at x:" + mouse.x + ",y:" + mouse.y);
            }

            onPressAndHold: mouse => {
                console.log("Was Held " + mouse.wasHeld);
            }
            onPositionChanged: mouse => {
                if (isMouseWithinParent) {
                    console.log("Tracking mouse within parent x:" + mouse.x + ",y:" + mouse.y);
                } else {
                    console.log("Tracking mouse outside parent x:" + mouse.x + ",y:" + mouse.y);
                }
            }
        }
    }
}
