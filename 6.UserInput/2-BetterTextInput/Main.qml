// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Exploring the TextInput Component :
            . Allows user to type a single line of text
            . Handle the editingFinished signal.
            . Show other signals in the docs

        . In this sister project to the previous one, we just refactor the code into
            and external qml component. This is how you should strive to organize your code.


  */

import QtQuick
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("TextInput")


    ColumnLayout {
        Layout.topMargin: 10
        spacing: 50

        LabeledTextInput {
            id: firstNameId
            label: "First Name: "
            placeHolderText: "Type in your first name..."
            onEditingFinished: {
                console.log("The first name changed to: " + firstNameId.text);
            }
        }

        LabeledTextInput {
            id: lastNameId
            label: "Last Name: "
            placeHolderText: "Type in your last name..."
            onEditingFinished: {
                console.log("The last name changed to: " + lastNameId.text);
            }
        }
    }
}
