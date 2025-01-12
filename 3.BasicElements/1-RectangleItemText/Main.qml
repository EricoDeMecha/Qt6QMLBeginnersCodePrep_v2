// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Exploring elements :
            . Rectangle
            . Item
                . An invisible visual item   : docs

            . Text

        . Flow :
            . Start by Item
            . Put in the little colored rectangles
            . Show that you can manipulate their positions just by playing
                with the container invisible item
            . Show the docs for Item and all the properties
            . Put in the beige rect to fill the entire invisible item
            . Show Text

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Basic Elements Demo")

    Item {
        id: containerItemId
        x: 50
        y: 50
        width: 400
        height: 200

        Rectangle {
            anchors.fill: parent
            color: "beige"

            /*
            //Grouped Property Syntax Variation #1
            border.color: "black"
            border.width: 5
            */

            //Grouped Property Syntax Variation #2
            /*
            border {
                color: "black"
                width: 5
            }
            */

            //Grouped Property Syntax Variation #3
            border {
                color: "black"
                //width: 5
            }
        }

        Rectangle {
            x: 0
            y: 10
            width: 50
            height: 50
            color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }

        Rectangle {
            x: 60
            y: 10
            width: 50
            height: 50
            color: "green"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }

        Rectangle {
            x: 120
            y: 10
            width: 50
            height: 50
            color: "blue"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }

        Rectangle {
            x: 180
            y: 10
            width: 50
            height: 50
            color: "magenta"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }

        Text {
            id: mTextId
            x: 100
            y: 100
            text: "Hello World!"

            //font.family: "Helvetica"; font.pointSize: 13; font.bold: true

            /*
            font {
                family: "Helvetica"
                pointSize: 13
                bold: true
            }
            */

            font {
                family: "Helvetica"
                pointSize: 13
                bold: true
            }

            color: "red"
        }
    }
}
