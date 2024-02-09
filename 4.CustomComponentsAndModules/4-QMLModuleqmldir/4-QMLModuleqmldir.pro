QT += quick

SOURCES += \
        main.cpp

# copy the custom_buttons folder to the build directory
copydata.commands = $(COPY_DIR) $$PWD/custom_buttons $$OUT_PWD
copyfile.commands = $(COPY_FILE) $$PWD/Main.qml $$OUT_PWD
first.depends = $(first) copydata copyfile

export(first.depends)
export(copydata.commands)
export(copyfile.commands)

QMAKE_EXTRA_TARGETS += first copydata copyfile

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

QT_DEBUG_PLUGINS=1
QML_IMPORT_TRACE=1

INSTALLS += target

DISTFILES += custom_buttons/qmldir
