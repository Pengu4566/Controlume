import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5


Window {
    title: qsTr("OSC")
    width: 2736
    height: 1700
    visible: true

    Rectangle {
        id: rectangle
        width: 2736
        height: 1824
        anchors.fill: parent
        color: "#0f8790"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        ComboBox {
            id: blendMode
            x: 926
            y: 1449
        }

        Text {
            id: comp_text_opacity
            x: 121
            y: 1456
            width: 175
            height: 56
            text: qsTr("Opacity")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: comp_text_speed
            x: 543
            y: 1456
            width: 142
            height: 56
            text: qsTr("Speed")
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_scale
            x: 2065
            y: 1467
            width: 115
            height: 51
            text: qsTr("Scale")
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_rotation
            x: 2444
            y: 1467
            width: 185
            height: 51
            text: qsTr("Rotation")
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: element1
            x: 926
            y: 1503
            text: qsTr("add items to this through dataframe")
            font.pixelSize: 12
        }

        Slider {
            id: slider
            x: 926
            y: 1183
            width: 864
            height: 72
            spacing: 2
            focusPolicy: Qt.TabFocus
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 445
            font.wordSpacing: -0.2
            font.pointSize: 13
            value: 0.5
        }

        Text {
            id: element7
            x: 971
            y: 1126
            width: 795
            height: 63
            text: qsTr("BPM: (make text here reflect slider)")
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Dial {
            id: comp_dial_rotation
            x: 2328
            y: 1292
            from: 0.5
            to: 1
            width: 400
            height: 400
            inputMode: Dial.Circular
            value: 0.5
            onAngleChanged:  {
                controller.sendSomething("/composition/video/effects/transform/rotationz", [value]);
                board
            }
        }

        Dial {
            id: comp_dial_scale
            x: 1922
            y: 1292
            from: 0.1
            to: 0.5
            width: 400
            height: 400
            inputMode: Dial.Circular
            value: 0.1
            onAngleChanged:  {
                controller.sendSomething("/composition/video/effects/transform/scale", [value]);
            }
        }

        Dial {
            id: comp_dial_speed
            x: 414
            y: 1284
            from: 0.01
            to: 0.2
            width: 400
            height: 400
            inputMode: Dial.Circular
            value: 0.05
            onAngleChanged:  {

                //var transformed_value = board.speed_transform(value)

                controller.sendSomething("/composition/speed", [value]);

            }
        }

        Dial {
            id: comp_dial_opacity
            x: 8
            y: 1284
            width: 400
            height: 400
            spacing: 0
            wheelEnabled: false
            inputMode: Dial.Circular
            value: 1.0
            onAngleChanged:  {
                controller.sendSomething("/composition/video/opacity", [value]);
            }

        }

        Button {
            id: button
            x: 1197
            y: 1297
            text: qsTr("RESYNC")
            font.pointSize: 20
            onClicked: {
                controller.sendSomething("/composition/tempocontroller/resync", [0]);
            }
        }

        Slider {
            id: comp_master_volume_slider
            x: 856
            y: 1612
            width: 1038
            height: 72
            anchors.bottomMargin: 16
            font.pointSize: 13
            spacing: 2
            font.wordSpacing: -0.2
            value: 0.5
            anchors.bottom: parent.bottom
            focusPolicy: Qt.TabFocus
        }

        Text {
            id: comp_text_volume
            x: 1290
            y: 1543
            width: 170
            height: 63
            text: qsTr("Volume")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }


        Dial {
            id: layer1_dial_opacity
            x: 58
            y: 362
            width: 375
            height: 375
            inputMode: Dial.Circular
            value: 1.0
            onAngleChanged:  {
                //var transformed_value = board.opacity_transform(value)
                controller.sendSomething("/composition/layers/1/video/opacity", [value])
            }
        }

        Slider {
            id: layer1_master_volume_slider1
            x: 68
            y: 859
            width: 760
            height: 72
            font.pointSize: 13
            anchors.bottomMargin: 769
            font.wordSpacing: -0.2
            spacing: 2
            value: 0.5
            anchors.bottom: parent.bottom
            focusPolicy: Qt.TabFocus
        }

        Button {
            id: layer1_button_shuffle_next
            x: 323
            y: 144
            width: 250
            height: 125
            text: "NEXT"
            font.pointSize: 22
        }

        Button {
            id: layer1_button_shuffle_off
            x: 594
            y: 144
            width: 250
            height: 125
            text: "OFF"
            font.pointSize: 22
        }

        Button {
            id: layer1_button_shuffle_on
            x: 58
            y: 144
            width: 250
            height: 125
            text: "ON"
            font.pointSize: 22
        }

        Column {
            id: layer1_column
            x: 0
            y: 0
            width: 896
            height: 1098



        }

        Column {
            id: layer2_column
            x: 902
            y: 0
            width: 932
            height: 1098
        }

        Column {
            id: layer3_column
            x: 1832
            y: 0
            width: 904
            height: 1098
        }

        Button {
            id: layer2_button_shuffle_off1
            x: 1506
            y: 144
            width: 250
            height: 125
            text: "OFF"
            font.pointSize: 22
        }

        Button {
            id: layer2_button_shuffle_next1
            x: 1243
            y: 144
            width: 250
            height: 125
            text: "NEXT"
            font.pointSize: 22
        }

        Slider {
            id: layer2_master_volume_slider2
            x: 989
            y: 859
            width: 760
            height: 72
            font.pointSize: 13
            anchors.bottomMargin: 769
            font.wordSpacing: -0.2
            spacing: 2
            value: 0.5
            anchors.bottom: parent.bottom
            focusPolicy: Qt.TabFocus
        }

        Dial {
            id: layer2_dial_opacity
            x: 980
            y: 362
            width: 375
            height: 375
            value: 1.0
            inputMode: Dial.Circular
            onAngleChanged:  {
                controller.sendSomething("/composition/layers/2/video/opacity", [value]);
            }
        }

        Button {
            id: layer2_button_shuffle_on1
            x: 980
            y: 144
            width: 250
            height: 125
            text: "ON"
            font.pointSize: 22
        }

        Button {
            id: layer3_button_shuffle_off2
            x: 2422
            y: 144
            width: 250
            height: 125
            text: "OFF"
            font.pointSize: 22
        }

        Button {
            id: layer3_button_shuffle_next2
            x: 2159
            y: 144
            width: 250
            height: 125
            text: "NEXT"
            font.pointSize: 22
        }

        Slider {
            id: layer3_master_volume_slider3
            x: 1904
            y: 859
            width: 760
            height: 72
            anchors.bottomMargin: 769
            font.pointSize: 13
            spacing: 2
            font.wordSpacing: -0.2
            value: 0.5
            anchors.bottom: parent.bottom
            focusPolicy: Qt.TabFocus
        }

        Dial {
            id: layer3_dial_rotation
            x: 2297
            y: 362
            from: 0.5
            to: 1
            width: 375
            height: 375
            value: valueFromPoint(mouseX, mouseY)
            inputMode: Dial.Circular
            onAngleChanged:  {
                controller.sendSomething("/composition/layers/3/video/effects/transform/rotationz", [value]);
            }
        }

        Button {
            id: layer3_button_shuffle_on2
            x: 1898
            y: 144
            width: 250
            height: 125
            text: "ON"
            font.pointSize: 22
        }

        Text {
            id: layer1_text_shufle
            x: 371
            y: 67
            width: 155
            height: 56
            text: qsTr("Shuffle")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer2_text_shuffle
            x: 1292
            y: 67
            width: 155
            height: 56
            text: qsTr("Shuffle")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer3_text_shufle
            x: 2207
            y: 67
            width: 155
            height: 56
            text: qsTr("Shuffle")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Dial {
            id: layer1_dial_rotation
            x: 469
            y: 362
            from: 0.5
            to: 1
            width: 375
            height: 375
            value: valueFromPoint(mouseX, mouseY)
            inputMode: Dial.Circular
            onAngleChanged: {
                controller.sendSomething("/composition/layers/1/video/effects/transform/rotationz", [value]);
            }
        }

        Dial {
            id: layer2_dial_rotation
            x: 1381
            y: 362
            from: 0.5
            to: 1
            width: 375
            height: 375
            value: valueFromPoint(mouseX, mouseY)
            inputMode: Dial.Circular
            onAngleChanged: {
                controller.sendSomething("/composition/layers/2/video/effects/transform/rotationz", [value]);
            }
        }

        Dial {
            id: layer3_dial_opacity
            x: 1898
            y: 362
            width: 375
            height: 375
            value: 1.0
            inputMode: Dial.Circular
            onAngleChanged:  {
                controller.sendSomething("/composition/layers/3/video/opacity", [value]);
            }
        }

        Text {
            id: layer1_text_opacity
            x: 158
            y: 521
            width: 175
            height: 56
            text: qsTr("Opacity")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer2_text_opacity
            x: 1080
            y: 521
            width: 175
            height: 56
            text: qsTr("Opacity")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer3_text_opacity
            x: 2005
            y: 522
            width: 175
            height: 56
            text: qsTr("Opacity")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer3_text_rotation
            x: 2392
            y: 527
            width: 185
            height: 51
            text: qsTr("Rotation")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer2_text_rotation
            x: 1476
            y: 526
            width: 185
            height: 51
            text: qsTr("Rotation")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: layer1_text_rotation
            x: 564
            y: 526
            width: 185
            height: 51
            text: qsTr("Rotation")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: infomrative_text
            x: 80
            y: 1191
            width: 605
            height: 56
            text: qsTr("VVVV COMPOSITION VVVV")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: infomrative_text1
            x: 2065
            y: 1191
            width: 605
            height: 56
            text: qsTr("VVVV COMPOSITION VVVV")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: infomrative_text2
            x: 232
            y: 982
            width: 434
            height: 52
            text: qsTr("^^^ LAYER 1 ^^^")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: infomrative_text3
            x: 1153
            y: 974
            width: 434
            height: 52
            text: qsTr("^^^ LAYER 2 ^^^")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Text {
            id: infomrative_text4
            x: 2068
            y: 974
            width: 434
            height: 52
            text: qsTr("^^^ LAYER 3 ^^^")
            textFormat: Text.AutoText
            font.pixelSize: 50
        }

        Button {
            id: button_reset
            x: 1476
            y: 1297
            text: qsTr("RESET ALL")
            font.pointSize: 20

            NumberAnimation {
                    id: animateScale
                    target: comp_dial_scale
                    properties: "scale"
                    to: 0
                    loops: Animation.Infinite
                    easing {type: Easing.OutBack; overshoot: 500}
               }

            onClicked: {

                //reset scale
                controller.sendSomething("/composition/video/effects/transform/scale", [0.1]);

                //comp_dial_scale.value = 0.1

                //while(comp_dial_scale.value != 0.1)
                //{
                //    comp_dial_scale.value = comp_dial_scale.value - 0.0001
                //    //console.log(comp_dial_scale.value)
                //}

                //reset speed
                controller.sendSomething("/composition/speed", [0.1]);

                comp_dial_speed.value = 0.05

                //reset rotation
                controller.sendSomething("/composition/video/effects/transform/rotationz", [0.5]);
                controller.sendSomething("/composition/layers/1/video/effects/transform/rotationz", [0.5]);
                controller.sendSomething("/composition/layers/2/video/effects/transform/rotationz", [0.5]);
                controller.sendSomething("/composition/layers/3/video/effects/transform/rotationz", [0.5]);



                comp_dial_rotation.value = 0.5
                layer1_dial_rotation.value = 0.5
                layer2_dial_rotation.value = 0.5
                layer3_dial_rotation.value = 0.5


                //reset opacity
                controller.sendSomething("/composition/video/opacity", [0.99]);
                controller.sendSomething("/composition/layers/1/video/opacity", [0.99]);
                controller.sendSomething("/composition/layers/2/video/opacity", [0.99]);
                controller.sendSomething("/composition/layers/3/video/opacity", [0.99]);

                comp_dial_opacity.value = 1
                layer1_dial_opacity.value = 1
                layer2_dial_opacity.value = 1
                layer3_dial_opacity.value = 1
            }
        }

        Text {
            id: layer1_text_rotation_value
            x: 564
            y: 464
            width: 185
            height: 51
            color: "#ffffff"
            text: (layer1_dial_rotation.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: layer1_text_opacity_value
            x: 158
            y: 459
            width: 175
            height: 56
            color: "#ffffff"
            text: (layer1_dial_opacity.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: layer2_text_opacity_value
            x: 1080
            y: 459
            width: 175
            height: 56
            color: "#ffffff"
            text: (layer2_dial_opacity.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: layer2_text_rotation_value
            x: 1476
            y: 464
            width: 185
            height: 51
            color: "#ffffff"
            text: (layer2_dial_rotation.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: layer3_text_opacity_value
            x: 2005
            y: 459
            width: 175
            height: 56
            color: "#ffffff"
            text: (layer3_dial_opacity.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: layer3_text_rotation_value
            x: 2392
            y: 464
            width: 185
            height: 51
            color: "#ffffff"
            text: (layer3_dial_rotation.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_rotation_value
            x: 2444
            y: 1410
            width: 185
            height: 51
            color: "#ffffff"
            text: (comp_dial_rotation.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_scale_value
            x: 2076
            y: 1410
            width: 115
            height: 51
            color: "#ffffff"
            text: (comp_dial_scale.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_speed_value
            x: 543
            y: 1394
            width: 142
            height: 56
            color: "#ffffff"
            text: (comp_dial_speed.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }

        Text {
            id: comp_text_opacity_value
            x: 121
            y: 1394
            width: 175
            height: 56
            color: "#ffffff"
            text: (comp_dial_opacity.value * 100).toFixed(2) + "%"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
            textFormat: Text.AutoText
        }











    }
}
