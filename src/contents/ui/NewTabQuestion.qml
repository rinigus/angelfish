// SPDX-FileCopyrightText: 2020 Jonah Brüchert <jbb@kaidan.im>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import org.kde.kirigami as Kirigami


Kirigami.InlineMessage {
    id: newTabQuestion
    type: Kirigami.MessageType.Warning
    text: url ? i18n("Site wants to open a new tab: \n%1", url.toString()) : ""
    showCloseButton: true

    property url url

    actions: [
        Kirigami.Action {
            icon.name: "tab-new"
            text: i18n("Open")
            onTriggered: {
                tabs.tabsModel.newTab(newTabQuestion.url.toString())
                newTabQuestion.visible = false
            }
        }

    ]
}
