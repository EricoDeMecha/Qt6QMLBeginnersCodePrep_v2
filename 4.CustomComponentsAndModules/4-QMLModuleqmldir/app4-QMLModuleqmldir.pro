QT += quick

TARGET = app4_QMLModuleqmldir
TEMPLATE = app

SOURCES += main.cpp

# Copy custom_buttons directory to build output directory
copyModuleDir.commands = cp -r custom_buttons/ $$QT_INSTALL_BINS/
QMAKE_EXTRA_TARGETS += copyModuleDir

# Copy Main.qml to build output directory
copyMainQML.commands = cp Main.qml  $$QT_INSTALL_BINS/
QMAKE_EXTRA_TARGETS += copyMainQML

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

