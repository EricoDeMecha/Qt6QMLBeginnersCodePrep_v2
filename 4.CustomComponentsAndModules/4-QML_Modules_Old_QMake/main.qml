/*

        . The goal of this example is to show how things were done before qt_qml_add_module
        . We rely on QMake to show the ideas
                # qmldir module using rcc resource system

                - __Supported in < Qt6.0__
                - __Works with QMake Build System__
                - You have to create A Qt Quick compat project to have the option for QMake.
                - Flow:
                    . Create a Qt Quick compat project based on QMake
                    . Copy and paste in the custom_buttons folder
                    . Add a resource file named custom_buttons.qrc
                    . Add the contents of the custom_buttons folder to the resource file under the / root prefix
                    . Add the :/qrc import path to the engine in the main.qml file
                    . Add the import path in the QMake .pro file
                    . Build and run the project.
                    . This is the flow you follow to add more modules if you need to.

                - Key takeaway: CMake simplifies this process by setting up a qmldir file under the hood for you.

                - Below are the detailed needed steps to make this work:

                    ## Module definition

                    - Define ```qmldir``` file like this in the directory containing the module's components

                    ```text
                    module custom_buttons
                    BlueButton 1.0 BlueButton.qml
                    GreenButton 1.0 GreenButton.qml
                    MButton 1.0 MButton.qml
                    RedButton 1.0 RedButton.qml
                    ```

                    - The name of the module should be similar to the name of the subdirectory containing the module, in this case ```custom_buttons```
                    - Set QML import path to the parent directory of the module's directory.
                    ```qmake
                    QML_IMPORT_PATH += $$PWD
                    ```
                    - add ```qrc:/``` path to the application engine and
                    - import the module normally like
                      ```
                      import custom_buttons 1.0

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
