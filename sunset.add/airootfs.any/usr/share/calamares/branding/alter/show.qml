/*
* Yamada Hayao
* Twitter: @Hayao0819
* Email  : hayao@fascode.net
*
* (c) 2019-2020 Fascode Network.
*
* config
*
* Overwrites the first to read and set the build script
* This configuration file follows the bash syntax.
*/

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    Timer {
        interval: 20000
        running: false
        repeat: false
        onTriggered: presentation.goToNextSlide()
    }
    
    Slide {

        Image {
            id: background1
            source: "slide.png"
            width: 800; height: 440
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background1.horizontalCenter
            anchors.top: background1.bottom
            text: ""
            wrapMode: Text.WordWrap
            width: 800
            horizontalAlignment: Text.Center
        }
    }
}
