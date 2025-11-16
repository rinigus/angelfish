//SPDX-FileCopyrightText: 2021 Felipe Kinoshita <kinofhek@gmail.com>
//SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.CategorizedSettings {
    actions: [
        Kirigami.SettingAction {
            text: i18n("General")
            icon.name: "org.kde.angelfish"
            page: Qt.resolvedUrl("SettingsGeneral.qml")
        },
        Kirigami.SettingAction {
            text: i18n("Ad Block")
            icon.name: "security-medium"
            page: Qt.resolvedUrl("SettingsAdblock.qml")
        },
        Kirigami.SettingAction {
            text: i18n("Web Apps")
            icon.name: "applications-all"
            page: Qt.resolvedUrl("SettingsWebApps.qml")
        },
        Kirigami.SettingAction {
            text: i18n("Search Engine")
            icon.name: "preferences-desktop-search"
            page: Qt.resolvedUrl("SettingsSearchEnginePage.qml")
        },
        Kirigami.SettingAction {
            text: i18n("Toolbars")
            icon.name: "home"
            page: Kirigami.Settings.isMobile ? Qt.resolvedUrl("SettingsNavigationBarPage.qml") : Qt.resolvedUrl("DesktopHomeSettingsPage.qml")
        }
    ]
}
