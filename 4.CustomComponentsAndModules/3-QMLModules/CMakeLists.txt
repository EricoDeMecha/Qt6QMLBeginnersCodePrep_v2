# Copyright (c) Daniel Gakwaya.
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.16)

project(3-QMLModules VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

set(MY_TARGET app3-QMLModules)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${MY_TARGET}
    main.cpp
)

qt_add_qml_module(${MY_TARGET}
    URI ${PROJECT_NAME}
    # VERSION 1.0
    QML_FILES
        Main.qml
)

# resource(https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
add_subdirectory(custom_buttons)

set_target_properties(${MY_TARGET} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${MY_TARGET}
    PRIVATE Qt6::Quick GreatButtonsLibplugin # link component here with suffix *Plugin
)

install(TARGETS ${MY_TARGET}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET ${MY_TARGET}
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)

install(SCRIPT ${deploy_script})

