QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources \
    custom_buttons.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Not sure if this is needed. Will confirm after test on linux.
# DISTFILES += custom_buttons/qmldir

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
