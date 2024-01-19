// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Basic Elements Demo")

    Item {
        id: containerItemId
        // x: 150; y: 50
        width: 600
        height: 300
        anchors.centerIn: parent

        // Image {
        //     x: 150
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Loading image from the resource file
        //     source: "qrc:/images/LearnQt.png"
        // }

        // Image {
        //     x: 450
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Specify the full web path to the image
        //     source: "https://www.learnqt.guide/assets/blog/image/LearnQt.png"
        // }

        Row {
            spacing: 20
            anchors.centerIn: parent

            Repeater {
                anchors.fill: parent
                model: [{
                        source: "qrc:/images/LearnQt.png"
                    }, {
                        source: "https://www.learnqt.guide/assets/blog/image/LearnQt.png"
                    }]
                Image {
                    width: 100
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: modelData.source
                    asynchronous: true
                }
            }
        }
    }
}
