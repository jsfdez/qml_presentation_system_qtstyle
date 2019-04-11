#include <QtCore>
#include <QtNetwork>
#include <QtWidgets>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);
    auto label = new QLabel;
    label->setAttribute(Qt::WA_DeleteOnClose);
    const auto main = [label]() -> QTask<> {
        auto imageDownloader = []() -> QTask<QByteArray> {
            const QUrl url("https://upload.wikimedia.org/wikipedia/en/thumb/4/48/"
                           "Real_Sporting_de_Gijon.svg/220px-Real_Sporting_de_Gijon.svg.png");
            co_return co_await *QNetworkAccessManager().get(QNetworkRequest(url));
        }();
        label->setPixmap(QPixmap::fromImage(QImage::fromData(co_await imageDownloader)));
        label->setFixedSize(label->pixmap()->size());
        label->show();
    }();
    const auto wait = [label]() ->QTask<> {
        if (co_await QSignal(label, &QLabel::destroyed) == label) {
            qDebug("Oh, my God! They killed the window!");
            qApp->quit();
        }
    }();
    return app.exec();
}
