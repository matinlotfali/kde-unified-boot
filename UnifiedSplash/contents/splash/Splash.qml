import QtQuick 2.1


Rectangle {
    id: root
    color: "#000000"

    property int stage

    onStageChanged: {        
        introAnimation.running = true        
    }
    
    Image {
        source: "images/image.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
//     Image {
//         source: "images/watermark.png"
//         anchors {
//             horizontalCenter: parent.horizontalCenter                
//             bottom: parent.bottom
//             bottomMargin: root.height*0.04
//         }
//     }
    Rectangle {
        radius: 4
        color: "#2a2a2b"
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height * 0.7 - 2
        height: 8
        width: height*32
        Rectangle {
            radius: 3
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width/2 + (parent.width / 6) * (stage)/2
            color: "#ffffff"
            Behavior on width { 
                PropertyAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
