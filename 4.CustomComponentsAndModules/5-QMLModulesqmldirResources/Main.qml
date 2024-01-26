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
import QtQuick
//Your module should be imported here.

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
}
