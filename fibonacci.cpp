#include <QtCore>
#include <QtWidgets>

auto nextNumberGenerator() -> QGenerator<decltype(0u)>
{
    auto fn_minus1 = 0u, fn = 1u;
    co_yield fn_minus1;
    co_yield fn;
    forever {
        co_yield fn_minus1 + fn;
        auto next = fn_minus1 + fn;
        fn_minus1 = fn;
        fn = next;
    }
}

int main(int argc, char **argv)
{
    QApplication app(argc, argv);
    QWidget container;
    container.setLayout(new QVBoxLayout);
    auto label = new QLabel;
    label->setFont(QFont(qApp->font().family(), 100));
    auto nextButton = new QPushButton("NEXT!");

    auto write = [number = nextNumberGenerator(), label]() mutable {
        number.next();
        label->setText(QString::fromLatin1("Current: %1").arg(*number));
    };
    write();
    QObject::connect(nextButton, &QPushButton::clicked, [&write] { write(); });

    container.layout()->addWidget(label);
    container.layout()->addWidget(nextButton);
    container.show();
    return app.exec();
}
