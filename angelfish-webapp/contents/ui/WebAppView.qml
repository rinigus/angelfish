// SPDX-FileCopyrightText: 2014-2015 Sebastian Kügler <sebas@kde.org>
//
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts

import org.kde.kirigami 2.19 as Kirigami

import org.kde.angelfish 1.0

WebView {
    id: webEngineView

    profile: AngelfishWebProfile {
        httpUserAgent: userAgent.userAgent
        questionLoader: questionLoader
        offTheRecord: false
        storageName: "angelfish-webapp"
    }

    isAppView: true

    onNewViewRequested: {
        if (UrlUtils.urlHost(request.requestedUrl) === UrlUtils.urlHost( BrowserManager.initialUrl)) {
            url = request.requestedUrl;
        } else {
            Qt.openUrlExternally(request.requestedUrl);
        }
    }
}
