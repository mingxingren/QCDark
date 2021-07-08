import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    property alias color: button.color
    property real radius: 3
    property alias text: button_text.text
    property alias shadow_horizontalOffset : button_shadow.horizontalOffset
    property alias shadow_verticalOffset : button_shadow.verticalOffset

    Rectangle{
        id: button
        anchors.fill:  parent
        radius: root.radius
        color: "red"
        Text {
            id: button_text
            anchors.fill: parent
            clip: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("button")
        }
    }

    DropShadow{
        id: button_shadow
        anchors.fill: button
        horizontalOffset: {
            return 3;
        }
        verticalOffset: {
            return 3
        }
        radius: root.radius
        color: Qt.lighter(button.color)
        source: button
        opacity: 0.5
    }

    MouseArea {
        id: button_mousearea
        anchors.fill: button
        hoverEnabled: true
        property color button_originalcolor
        onEntered: {
            button_mousearea.button_originalcolor = button.color;
            button.color = Qt.darker(button.color);
        }
        onExited:{
            button.color = button_mousearea.button_originalcolor
        }
    }
}
