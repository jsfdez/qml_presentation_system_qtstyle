#include <QtCore>
#include <QtWidgets>
#include "qcoroutine.h"

struct EventFilter : QObject {
    QRectF rect { 0, 0, 100, 100 };
    QBrush brush { "black" };
    bool pressing = false;

    bool eventFilter(QObject *o, QEvent *e)
    {
        auto widget = qobject_cast<QWidget *>(o);
        auto event = reinterpret_cast<QMouseEvent *>(e);
        Q_ASSERT(widget);
        if (e->type() == QEvent::Paint) {
            QPainter p(widget);
            p.setBrush(brush);
            p.drawRect(rect);
            return true;
        } else if (e->type() == QEvent::MouseButtonPress && rect.contains(event->localPos())) {
            pressing = true;
            brush.setColor("red");
            return true;
        } else if (e->type() == QEvent::MouseMove && pressing) {
            rect.moveTo(event->localPos() - QPointF(rect.width() / 2, rect.height() / 2));
            widget->update();
            return true;
        } else if (e->type() == QEvent::MouseButtonRelease && pressing) {
            pressing = false;
            brush.setColor("black");
            widget->update();
            return true;
        }
        return QObject::eventFilter(o, e);
    }
};

struct CoroEventFilter : QObject {
    QRectF rect { 0, 0, 100, 100 };
    QMouseEvent *event = nullptr;
    QBrush brush { "black" };
    QGenerator<bool> mouseHandler = [=]() -> QGenerator<bool> {
        forever {
            auto update = false;
            if (rect.contains(event->localPos()) && event->type() == QEvent::MouseButtonPress) {
                brush.setColor("red");
                while(event->type() != QEvent::MouseButtonRelease) {
                    rect.moveTo(event->localPos() - QPointF(rect.width() / 2, rect.height() / 2));
                    co_yield true;
                }
                brush.setColor("black");
                update = true;
            }
            co_yield update;
        }
    }();

    bool eventFilter(QObject *o, QEvent *e)
    {
        auto widget = qobject_cast<QWidget *>(o);
        Q_ASSERT(widget);
        switch (e->type()) {
        case QEvent::Paint: {
            QPainter p(widget);
            p.setBrush(brush);
            p.drawRect(rect);
            return true;
        }
        case QEvent::MouseMove: case QEvent::MouseButtonPress: case QEvent::MouseButtonRelease:
            event = reinterpret_cast<QMouseEvent *>(e);
            if (mouseHandler.next() && *mouseHandler)
                widget->update();
            return true;
        default: return QObject::eventFilter(o, e);
        }
    }
};

int main (int argc, char **argv)
{
    QApplication app(argc, argv);
    QWidget widget;

    widget.setMouseTracking(true);
    widget.installEventFilter(new CoroEventFilter);

    widget.show();
    return app.exec();
}
