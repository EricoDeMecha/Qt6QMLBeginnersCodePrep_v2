import QtQuick

Item {
    readonly property alias text: textInputId.text
    property alias label: labelId.text
    property alias placeHolderText: placeHolderId.text

    signal editingFinished

    Row {
        spacing: 10

        Rectangle {
            id: labelRectId
            width: labelId.implicitWidth + 20
            height: labelId.implicitHeight + 20
            color: "beige"

            Text {
                id: labelId
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: textInputRectId
            color: "beige"
            width: (placeHolderId.implicitWidth + textInputId.implicitWidth) + 20
            height: placeHolderId.implicitHeight + 20

            Text {
                id: placeHolderId
                anchors {
                    centerIn: parent
                    fill: parent
                }
                visible: !textInputId.length && !textInputId.inputMethodComposing
                verticalAlignment: Text.AlignVCenter
            }

            TextInput {
                id: textInputId
                anchors {
                    centerIn: parent
                    fill: parent
                }
                focus: true
                verticalAlignment: TextInput.AlignVCenter
            }
        }
    }

    Component.onCompleted: {
        textInputId.onEditingFinished.connect(editingFinished);
    }

    implicitHeight: (labelRectId.implicitHeight + textInputRectId.implicitHeight) + 20
}
