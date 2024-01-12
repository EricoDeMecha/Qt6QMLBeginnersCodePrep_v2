# Qt6-QML Introduction - QML Tool

## Requirements 

- Qt6 installed.
- Qt6-QtQuick installed

## What is a qml tool?

A build-in tool that comes with Qt installation used for prototyping QML.

## Where is the tool found?

Qt installation directory with Qt executables. ```<QtInstallationDir>/<Version>/gcc_64/bin/```

## How is it used?

Write your QML application/component code as follows

```qml
// main.qml
import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        anchors.centerIn: parent
        text : "Hello World";
        color: "red"
        font.pointSize: 20
    }
}
```
and view it with 

```shell
<QtInstallationDir>/<Version>/gcc_64/bin/qml main.qml
```

and this will load your application code into a resizable view. 

## Resources

1. [Protyping with QML Scene](https://doc.qt.io/qt-5/qtquick-qmlscene.html) (deprecated in favor of qml tool)