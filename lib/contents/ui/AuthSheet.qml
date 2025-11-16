// SPDX-FileCopyrightText: 2020 Jonah Brüchert <jbb@kaidan.im>
// SPDX-FileCopyrightText: 2022 Devin Lin <devin@kde.org>
//
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

import QtWebEngine

Kirigami.PromptDialog {
    id: root
    property AuthenticationDialogRequest request

    title: i18n("Authentication required")

    standardButtons: Kirigami.Dialog.Ok | Kirigami.Dialog.Cancel
    
    onAccepted: root.request.dialogAccept(usernameField.text, passwordField.text)
    onRejected: root.request.dialogReject()
    
    Kirigami.FormLayout {
        Layout.fillWidth: true

        Controls.TextField {
            id: usernameField

            Kirigami.FormData.label: i18n("Username")
            Layout.fillWidth: true
        }
        Controls.TextField {
            id: passwordField
            echoMode: TextInput.Password

            Kirigami.FormData.label: i18n("Password")
            Layout.fillWidth: true
        }
    }
}
