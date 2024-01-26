// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Exploring signal handlers for built in signals
            . Components in QML will have pre-defined signals
            . For example : MouseArea has these signals :
                    canceled()
                    clicked(MouseEvent mouse)
                    doubleClicked(MouseEvent mouse)
                    entered()
                    exited()
                    positionChanged(MouseEvent mouse)
                    pressAndHold(MouseEvent mouse)
                    pressed(MouseEvent mouse)
                    released(MouseEvent mouse)
                    wheel(WheelEvent wheel)

             . You can process any of these signals by setting up a signal
                    handler with the syntax : On<SignalName> with the first
                    letter capitalized. Examples :
                        onClicked:{//Code that responds to click}
                        onEntered: {//Code that responds to Enter}

             . We play with a bunch of them


  */

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

            hoverEnabled: true

            onClicked: {
                console.log("Clicked on the rect");
            }

            onDoubleClicked: {
                console.log("Double clicked on the rect");
            }

            onEntered: {
                console.log("You're in!");
            }

            onExited: {
                console.log("You're out!");
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
                console.log("Tracking mouse, x:" + mouse.x + ",y:" + mouse.y);
            }
        }
    }
}
