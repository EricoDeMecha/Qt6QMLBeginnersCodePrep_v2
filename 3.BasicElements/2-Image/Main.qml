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
        //     x: 10
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Loading image from the working directory
        //     source: "file:LearnQt.png"
        // }

        // Image {
        //     x: 150
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Loading image from the resource file
        //     source: "images/LearnQt.png"
        // }

        // //Load image from a full path
        // Image {
        //     x: 300
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Specify the full path to the image
        //     source: "file:///D:/Artwork/LearnQt.png"
        // }

        // Image {
        //     x: 450
        //     y: 50
        //     width: 100
        //     height: 100
        //     //Specify the full web path to the image
        //     source: "https://www.learnqt.guide/assets/blog/image/LearnQt.png"
        // }

        Column {
            id: imageContainer
            spacing: 20
            anchors.fill: parent
            Repeater {
                id: imageRepeater
                anchors.fill: parent
                model: [
                    // { source: "file:LearnQt.png" }, // supported in the deprecated qt5 resource system
                    {
                        source: "images/LearnQt.png"
                    },
                    // { source: "file:///D:/Artwork/LearnQt.png" }, // same case here
                    {
                        source: "https://www.learnqt.guide/assets/blog/image/LearnQt.png"
                    }]

                Image {
                    width: imageContainer.width
                    height: (imageContainer.height - (imageContainer.spacing * (imageRepeater.count - 1))) / imageRepeater.count
                    fillMode: Image.PreserveAspectFit
                    source: modelData.source
                    asynchronous: true
                }
            }
        }
    }
}
