# qmldir module without any resource system

- __Supported in < Qt6.0__
- __Works with QMake Build System__


## Module definition

- Define ```qmldir``` file like this 

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

## Workaround not using any resource system

With no resource system, the solution will be to copy the qml files required by the application to the build directory of the application. 
In this case this was accomplished with this script inside qmake

```qmake
# copy the custom_buttons folder to the build directory
copydata.commands = $(COPY_DIR) $$PWD/custom_buttons $$OUT_PWD
copyfile.commands = $(COPY_FILE) $$PWD/Main.qml $$OUT_PWD
first.depends = $(first) copydata copyfile

export(first.depends)
export(copydata.commands)
export(copyfile.commands)

QMAKE_EXTRA_TARGETS += first copydata copyfile
```

Resource: https://dragly.org/2013/11/05/copying-data-files-to-the-build-directory-when-working-with-qmake/


