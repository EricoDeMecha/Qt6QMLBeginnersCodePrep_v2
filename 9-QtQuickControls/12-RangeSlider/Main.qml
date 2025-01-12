// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*

    . Exploring Range Slider
    . Use the docs and improvise.

  */

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("RangeSlider")


        RangeSlider {
            anchors.centerIn: parent
            //orientation: Qt.Vertical
            from: 1
            to: 100
            first.value: 25
            second.value: 75

            first.onValueChanged: {
                console.log("First value changed to: " + first.value);
            }
            second.onValueChanged: {
                console.log("Second value changed to: " + second.value);
            }
        }
}
