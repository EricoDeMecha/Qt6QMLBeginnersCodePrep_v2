/*
        . The goal of this example is to show how things were done before qt_qml_add_module
        . This project should use a qmldir file to add components into the custom_buttons
            folder to a qml module that we import in this main qml file.
        . You can name the module custom_buttons
        . This project shouldn't use qt_qml_add_module
        . It should purely rely on qmldir and the import path that you add to the engine object
            in the main.cpp file

        . NOTE:
            . It is also possible to wrap all QML files that make up the module into a .qrc resource
                file.
            . This makes it easy to manage import paths, it's also good for security as the resources
                are compiled with your binary.
            . The next project will be about that.


  */
import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
}