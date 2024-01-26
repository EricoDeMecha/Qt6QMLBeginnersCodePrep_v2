// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQml.XmlListModel

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("XmlListModel")

    XmlListModel {
        id: mXmlListModelId
        source: "qrc:/xml/employees.xml"
        query: "/courses/course"

        XmlListModelRole {
            name: "instructor"
            elementName: "instructor"
        }
        XmlListModelRole {
            name: "year"
            elementName: "year"
        }
        XmlListModelRole {
            name: "coursename"
            elementName: "coursename"
        }
        XmlListModelRole {
            name: "hot"
            elementName: "coursename"
            attributeName: "hot"
        }
        // onProgressChanged: {
        //     console.log("Loading... " + progress);
        // }
        // onStatusChanged: {
        //     switch (status) {
        //     case XmlListModel.Null:
        //         console.log("No XML data has been set for this model.");
        //         break;
        //     case XmlListModel.Ready:
        //         console.log("The XML data has been loaded into the model.");
        //         break;
        //     case XmlListModel.Loading:
        //         console.log("The model is in the process of reading and loading XML data.");
        //         break;
        //     case XmlListModel.Error:
        //         console.log("An error occurred while the model was loading. Error.." + mXmlListModelId.errorString());
        //         break;
        //     }
        // }
    }

    ListView {
        id: mListViewId
        anchors.fill: parent
        model: mXmlListModelId
        delegate: Rectangle {
            width: parent.width
            height: 50
            color: "beige"
            Row {
                spacing: 30
                Text {
                    text: instructor
                    font.pointSize: 15
                }
                Text {
                    text: coursename + " (" + year + ")"
                    font.bold: hot === "true" ? true : false
                    font.pointSize: 15
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + hot);
                }
            }
        }
    }
}
