import QtQuick  // TextInput
import QtQuick.Controls  // TextField
import QtQuick.Layouts  // RowLayout
import org.kde.plasma.plasmoid  // PlasmoidItem
import org.kde.plasma.core // dialog
import "components" as Components // GetAPI
import "code/bakend.js" as Bakend;
import "code/gemini.js" as Gemini;

// import "code/tools.py" as Py // cant do thiw
// import org.kde.klauncher
// import org.kde.kio


PlasmoidItem{
    id: root
    // property var pythonBackend: backend // ref python backend
    // focus: true

    // property string baseUrl: "http://duckduckgo.com/?q="
    property string baseUrl: "http://httpbin.org/"
    property string query: "forms/post"

    Button {
        Layout.fillWidth
        Layout.fillHeight
        onClicked: dialog.visible = !dialog.visible
        icon.name: "view-refresh-symbolic"

        // Popup window that opens when button is clicked
        Dialog {
            id: dialog
            visible: false
            x: 50
            y: 1200-rect.height-55 // minus direction is up
            // y: 1200-rect.height

            ColumnLayout {
                    id: rect
                    width: 500
                    height: 700

                ScrollView {
                    anchors.top: parent
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    // width: 500
                    // height: 660

                    TextArea {
                        id: txt         // use id to of textinput to set textbox
                        anchors.top: parent
                        text: "output"
                        wrapMode: Text.WordWrap
                        // background color = color: "#2E3440"
                        color: "light blue"
                        font.pixelSize: 16
                    } // Text
                } // Scroll

                RowLayout {
                    TextField {
                        id: searchBox
                        anchors.bottom : rect.bottom
                        text: "write a one line quip";
                        color: "light blue"
                        // width: 500  // ??
                        placeholderText: "Type something…"
                        focus: true
                        hoverEnabled: true

                        // Signal handler - this runs when editing is finished (Enter)
                        // add "on" to signal function
                        onAccepted: {
                            // txt.text = apiFetcher.fetchData(baseUrl + searchBox.text);
                            Gemini.fetchGem(searchBox.text, function(result) {
                                if (result)
                                    txt.text = result;
                                else
                                    txt.text = "Error fetching response";
                                }); // callback
                            }
                    } // end textField

                    Button {
                        // anchors.right : rect.right
                        onClicked: {
                            var command = "/usr/bin/konsole";
                            // Qt.openUrlExternally(command)  // sec error
                            // Bakend.changeLabel("new");
                            Bakend.fetch();  // javascript code
                        }
                    } //  Button

                    Button {
                        onClicked: {
                        }
                    } //  Button
                } // end RowLayout

            } // Column : rect
        } // Dialog
    } // Button

    // Fetch HTTP request qml Component
    // Items must start with a capital Letter
    Components.GetAPI {
        id: apiFetcher

        // slot for API signal
        onDataReceived: {
            txt.text = data;
        }
    }
} // end plasmoid item
