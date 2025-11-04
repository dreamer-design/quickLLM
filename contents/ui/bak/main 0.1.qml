// import QtQuick 2.15
// import QtQuick.Layouts 1.0
// import org.kde.plasma.core 2.0 as PlasmaCore
// // import org.kde.plasma.components 2.0 as PlasmaComponents
// import org.kde.plasma.components 3.0 as PlasmaComponents
// import org.kde.plasma.plasmoid 2.0

import QtQuick  // objects
// import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid  // PlasmoidItem


PlasmoidItem{
    id: root
    // Always display the full view. Never show the compact icon view
    // like it does by default when shown in the panel.
    // readonly property bool plasmoid.preferredRepresentation: plasmoid.fullRepresentation

    Rectangle {
        width: 300
        height: 40
        color: "black" }
    //
    //     // nested and asigned to a property
    //     gradient: Gradient {
    //         GradientStop { position: 0.0; color: "yellow" }
    //         GradientStop { position: 1.0; color: "green" }
    //     }
    //
    //     // declared as a visual child
    //     Text {
    //         anchors.centerIn: parent
    //         text: "Hello, QML!"
    //     }
    // }
    //
    // PlasmaComponents.Label {
    //     text: "Hello World!"
    // }

    Row {
        width: 500

        TextInput {
            id: myTextInput;
            text: "Hello World";
            color: "green";
            width: 260
        }

        PlasmaComponents.ToolButton {
            icon.name: "view-refresh-symbolic"
            // text: i18n("Refresh")


        }

        // use id to of textinput to set textbox
        // Text { text: myTextInput.text; color: "white" }
    }

    Item {
        // property int someNumber
        // property string someString
        property url someUrl
        property var someNumber: 1.5
        property var someString: "abc"
        property var someBool: true
        property var someList: [1, 2, "three", "four"]
        property var someObject: Rectangle { width: 100; height: 100; color: "red" }
    }

}
