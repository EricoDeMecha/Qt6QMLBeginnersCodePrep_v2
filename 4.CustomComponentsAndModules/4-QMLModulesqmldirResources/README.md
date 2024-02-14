# qmldir module using rcc resource system 

- __Supported in < Qt6.0__
- __Works with QMake Build System__


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
  ```