// SPDX-FileCopyrightText: 2020 Jonah Brüchert <jbb@kaidan.im>
//
// SPDX-License-Identifier: GPL-2.0-or-later

import org.kde.kirigami as Kirigami
import org.kde.angelfish

Kirigami.InlineMessage {
    id: question
    showCloseButton: true

    visible: AdblockUrlInterceptor.adblockSupported

    text: i18n("The ad blocker is missing its filter lists, do you want to download them now?")

    AdblockFilterListsModel {
        id: filterListsModel
        onRefreshFinished: question.visible = false
    }

    onVisibleChanged: if (!visible) {
        Settings.adblockFilterDownloadDismissed = true
    }

    actions: [
        Kirigami.Action {
            id: downloadAction
            iconName: "download"
            text: i18n("Download")

            onTriggered: {
                filterListsModel.refreshLists()
                downloadAction.enabled = false;
                downloadAction.text = i18n("Downloading...")
            }
        }
    ]
}
