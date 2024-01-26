// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

/*
        . Setting up a bunch of QML custom elements as part of a QML module
        . The components are stored in a folder in the root of your project
            . ours is named custom_buttons

        . Inside the component folder, you set up a CMakeLists.txt file
        . The qml module is modeled as a library
        . The qml module is attached to the library through the qt_qml_add_module command:
            . qt_add_qml_module(${LIB_NAME}
                    URI ${MODULE_NAME}
                    # VERSION 1.0
                    RESOURCE_PREFIX /
                    QML_FILES
                        MButton.qml
                        RedButton.qml
                        GreenButton.qml
                        BlueButton.qml
                )

        . Be careful to differentiate the qml module name from the library name
        . The module name is what:
            . you specify as URI in the qt_add_qml_module command
            . you import in the Main.qml file
        . A module may contain one or more QML file

        . Once you have the component folder properly set up you :
            . bring it up in the root CMakeLists.txt file through the add_subdirectory command
            . link to the module, remembering that the *plugin suffix is needed, something like below:
                . target_link_libraries(${MY_TARGET}
                        PRIVATE Qt6::Quick GreatButtonsLibplugin # link component here with suffix *Plugin
                    )

        . You also have to remember to add the import path to the engine in the main.cpp file:
            the import path should match the prefix you specified in the qt_add_qml_module command of the qml module
            . engine.addImportPath(":/");

        . NOTE:
            . Lecture 4 5 and 6 are just left in for reference on styling.
            . Find a place for the JS and Widgets code.



  */

import QtQuick
import GreatButtons

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Components Demo")

    // Components
    Column {
        x: 10
        y: 10
        MButton {
            buttonText: "Button1"
            onButtonClicked: {
                console.log("Clicked on component button1");
            }
        }
        RedButton {
            buttonText: "Button2"
            onButtonClicked: {
                console.log("clicked on component button2");
            }
        }
        GreenButton{
            buttonText: "Button3"
        }
        BlueButton{
            buttonText: "Button4"
        }
    }
}
