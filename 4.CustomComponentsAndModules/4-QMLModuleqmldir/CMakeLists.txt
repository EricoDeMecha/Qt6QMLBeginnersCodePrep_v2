cmake_minimum_required(VERSION 3.16)

project(4-QMLModuleqmldir VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app4-QMLModuleqmldir
    main.cpp
)

qt_add_qml_module(app4-QMLModuleqmldir
    URI 4-QMLModuleqmldir
    VERSION 1.0
    QML_FILES
    Main.qml
    custom_buttons/BlueButton.qml
    custom_buttons/GreenButton.qml
    custom_buttons/MButton.qml
    custom_buttons/RedButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app4-QMLModuleqmldir PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app4-QMLModuleqmldir
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app4-QMLModuleqmldir
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS app4-QMLModuleqmldir
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
# install(DIRECTORY custom_buttons DESTINATION "${CMAKE_INSTALL_LIBDIR}/qt/qml")
