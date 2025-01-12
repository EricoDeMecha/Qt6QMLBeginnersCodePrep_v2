// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT
/*
    . TableView is coupled with built-in TableModel component
    . You need to add and anchor the HeaderViews and stuff in the needed data
    . By default, HorizontalHeaderView displays header data from the sync view's model.
        If you don't wish to use this model, you can assign a different model to the model property.
        If you assign a model that is a QAbstractItemModel, its header data will be used.
        Otherwise the data in the model will be used directly (for example, if you assign a model that is simply an array of strings).
    . Start with a simple delegate
    . Then move on to use delegatechooser
    . Improvise for the rest.

  */

import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

ApplicationWindow {
    width: 680
    height: 400
    visible: true

    HorizontalHeaderView {
        id: horizontalHeader
        anchors.left: tableViewId.left
        anchors.top: parent.top
        syncView: tableViewId
        //If you want to use your own headers, you can set up a model like this.
        //model: ["One", "Two", "Three", "Four", "Five"]

    }

    VerticalHeaderView {
        id: verticalHeader
        anchors.top: tableViewId.top
        anchors.left: parent.left
        syncView: tableViewId
    }


    TableModel {
        id: tableModelId
        TableModelColumn { display: "checked" }
        TableModelColumn { display: "amount" }
        TableModelColumn { display: "fruitType" }
        TableModelColumn { display: "fruitName" }
        TableModelColumn { display: "fruitPrice" }

        // Each row is one type of fruit that can be ordered
        rows: [
            {
                // Each property is one cell/column.
                checked: false,
                amount: 1,
                fruitType: "Apple",
                fruitName: "Granny Smith",
                fruitPrice: 1.50
            },
            {
                checked: true,
                amount: 4,
                fruitType: "Orange",
                fruitName: "Navel",
                fruitPrice: 2.50
            },
            {
                checked: false,
                amount: 1,
                fruitType: "Banana",
                fruitName: "Cavendish",
                fruitPrice: 3.50
            }
        ]
    }

    TableView {
        id: tableViewId
        anchors.left: verticalHeader.right
        anchors.top: horizontalHeader.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        columnSpacing: 1
        rowSpacing: 1

        model: tableModelId

        /*
        delegate:  TextInput {
            text: model.display
            padding: 12
            selectByMouse: true

            onAccepted: model.display = text

            Rectangle {
                anchors.fill: parent
                color: "#efefef"
                z: -1
            }
        }
        */


        delegate: DelegateChooser {
            DelegateChoice {
                column: 0
                delegate: CheckBox {
                    checked: model.display
                    onToggled: model.display = checked
                }
            }
            DelegateChoice {
                column: 1
                delegate: SpinBox {
                    value: model.display
                    onValueModified: model.display = value
                }
            }
            DelegateChoice {
                delegate: TextField {
                    text: model.display
                    selectByMouse: true
                    implicitWidth: 140
                    onAccepted: model.display = text
                }
            }
        }
    }


    Button{
        text: "See the data"
        anchors.bottom: parent.bottom
        onClicked: {
            console.log(tableModelId.data(tableModelId.index(0,0),"display"))
        }
    }

}
