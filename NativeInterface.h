#pragma once

#include <QtCore/qobject.h>
#include <QtCore/qurl.h>

class NativeInterface : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString title MEMBER title CONSTANT)
    Q_PROPERTY(QUrl url MEMBER url CONSTANT)
    Q_PROPERTY(QString qtVersion MEMBER qtVersion CONSTANT)
    Q_PROPERTY(QString fileContent READ fileContent NOTIFY fileContentChanged)

public:
    explicit NativeInterface(QObject *parent = nullptr);

    QString fileContent() const;

public slots:
    void showAboutQt();
    void openFile();

signals:
    void fileContentChanged();

private:
    const QString title { PRESENTATION_TITLE };
    const QUrl url { PRESENTATION_URL };
    const QString qtVersion { QT_VERSION_STR };
};

