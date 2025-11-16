//SPDX-FileCopyrightText: 2021 Felipe Kinoshita <kinofhek@gmail.com>
//SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.labs.mobileform as MobileForm

import org.kde.angelfish

Kirigami.ScrollablePage {
    id: root
    title: i18n("Toolbars")
    ColumnLayout {
        spacing: 0

        MobileForm.FormCard {
            Layout.fillWidth: true

            contentItem: ColumnLayout {
                spacing: 0
                MobileForm.FormCardHeader{
                    title:root.title
                }
                MobileForm.FormSwitchDelegate {
                    id: showHome
                    text: i18n("Show home button:")
                    description: i18n("The home button will be shown next to the reload button in the toolbar.")
                    checked: Settings.showHomeButton
                    onClicked: Settings.showHomeButton = checked
                }
                MobileForm.FormDelegateSeparator { above: homepage; visible: homepage.visible }


                MobileForm.FormTextFieldDelegate {
                    id: homepage
                    visible: Settings.showHomeButton
                    label: i18n("Homepage:")
                    text: Settings.homepage
                    onAccepted: {
                        let url = text;
                        if (url.indexOf(":/") < 0) {
                            url = "http://" + url;
                        }
                        Settings.homepage = url;
                    }
                    onEditingFinished: {
                        let url = text;
                        if (url.indexOf(":/") < 0) {
                            url = "http://" + url;
                        }
                        Settings.homepage = url;
                    }

                }
                MobileForm.FormDelegateSeparator { above: newTab }

                MobileForm.FormTextFieldDelegate {
                    id: newTab
                    label: i18n("New tabs:")
                    text: Settings.newTabUrl
                    onAccepted: {
                        let url = text;
                        if (url.indexOf(":/") < 0) {
                            url = "http://" + url;
                        }
                        Settings.newTabUrl = url;
                    }
                    onEditingFinished: {
                        let url = text;
                        if (url.indexOf(":/") < 0) {
                            url = "http://" + url;
                        }
                        Settings.newTabUrl = url;
                    }

                }
                MobileForm.FormDelegateSeparator { above: alwaysShowTabs }

                MobileForm.FormSwitchDelegate {
                    id: alwaysShowTabs
                    text: i18n("Always show the tab bar")
                    description: i18n("The tab bar will be displayed even if there is only one tab open")
                    checked: Settings.showTabBar
                    onClicked: Settings.showTabBar = checked
                }
            }
        }
    }
}
