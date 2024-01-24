# Changes

- Builds on [History.md](../7-CustomComponents/History.md)
  
## [CMakeLists.txt](CMakeLists.txt)

- added another custom component [MyConstants](constants/)
    - MyConstants component demonstrates how to store constants as a component and re-use them. 
- Linked the component with  ```<component lib name>plugin``` i.e ```MyConstantsLibplugin```

## [constants/CMakeLists.txt](constants/CMakeLists.txt)

- set singleton property on the component sources
```cmake
set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
QT_QML_SINGLETON_TYPE  TRUE
)
```
  - Constants obj once created should not be created again since every instance will assume the initialization values and ignores changes made in other instances 
  - Resource [Singleton Design Pattern](https://refactoring.guru/design-patterns/singleton/cpp/example) 
## [Main.qml](Main.qml)
- Imported and used the constants