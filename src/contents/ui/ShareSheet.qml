// SPDX-FileCopyrightText: 2019 Nicolas Fella <nicolas.fella@gmx.de>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick.Controls as Controls
import QtQuick.Layouts
import QtQuick
import QtQuick.Window

import org.kde.kirigami as Kirigami
import org.kde.purpose as Purpose

Kirigami.Dialog {
    id: inputSheet
    property url url
    property string inputTitle

    title: i18n("Share page to")
    preferredWidth: Kirigami.Units.gridUnit * 16
    standardButtons: Kirigami.Dialog.NoButton

    Purpose.AlternativesView {
        id: view
        pluginType: "ShareUrl"
        clip: true

        delegate: Kirigami.BasicListItem {
            id: shareDelegate

            required property string display
            required property int index

            label: shareDelegate.display
            onClicked: view.createJob (shareDelegate.index)
            Keys.onReturnPressed: view.createJob (shareDelegate.index)
            Keys.onEnterPressed: view.createJob (shareDelegate.index)
            
            trailing: Kirigami.Icon {
                implicitWidth: Kirigami.Units.iconSizes.small
                implicitHeight: Kirigami.Units.iconSizes.small
                source: "arrow-right"
            }
        }

        onFinished: close()
    }

    onVisibleChanged: {
        view.inputData = {
            "urls": [inputSheet.url.toString()],
            "title": inputSheet.inputTitle
        }
    }
}

