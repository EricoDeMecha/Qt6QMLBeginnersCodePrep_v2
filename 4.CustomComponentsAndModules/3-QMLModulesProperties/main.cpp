// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.addImportPath(":/");
    engine.loadFromModule("9-QMLModulesProperties", "Main");

    return app.exec();
}