//SPDX-FileCopyrightText: 2021 Felipe Kinoshita <kinofhek@gmail.com>
//SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Window
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

import org.kde.angelfish

Kirigami.ScrollablePage {
    globalToolBarStyle: Kirigami.ApplicationHeaderStyle.None
    Kirigami.ColumnView.fillWidth: false

    header: QQC2.ToolBar {
        anchors.horizontalCenter: parent.horizontalCenter
        height: webBrowser.pageStack.globalToolBar.preferredHeight + 1 // to match tabs height
        width: parent.width

        RowLayout {
            anchors.fill: parent

            Kirigami.SearchField {
                id: search
                Layout.fillWidth: true

                placeholderText: i18n("Search history…")
                inputMethodHints: rootPage.privateMode ? Qt.ImhNoPredictiveText : Qt.ImhNone
                onAccepted: {
                    if (text === "" || text.length > 2) {
                        list.model.filter = displayText;
                    }
                }
                Keys.onEscapePressed: pageStack.pop()
                Component.onCompleted: search.forceActiveFocus()
            }
            QQC2.ToolButton {
                icon.name: "edit-clear-all"
                onClicked: BrowserManager.clearHistory()

                QQC2.ToolTip.visible: hovered
                QQC2.ToolTip.delay: Kirigami.Units.toolTipDelay
                QQC2.ToolTip.text: i18n("Clear all history")
            }
            QQC2.ToolButton {
                icon.name: "tab-close"
                onClicked: pageStack.pop()
            }
        }
    }

    ListView {
        id: list
        anchors.fill: parent

        currentIndex: -1

        model: BookmarksHistoryModel {
            history: true
            bookmarks: false
        }
        delegate: Kirigami.BasicListItem {
            label: model.title
            labelItem.textFormat: Text.PlainText
            subtitle: model.url
            icon: model && model.icon ? model.icon : "internet-services"
            iconSize: Kirigami.Units.largeSpacing * 3
            onClicked: currentWebView.url = model.url

            trailing: QQC2.ToolButton {
                icon.name: "entry-delete"
                onClicked: BrowserManager.removeFromHistory(model.url)
            }
        }
        Kirigami.PlaceholderMessage {
            visible: list.count === 0
            anchors.centerIn: parent

            text: i18n("Not history yet")
        }
    }
}
