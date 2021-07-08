// 参考 知乎博主陈锦明 https://zhuanlan.zhihu.com/p/37127853

import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Switch {
    id: control
    indicator: Item{
        id: indicatorItem
        implicitWidth: 135
        implicitHeight: 58
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        // 向外阴影
        RectangularGlow {
            id: effect
            anchors.fill: boundaryRect
            glowRadius: 3
            spread: 0.2
            color: "black"
            cornerRadius: boundaryRect.radius + glowRadius
        }
        // 内部填充
        Item {
            id: src
            anchors.fill: boundaryRect

            Rectangle {
                anchors.centerIn: parent
                width: src.width - 2
                height: src.height - 2
                color: "#262626"
                radius: boundaryRect.radius
            }
        }
        // 向内阴影
        InnerShadow {
            anchors.fill: src
            cached: true
            horizontalOffset: 0
            verticalOffset: 0
            radius: 16
            samples: 32
            color: "#000000"
            smooth: true
            source: src
        }
        // 边框
        Rectangle{
            id: boundaryRect
            anchors.fill: parent
            anchors.margins: 3
            border{color: "#515151"; width: 2}
            radius: 12
            color: "transparent"
        }
    }
}
