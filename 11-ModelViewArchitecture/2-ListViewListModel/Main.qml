// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
    . Exploring ListView and ListModel
    . When you connect a delegate to a view with something like :
            . delegate : delegateId
       the delegate gets access to the attributes defined in the
        model that the view is displaying.

    . Start by using an external delegate
    . Then use an inline one.

  */

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ListView and ListModel Demo")

    ListView {
        id: mListViewId
        anchors.fill: parent
        model: mModelId

        // delegate: delegateId

        delegate: Rectangle {
            id: rectangleId
            width: parent.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 10

            Text {
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + " : " + capital
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + capital + ", " + country);
                }
            }
        }
    }

    ListModel {
        id: mModelId
        ListElement {
            country: "Rwanda"
            capital: "Kigali"
        }
        ListElement {
            country: "Germany"
            capital: "Berlin"
        }
        ListElement {
            country: "Japan"
            capital: "Tokyo"
        }

        ListElement {
            country: "Nigeria"
            capital: "Lagos"
        }
        ListElement {
            country: "Ghana"
            capital: "Accra"
        }
        ListElement {
            country: "Kenya"
            capital: "Nairobi"
        }
        ListElement {
            country: "India"
            capital: "New Delhi"
        }
        ListElement {
            country: "Uganda"
            capital: "Kampala"
        }
    }

    // you can also do component DelegateRectangle: Rectangle {
    Component {
        id: delegateId
        Rectangle {
            id: rectangleId
            width: parent.width
            height: 50
            color: "dodgerblue"
            border.color: "black"
            radius: 15

            Text {
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + ": " + capital
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + capital + ", " + country);
                }
            }
        }
    }
}
