import QtQuick.Window 2.2
import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: rectangleMainWallet
    x: parent.width // starts off "screen"
    anchors.verticalCenter: parent.verticalCenter
    width: parent.width
    height: parent.height
    color: "#333333"
    visible: false

    Rectangle {
        id: buttonClose
        width: 33
        height: 33
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
        color: "transparent"
        Image {
            id: image_close
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "images/close.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                QmlBridge.clickedCloseWallet()
            }
        }
    }

    Rectangle {
        id: rectangleTop
        height: 110
        color: "transparent"
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 15
        opacity: 1

        Rectangle {
            id: rectangleLockedBalance
            x: 415
            width: 338
            color: "transparent"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Text {
                id: textLockedUnit
                color: "#cfcfcf"
                text: qsTr("TRTL")
                anchors.right: parent.right
                anchors.rightMargin: 18
                verticalAlignment: Text.AlignBottom
                font.family: "Arial"
                font.pixelSize: 15
                anchors.bottom: parent.bottom
                anchors.left: textBalanceValue.right
                anchors.leftMargin: 15
                font.bold: false
                horizontalAlignment: Text.AlignLeft
                anchors.bottomMargin: 10
            }

            Text {
                id: textAvailableUnit
                color: "#cfcfcf"
                text: qsTr("TRTL")
                font.family: "Arial"
                font.pixelSize: 15
                anchors.right: textLockedUnit.right
                anchors.bottom: textLockedUnit.top
                anchors.left: textBalanceValue.right
                anchors.leftMargin: 15
                anchors.rightMargin: 0
                verticalAlignment: Text.AlignBottom
                font.bold: false
                horizontalAlignment: Text.AlignLeft
                anchors.bottomMargin: 12
            }

            Text {
                id: textLockedValue
                color: "#cfcfcf"
                text: qsTr("0")
                anchors.right: textLockedUnit.left
                anchors.rightMargin: 10
                anchors.bottom: textLockedUnit.bottom
                anchors.bottomMargin: -1
                font.family: "Arial"
                font.pixelSize: 20
                anchors.left: textBalanceValue.right
                anchors.leftMargin: 15
                verticalAlignment: Text.AlignBottom
                font.bold: false
                horizontalAlignment: Text.AlignRight

                Connections {
                    target: QmlBridge
                    onDisplayLockedBalance: {
                        textLockedValue.text = data
                    }
                }
            }

            Text {
                id: textAvailableValue
                color: "#cfcfcf"
                text: qsTr("0")
                anchors.right: textLockedValue.right
                anchors.rightMargin: 0
                anchors.bottom: textAvailableUnit.bottom
                anchors.bottomMargin: -1
                font.family: "Arial"
                font.pixelSize: 20
                anchors.left: textBalanceValue.right
                anchors.leftMargin: 15
                verticalAlignment: Text.AlignBottom
                font.bold: false
                horizontalAlignment: Text.AlignRight

                Connections {
                    target: QmlBridge
                    onDisplayAvailableBalance: {
                        textAvailableValue.text = data
                    }
                }
            }

            Text {
                id: textLockedDescr
                color: "#cfcfcf"
                text: qsTr("Locked/Unconfirmed:")
                anchors.bottom: textLockedUnit.bottom
                anchors.bottomMargin: 0
                font.family: "Arial"
                font.pixelSize: 15
                anchors.left: parent.left
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignBottom
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }

            Text {
                id: textAvailableDescr
                color: "#cfcfcf"
                text: qsTr("Available:")
                anchors.bottom: textAvailableUnit.bottom
                anchors.bottomMargin: 0
                anchors.left: textLockedDescr.left
                anchors.leftMargin: 0
                font.family: "Arial"
                font.pixelSize: 15
                verticalAlignment: Text.AlignBottom
                font.bold: false
                horizontalAlignment: Text.AlignLeft
            }
        }

        Text {
            id: textBalance
            color: "#ffffff"
            text: qsTr("BALANCE")
            verticalAlignment: Text.AlignBottom
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Arial"
            font.pixelSize: 25
        }

        Text {
            id: textBalanceValue
            color: "#ffffff"
            text: qsTr("0")
            verticalAlignment: Text.AlignBottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Arial"
            font.pixelSize: 30
            font.bold: true
            anchors.horizontalCenterOffset: 0
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: textBalanceUnit
            color: "#ffffff"
            text: qsTr("TRTL")
            verticalAlignment: Text.AlignBottom
            anchors.left: textBalanceValue.right
            anchors.leftMargin: 15
            anchors.bottom: textBalanceValue.bottom
            anchors.bottomMargin: 2
            font.family: "Arial"
            font.pixelSize: 18
            font.bold: true
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: textBalanceUSD
            color: "#858585"
            text: ""
            anchors.right: textBalanceValue.right
            anchors.rightMargin: 0
            anchors.top: textBalanceUnit.bottom
            anchors.topMargin: 8
            font.family: "Arial"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignRight
            visible: false
        }

        Text {
            id: textUSD
            color: "#858585"
            text: "$"
            anchors.left: textBalanceUnit.left
            anchors.leftMargin: 0
            anchors.bottom: textBalanceUSD.bottom
            anchors.bottomMargin: 0
            font.family: "Arial"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            visible: false
        }
    }

    Rectangle {
        id: rectangleAddress
        height: 126
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectangleTop.bottom
        anchors.topMargin: 30
        color: "transparent"

        Text {
            id: textDescrWalletName
            color: "#858585"
            text: qsTr("wallet: ")
            verticalAlignment: Text.AlignBottom
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 0
            font.family: "Arial"
            font.pixelSize: 15
            font.bold: false
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: textWalletName
            color: "#858585"
            text: ""
            verticalAlignment: Text.AlignBottom
            anchors.left: textDescrWalletName.right
            anchors.leftMargin: 10
            anchors.bottom: textDescrWalletName.bottom
            anchors.bottomMargin: 0
            font.family: "Arial"
            font.pixelSize: 15
            font.bold: false
            horizontalAlignment: Text.AlignLeft
        }

        Button {
            id: buttonBackupKeys
            text: qsTr("Backup keys")
            anchors.verticalCenter: textDescrWalletName.verticalCenter
            anchors.left: textWalletName.right
            anchors.leftMargin: 30
            height: 30
            enabled: true

            contentItem: Text {
                text: buttonBackupKeys.text
                font.pixelSize: 15
                font.family: "Arial"
                font.bold: true
                opacity: enabled ? 1.0 : 0.3
                color: buttonBackupKeys.down ? "#dddddd" : "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 140
                height: 30
                opacity: enabled ? 1 : 0.3
                radius: 6
                color: buttonBackupKeys.down ? "#383838" : "#444444"
            }

            onClicked: {
                QmlBridge.clickedButtonBackupWallet();
            }
        }

        TextInput {
            id: textAddress
            color: "#ffffff"
            text: qsTr("NO WALLET OPEN")
            anchors.left: textDescrWalletName.left
            anchors.leftMargin: 0
            anchors.top: textDescrWalletName.bottom
            anchors.topMargin: 20
            font.family: "Arial"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            readOnly: true
            selectionColor: "#eeeeee"
            selectedTextColor: "#777777"
            selectByMouse: true
        }

        Rectangle {
            id: buttonCopy
            width: 39
            height: 42
            anchors.verticalCenter: textAddress.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 30
            color: "transparent"
            Image {
                id: image_copy
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "images/copy_white.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    QmlBridge.clickedButtonCopyAddress();
                }
            }
        }

        Text {
            id: textDescrCopyAddress
            color: "#858585"
            text: qsTr("Copy your address to receive TRTL")
            anchors.top: buttonCopy.bottom
            anchors.topMargin: 25
            anchors.right: buttonCopy.right
            anchors.rightMargin: 0
            font.family: "Arial"
            horizontalAlignment: Text.AlignRight
            font.weight: Font.Normal
            font.bold: true
            font.pixelSize: 15
        }
    }

    Rectangle {
        id: rectangleHistory
        color: "transparent"
        anchors.bottom: rectangleConnectionInfo.top
        anchors.bottomMargin: 10
        anchors.right: parent.left
        anchors.rightMargin: -590
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: rectangleAddress.bottom
        anchors.topMargin: 10

        Text {
            id: textHistoryTitle
            color: "#ffffff"
            text: qsTr("PREVIOUS TRANSACTIONS")
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
            verticalAlignment: Text.AlignBottom
            font.bold: true
        }

        Component {
            id: delegateListViewTransactions
            ItemListTransaction {
                id: itemListTransaction
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                height: 80
            }
        }

        ListModel {
            id: modelListViewTransactions
        }

        Rectangle {
            id: rectangleListTransactions
            color: "#2b2b2b"
            radius: 11
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: textHistoryTitle.bottom
            anchors.topMargin: 15

            ListView {
                id: listViewTransactions
                model: modelListViewTransactions
                delegate: delegateListViewTransactions
                clip: true
                boundsBehavior: Flickable.DragAndOvershootBounds
                ScrollBar.vertical: ScrollBar {
                    width: 7
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    policy: ScrollBar.AlwaysOn
                }
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 4
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10

                Connections {
                    target: QmlBridge
                    onAddTransactionToList: {
                        modelListViewTransactions.append({
                            transactionAmountValue: amount,
                            transactionPaymentIDValue: paymentID,
                            transactionIDValue: transactionID,
                            transactionConfirmationsValue: confirmations,
                            transactionTimeValue: time,
                            transactionNumberValue: number
                        })
                    }
                }
            }
        }

        Connections {
            target: QmlBridge
            onClearListTransactions: {
                modelListViewTransactions.clear();
            }
        }
    }

    Rectangle {
        id: rectangleTransfer
        color: "transparent"
        anchors.bottom: rectangleConnectionInfo.top
        anchors.bottomMargin: 10
        anchors.left: rectangleHistory.right
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: rectangleHistory.top
        anchors.topMargin: 0

        Text {
            id: textTransferTitle
            color: "#ffffff"
            text: qsTr("TRANSFER")
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.top: parent.top
            font.family: "Arial"
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignBottom
            anchors.topMargin: 10
        }

        Text {
            id: textTransferAddrDescr
            color: "#ffffff"
            text: qsTr("Recipient address")
            anchors.top: textTransferTitle.bottom
            anchors.topMargin: 34
            anchors.left: parent.left
            anchors.bottomMargin: 0
            font.pixelSize: 14
            verticalAlignment: Text.AlignBottom
            anchors.leftMargin: 30
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            anchors.bottom: textAvailableUnit.bottom
        }

        Text {
            id: textTransferAmountDescr
            color: "#ffffff"
            text: qsTr("Amount")
            anchors.top: rectangleTextInputTransferAddress.bottom
            anchors.topMargin: 13
            anchors.left: textTransferAddrDescr.left
            anchors.bottomMargin: 0
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            font.bold: true
            font.family: "Arial"
            anchors.leftMargin: 0
            anchors.bottom: textAvailableUnit.bottom
        }

        Text {
            id: textTransferPaymentIDDescr
            color: "#ffffff"
            text: qsTr("(optional) Payment ID")
            anchors.top: rectangleTextInputTransferAmount.bottom
            anchors.topMargin: 13
            anchors.left: textTransferAddrDescr.left
            anchors.bottomMargin: 0
            font.pixelSize: 14
            verticalAlignment: Text.AlignBottom
            anchors.leftMargin: 0
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            anchors.bottom: textAvailableUnit.bottom
        }

        Text {
            id: textTransferFeeDescr
            color: "#999999"
            text: qsTr("The fee is currently fixed and set to 1 TRTL.")
            anchors.top: textTransferPaymentIDDescr.bottom
            anchors.topMargin: 45
            anchors.left: textTransferAddrDescr.left
            anchors.bottomMargin: 0
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.family: "Arial"
            anchors.leftMargin: 0
            anchors.bottom: textAvailableUnit.bottom
        }

        Text {
            id: textTransferMixinDescr
            color: "#999999"
            text: qsTr("The mixin count is currently fixed and set to 4.")
            anchors.top: textTransferFeeDescr.bottom
            anchors.topMargin: 5
            anchors.left: textTransferAddrDescr.left
            anchors.bottomMargin: 0
            font.pixelSize: 14
            verticalAlignment: Text.AlignBottom
            anchors.leftMargin: 0
            font.family: "Arial"
            font.bold: false
            horizontalAlignment: Text.AlignLeft
            anchors.bottom: textAvailableUnit.bottom
        }

        Button {
            id: buttonSend
            text: qsTr("SEND")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            enabled: false

            contentItem: Text {
                text: buttonSend.text
                font.bold: true
                font.pointSize: 20
                font.family: "Arial"
                opacity: enabled ? 1.0 : 0.3
                color: buttonSend.down ? "#dddddd" : "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 140
                implicitHeight: 60
                opacity: enabled ? 1 : 0.3
                radius: 6
                color: buttonSend.down ? "#383838" : "#444444"
            }

            onClicked: {
                QmlBridge.clickedButtonSend(textInputTransferAddress.text, textInputTransferAmount.text, textInputTransferPaymentID.text);
            }
        }
            
        Rectangle {
            id: rectangleTextInputTransferAddress
            color: "#555555"
            height: 25
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: textTransferAddrDescr.bottom
            anchors.topMargin: 6
            anchors.left: textTransferAddrDescr.left
            anchors.leftMargin: 0
            radius: 3

            TextInput {
                id: textInputTransferAddress
                anchors.fill: parent
                color: "#cfcfcf"
                text: qsTr("")
                rightPadding: 5
                leftPadding: 5
                padding: 2
                selectionColor: "#eeeeee"
                selectedTextColor: "#999999"
                selectByMouse: true
                clip: true
                font.family: "Arial"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter

                onTextChanged: {
                    buttonSend.enabled = textInputTransferAmount.text != "" && textInputTransferAddress.text != ""
                }
            }
        }

        Rectangle {
            id: rectangleTextInputTransferAmount
            color: "#555555"
            anchors.left: textTransferAmountDescr.left
            anchors.leftMargin: 0
            anchors.top: textTransferAmountDescr.bottom
            anchors.topMargin: 7
            height: 25
            width: 90
            radius: 3

            TextInput {
                id: textInputTransferAmount
                anchors.fill: parent
                color: "#cfcfcf"
                text: qsTr("")
                rightPadding: 5
                leftPadding: 5
                padding: 2
                selectionColor: "#eeeeee"
                selectedTextColor: "#999999"
                selectByMouse: true
                clip: true
                font.family: "Arial"
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter

                onTextChanged: {
                    buttonSend.enabled = textInputTransferAmount.text != "" && textInputTransferAddress.text != "";
                    textTransferAmountUSD.text = QmlBridge.getTransferAmountUSD(textInputTransferAmount.text);
                }

                Connections{
                    target: QmlBridge
                    onClearTransferAmount: {
                        textInputTransferAmount.clear()
                    }
                }
            }
        }

        Text {
            id: textTransferAmountUnit
            color: "#999999"
            text: qsTr("TRTL")
            anchors.verticalCenter: rectangleTextInputTransferAmount.verticalCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 14
            anchors.left: rectangleTextInputTransferAmount.right
            font.family: "Arial"
            verticalAlignment: Text.AlignBottom
            anchors.leftMargin: 10
            font.bold: true
        }

        Text {
            id: textTransferAmountUSD
            color: "#858585"
            text: ""
            anchors.left: textTransferAmountUnit.right
            anchors.leftMargin: 25
            anchors.bottom: textTransferAmountUnit.bottom
            anchors.bottomMargin: 0
            font.family: "Arial"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignRight
            visible: false
        }

        Rectangle {
            id: rectangleTextInputTransferPaymentID
            color: "#555555"
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: textTransferPaymentIDDescr.bottom
            anchors.topMargin: 6
            anchors.left: textTransferPaymentIDDescr.left
            anchors.leftMargin: 0
            height: 25
            radius: 3

            TextInput {
                id: textInputTransferPaymentID
                anchors.fill: parent
                color: "#cfcfcf"
                text: qsTr("")
                rightPadding: 5
                leftPadding: 5
                padding: 2
                selectionColor: "#eeeeee"
                selectedTextColor: "#999999"
                selectByMouse: true
                clip: true
                font.family: "Arial"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
            }
        }   
    }

    Rectangle {
        id: rectangleConnectionInfo
        color: "#00000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 20

        Text {
            id: textConnectionInfoPeersDescr
            color: "#cccccc"
            text: qsTr("connected peers")
            font.pixelSize: 13
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Text {
            id: textConnectionInfoPeers
            color: "#ffffff"
            text: qsTr("0")
            font.bold: true
            font.pixelSize: 13
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            anchors.right: textConnectionInfoPeersDescr.left
            anchors.rightMargin: 5
        }

        Text {
            id: textConnectionInfoBlocksDescr
            color: "#cccccc"
            text: qsTr("synced blocks")
            font.pixelSize: 13
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            anchors.right: textConnectionInfoPeers.left
            anchors.rightMargin: 15
        }

        Text {
            id: textConnectionInfoBlocks
            color: "#ffffff"
            text: qsTr("0/0")
            font.bold: true
            font.pixelSize: 13
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            anchors.right: textConnectionInfoBlocksDescr.left
            anchors.rightMargin: 5
        }

        Text {
            id: textConnectionInfoSync
            color: "#ffffff"
            text: qsTr("Blockchain syncing...")
            font.bold: true
            font.pixelSize: 13
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            anchors.right: textConnectionInfoBlocks.left
            anchors.rightMargin: 20
        }
    }

    Rectangle {
        id: popupText

        color: "#4d4d4d"
        border.color: "#ffffff"; border.width: 1
        radius: 4
        y: parent.height // starts off "screen"
        anchors.horizontalCenter: parent.horizontalCenter
        width: labelPopupText.width + 20
        height: labelPopupText.height + 40
        opacity: 0

        function show(msg) {
            labelPopupText.text = msg
            popupText.state = "visible"
            timerPopupText.start()
        }

        states: State {
            name: "visible"
            PropertyChanges { target: popupText; opacity: 1 }
            PropertyChanges { target: popupText; y: (parent.height-popupText.height)/2 }
        }

        transitions: [
            Transition { from: ""; PropertyAnimation { properties: "opacity,y"; duration: 65 } },
            Transition { from: "visible"; PropertyAnimation { properties: "opacity,y"; duration: 500 } }
        ]

        Timer {
            id: timerPopupText
            interval: 1000
            onTriggered: popupText.state = ""
        }

        Text {
            id: labelPopupText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 15
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            smooth: true
        }

        Connections{
            target: QmlBridge
            onDisplayPopup: {
                timerPopupText.interval = time
                popupText.show(text)
            }
        }
    }

    Dialog {
        id: dialogPrivateKeys
        title: "Private Keys"
        standardButtons: StandardButton.Ok
        width: 900

        Text {
            id: textDescriptionPrivateKeys
            text: "See below your public address and your 2 private (secret) keys. The 2 private keys can be used to re-generate your wallet.\nCopy them both and keep them in a safe place.\nIf you lose them and lose your password or wallet file, you will not be able to recover your TRTLs.\nIf anybody has access to those keys, he can steal your TRTLs."
            font.family: "Arial"
        }

        Text {
            id: textDescriptionWalletFilename
            text: "Wallet file:"
            anchors.top: textDescriptionPrivateKeys.bottom
            anchors.topMargin: 25
            anchors.left: textDescriptionPrivateKeys.left
            anchors.leftMargin: 0
            font.family: "Arial"
        }

        Text {
            id: textWalletFilename
            text: ""
            anchors.bottom: textDescriptionWalletFilename.bottom
            anchors.bottomMargin: 0
            anchors.left: textDescriptionWalletFilename.right
            anchors.leftMargin: 20
            font.family: "Arial"

        }

        Text {
            id: textDescriptionAddress
            text: "Address"
            anchors.top: textDescriptionWalletFilename.bottom
            anchors.topMargin: 25
            anchors.left: textDescriptionWalletFilename.left
            anchors.leftMargin: 0
            font.family: "Arial"
        }

        TextInput {
            id: textInputAddress
            anchors.top: textDescriptionAddress.bottom
            anchors.topMargin: 10
            anchors.left: textDescriptionAddress.left
            anchors.leftMargin: 0
            readOnly: true
            text: ""
            leftPadding: 5
            padding: 2
            selectionColor: "#333333"
            selectedTextColor: "white"
            selectByMouse: true
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: textDescriptionPrivateViewKey
            text: "Private View Key"
            anchors.top: textInputAddress.bottom
            anchors.topMargin: 25
            anchors.left: textInputAddress.left
            anchors.leftMargin: 0
            font.family: "Arial"
        }

        TextInput {
            id: textInputPrivateViewKey
            anchors.top: textDescriptionPrivateViewKey.bottom
            anchors.topMargin: 10
            anchors.left: textDescriptionPrivateViewKey.left
            anchors.leftMargin: 0
            readOnly: true
            text: ""
            leftPadding: 5
            padding: 2
            selectionColor: "#333333"
            selectedTextColor: "white"
            selectByMouse: true
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: textDescriptionPrivateSpendKey
            text: "Private Spend Key"
            anchors.top: textInputPrivateViewKey.bottom
            anchors.topMargin: 25
            anchors.left: textInputPrivateViewKey.left
            anchors.leftMargin: 0
            font.family: "Arial"
        }

        TextInput {
            id: textInputPrivateSpendKey
            anchors.top: textDescriptionPrivateSpendKey.bottom
            anchors.topMargin: 10
            anchors.left: textDescriptionPrivateSpendKey.left
            anchors.leftMargin: 0
            readOnly: true
            text: ""
            leftPadding: 5
            padding: 2
            selectionColor: "#333333"
            selectedTextColor: "white"
            selectByMouse: true
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: buttonCopyKeys
            text: qsTr("Copy to clipboard")
            anchors.bottom: textInputPrivateSpendKey.bottom
            anchors.bottomMargin: 40
            anchors.left: textInputPrivateSpendKey.right
            anchors.leftMargin: 80
            height: 30

            contentItem: Text {
                text: buttonCopyKeys.text
                font.pixelSize: 15
                font.family: "Arial"
                font.bold: true
                opacity: enabled ? 1.0 : 0.3
                color: buttonCopyKeys.down ? "#dddddd" : "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 140
                height: 30
                opacity: enabled ? 1 : 0.3
                radius: 6
                color: buttonCopyKeys.down ? "#383838" : "#444444"
            }

            onClicked: {
                QmlBridge.clickedButtonCopyKeys();
            }
        }

        function show(filename, privateViewKey, privateSpendKey, walletAddress) {
            textWalletFilename.text = filename
            textInputPrivateViewKey.text = privateViewKey
            textInputPrivateSpendKey.text = privateSpendKey
            textInputAddress.text = walletAddress
            dialogPrivateKeys.open()
        }
    }

    Connections {
        target: QmlBridge

        onDisplayPrivateKeys: {
            dialogPrivateKeys.show(filename, privateViewKey, privateSpendKey, walletAddress);            
        }

        onDisplaySyncingInfo: {
            textConnectionInfoSync.text = syncing
            textConnectionInfoBlocks.text = blocks
            textConnectionInfoPeers.text = peers
        }

        onDisplayTotalBalance: {
            textBalanceValue.text = balance
            textBalanceUSD.text = balanceUSD
        }

        onDisplayAddress: {
            textAddress.text = address
            textWalletName.text = wallet
            textUSD.visible = displayFiatConversion
            textBalanceUSD.visible = displayFiatConversion
            textTransferAmountUSD.visible = displayFiatConversion
        }
    }

    function clearData() {
        textInputTransferAddress.text = "";
        textInputTransferAmount.text = "";
        textInputTransferPaymentID.text = "";
    }

    function showDialogWarningCloseWallet() {
        dialogWarningCloseWallet.show()
    }

    function show() {
        walletScreen.visible = true
        walletScreen.state = "visible"
    }

    function hide() {
        walletScreen.state = ""
    }

    states: State {
        name: "visible"
        PropertyChanges { target: walletScreen; x: 0 }
    }

    transitions: [
        Transition {
            from: ""
            PropertyAnimation {
                properties: "x"
                duration: 200
            }
        },
        Transition {
            from: "visible"
            PropertyAnimation {
                properties: "x"
                duration: 200
            }
            onRunningChanged: {
                if ((state == "") && (!running))
                    walletScreen.visible = false;
            }
        }
    ]
}