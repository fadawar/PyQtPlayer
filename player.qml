import QtQuick 2.2
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtMultimedia 5.0

ApplicationWindow {
    id: window
    flags: Qt.FramelessWindowHint
    visible: true
    title: qsTr("PyQt Player")
    width: 600
    height: 300
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2
    color: "transparent"

    Rectangle {
        id: root
        anchors.fill: parent
        color: "lightgrey"

        Video {
            id: video
            anchors.fill: parent

            focus: true
            Keys.onSpacePressed: video.paused = !video.paused
            Keys.onLeftPressed: video.position -= 5000
            Keys.onRightPressed: video.position += 5000
        }

        DropArea {
            anchors.fill: parent
            onEntered: {
                root.color = "lightyellow"
            }
            onExited: {
                root.color = "lightblue"
            }
            onDropped: {
                root.color = "lightgreen"
                if (drop.hasUrls) {
                    console.log(drop.urls);
                    video.source = drop.urls[0];
                    console.log(video.metaData);
                    window.width = video.metaData.resolution ? video.metaData.resolution.width : 300;
                    window.height = video.metaData.resolution ? video.metaData.resolution.height : 150;
                    video.play();
                }
            }
        }

        Rectangle {
            anchors.right: root.right
            anchors.top: root.top
            anchors.margins: 10
            width: 10
            height: 10
            color: "red"

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit();
            }
        }
    }
}
