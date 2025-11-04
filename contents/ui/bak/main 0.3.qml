// import QtQuick 2.15
// import QtQuick.Layouts 1.0
// import org.kde.plasma.core 2.0 as PlasmaCore
// // import org.kde.plasma.components 2.0 as PlasmaComponents
// import org.kde.plasma.components 3.0 as PlasmaComponents
// import org.kde.plasma.plasmoid 2.0

import QtQuick  // TextInput
import QtQuick.Controls  // TextField
import QtQuick.Layouts  // RowLayout
import org.kde.plasma.components
import org.kde.plasma.plasmoid  // PlasmoidItem
import org.kde.plasma.core // dialog


PlasmoidItem{
    id: root
    property var pythonBackend: backend // ref python backend
    // focus: true

    Button {
        onClicked: dialog.visible = !dialog.visible
        icon.name: "view-refresh-symbolic"

        // Popup window that opens when button is clicked
        Dialog {
            id: dialog
            visible: false
            x: 50
            y: 1180-400
            // anchors.bottom: parent
            // hoverEnabled: true
            // flags: Qt.Popup
            // location: PlasmaCore.Types.BottomEdge  // aligns with panel edge
            // title: "Title"
            // standardButtons: Dialog.Ok | Dialog.Cancel

            // onAccepted: console.log("Ok clicked")
            // onRejected: console.log("Cancel clicked")
        //
            mainItem: Rectangle {
                id: rect
                width: 300
                height: 400
                color: "#2E3440"

                // use id to of textinput to set textbox
                // Text { text: myTextInput.text; color: "white" }

                Text {
                    id: txt
                    anchors.top: parent
                    text: "Hello from QuikLLM!"
                    color: "white"
                }

                TextField {
                    id: searchBox
                    anchors.bottom : rect.bottom

                    // text: "Hello World";
                    color: "green";
                    width: 260;
                    placeholderText: "Type something…"
                    focus: true
                    hoverEnabled: true

                    // Signal handler - this runs when editing is finished (Enter or focus lost)
                    // add "on" to signalfunction
                    onAccepted: {
                        txt.text = searchBox.text
                    }
                }
            }
        }
    }
}
