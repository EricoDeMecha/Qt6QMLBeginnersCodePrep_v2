/*

        . The goal of this example is to show how things were done before qt_qml_add_module
        . The buttons in custom_components are part of a qml module that will be loaded into
            this qml file
        . the qml files in the module are wrapped into the custom_buttons.qrc files
        . You shouldn't rely on qt_add_qml_module in CMake for this.

        . Resource:
            . https://stackoverflow.com/a/46096179
            . You just need to adapt this to work with CMake.

  */
import QtQuick 2.9
import QtQuick.Controls 2.5
import custom_buttons 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Components QMlDir Demo")

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
        GreenButton {
            buttonText: "Button3"
        }
        BlueButton {
            buttonText: "Button4"
        }
    }
}
