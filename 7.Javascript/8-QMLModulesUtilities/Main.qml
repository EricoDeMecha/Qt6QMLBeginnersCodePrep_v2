// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*

    . Nesting your JS code as part of QML modules
    . We have three modules:
        . A components module that justs contains an external button to make it easy to click around
        . A constants module to contain some JS constants like window width and window height:
            . It is a singleton. To set it up as a singleton, you :
                . add the pragma Singleton thing in the QML file
                . Register the file as a singleton in the qml module CMakeLists.txt file as shown below:
                        set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
                            QT_QML_SINGLETON_TYPE  TRUE
                        )
        . A utilities module that contains some js functions.


  */
import QtQuick
import MyComponents
import MyConstants
import MyUtilities

Window {
    visible: true
    width: Constants.windowWidth
    height: Constants.windowHeight
    title: qsTr("QML Modules Properties")

    // Components
    Column {
        x: 10
        y: 10
        MButton {
            buttonText: "Button1"
            onButtonClicked: {
                // console.log("Clicked on component button1");
                Utils.buttonAlert(buttonText);
            }
        }
        MButton {
            buttonText: "Button2"
            onButtonClicked: {
                Utils.buttonAlert(buttonText);
            }
        }
    }
}
