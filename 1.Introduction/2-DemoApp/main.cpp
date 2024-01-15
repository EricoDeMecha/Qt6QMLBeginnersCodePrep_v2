// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DemoApp", "Main");/**
                                                - naming convention matter(https://doc.qt.io/qt-6/qtqml-documents-definetypes.html)
                                                - Expect a typeName starting with Capital letter i.e Main.qml not main.qml
                                             **/

    return app.exec();
}
