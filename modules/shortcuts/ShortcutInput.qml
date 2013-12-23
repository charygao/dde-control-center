import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "../widgets"

Item {
    id: keyBindItem
    width: parent.width

    property var dconstants: DConstants {}
    property int grabKeyAreaWidth: 150

    property string displayName: ""
    property string keybindLabel: ""
    property string oldShortcut: ""

    DssH3 {
        text: "Launcher"
        anchors.left: parent.left
        anchors.leftMargin: dconstants.leftMargin
        anchors.verticalCenter: parent.verticalCenter
    }

    FocusScope {
        id: scope
        width: grabKeyAreaWidth
        height: parent.height - 8
        anchors.right: parent.right
        anchors.rightMargin: dconstants.rightMargin
        anchors.verticalCenter: parent.verticalCenter
        focus: true

        //Rectangle {
            //anchors.fill: parent
            //radius: 4
            //color: field.activeFocus ? "#101010" : "transparent"
        //}

        Text {
            id: field
            anchors.fill: parent
            //readOnly: true
            //cursorVisible: false
            focus: false
            horizontalAlignment: TextInput.AlignRight
            verticalAlignment: TextInput.AlignVCenter
            font.pixelSize: 11
            color: activeFocus ? "blue" : dconstants.fgColor
            text: displayName ? displayName : "Disable"

            Keys.onPressed: {
                if(event.key == Qt.Key_Escape){
                    field.focus = false
                }
                print(event.text)
                //if (event.modifiers){
                    //print(event.modifiers)
                //}
            }

            Keys.onReleased: {
            }

            onActiveFocusChanged: {
                if (activeFocus){
                    print(parent.width)
                    oldShortcut = text
                    text = dsTr("Please input new shortcuts") + "  "
                    print(windowView.grabKeyboard(true))
                }
                else {
                    text = oldShortcut
                    print(windowView.grabKeyboard(false))
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    field.focus = true
                    print(field.focus, field.activeFocus)
                }
            }
        }
    }
}

