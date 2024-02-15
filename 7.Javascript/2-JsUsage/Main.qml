// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
    . Exploring JS usage in QML
        . Show its usage
            . in property bindings
            . in functions
            . in signal handlers


  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("JS")

    Rectangle {
        id: containerRectId
        width: getHeight()  //JS in Function
        height: 100
        color: x > 300 ? "red" : "green" //property binding

        //JS in signal handler
        onXChanged: {
            console.log("Current value of x: " + x + ", y:" + y);
        }

        //Custom function
        function getHeight(): real {
            return height * 2;
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: containerRectId
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.maximumX: parent.width - containerRectId.width
        drag.minimumY: 0
        drag.maximumY: parent.height - containerRectId.height
    }
    /*
    MouseArea {
        anchors.fill: parent
        drag.target: containerRectId
        drag.axis: Drag.YAxis
        drag.minimumY: 0
        drag.maximumY: parent.heigh - containerRectId.height

    }
    */
}
