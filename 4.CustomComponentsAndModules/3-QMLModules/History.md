# Changes
## [CMakeLists.txt](CMakeLists.txt)
- added a custom component using cmake's [qt_add_qml_module](https://doc.qt.io/qt-6/qt-add-qml-module.html) in modules [CMakeLists.txt](components/CMakeLists.txt)
- added the module to the main project with using cmake's [add_subdirectory](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
- Linked the component with ```<component lib name>Plugin``` i.e ```MyComponentLibplugin```

## [Main.qml](Main.qml)
- Imported and reused the component in [main.qml](Main.qml) with ```import MyComponents```

## [qmldir](components/qmldir)
- added a [```qmldir```](components/qmldir) file to demonstrate how other build/interpretation systems such as qmake and qmlproject create and reuse components. Resource [https://doc.qt.io/qt-6/qtqml-modules-qmldir.html](https://doc.qt.io/qt-6/qtqml-modules-qmldir.html)