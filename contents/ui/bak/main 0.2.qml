// import QtQuick 2.15
// import QtQuick.Layouts 1.0
// import org.kde.plasma.core 2.0 as PlasmaCore
// // import org.kde.plasma.components 2.0 as PlasmaComponents
// import org.kde.plasma.components 3.0 as PlasmaComponents
// import org.kde.plasma.plasmoid 2.0

import QtQuick  // TextInput
import QtQuick.Controls  // TextField
// import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid  // PlasmoidItem
import org.kde.plasma.core as PlasmaCore // dialog


PlasmoidItem{
    id: root
    // focus: true

    // Rectangle {
    //     width: 300
    //     height: 40
    //     color: "black" }

    Row {
        width: 500


// i cant get this to take keyboard input
        TextField {
            id: searchBox;
            // text: "Hello World";
            color: "green";
            width: 260;
            placeholderText: "Type something…"
            focus : true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("MouseArea clicked, input1 activeFocus:", searchBox.activeFocus)
                    searchBox.forceActiveFocus()
                }
            }

        }

        PlasmaComponents.ToolButton {
            id: launcherButton
            icon.name: "view-refresh-symbolic";

            onClicked: {
                popup.visible = !popup.visible;   // semicolon: inside JS block
            }
        }

        // Popup window that opens when button is clicked
        PlasmaCore.Dialog {
            id: popup
            visible: false
            // flags: Qt.Popup
            // location: PlasmaCore.Types.BottomEdge  // aligns with panel edge

            mainItem: Rectangle {
                width: 300
                height: 400
                color: "#2E3440"

                // use id to of textinput to set textbox
                // Text { text: myTextInput.text; color: "white" }

                Text {
                    anchors.centerIn: parent
                    text: "Hello from QuikLLM!"
                    color: "white"
                }
            }
        }
    }
}
