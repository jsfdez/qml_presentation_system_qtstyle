#include "NativeInterface.h"

#include <QtCore/qbytearray.h>
#include <QtCore/qdebug.h>
#include <QtCore/qstring.h>
#include <QtWidgets/qapplication.h>
#include <QtWidgets/qfiledialog.h>

namespace Private
{
    QString fileContent;
}

NativeInterface::NativeInterface(QObject *parent) : QObject(parent)
{
    qInfo("Presentation defined");
}

QString NativeInterface::fileContent() const
{
    return Private::fileContent;
}

void NativeInterface::showAboutQt()
{
    qApp->aboutQt();
}

void NativeInterface::openFile()
{
    QFileDialog::getOpenFileContent("*.txt",
                                    [&](const QString &fileName, const QByteArray &content)
    {
        Q_UNUSED(fileName);
        Private::fileContent = QString::fromUtf8(content);
        emit fileContentChanged();
    });
}
