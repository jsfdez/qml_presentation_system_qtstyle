TEMPLATE = app

TARGET = presentation

CONFIG += c++14

QT += \
    qml \
    quick \
    quickcontrols2 \
    widgets

BRANCH=$$system(git --git-dir=$${PWD}/.git rev-parse --abbrev-ref HEAD)
PRESENTATION_URL=https://github.com/jsfdez/qpresentation/tree/$${BRANCH}

PRESENTATION_TITLE="Qt\ for\ WebAssembly"

DEFINES += \
    PRESENTATION_URL=\\\"$${PRESENTATION_URL}\\\" \
    PRESENTATION_TITLE=\\\"$${PRESENTATION_TITLE}\\\" \


QML_IMPORT_PATH += $$PWD/imports

SOURCES += \
    NativeInterface.cpp \
    main.cpp

RESOURCES += \
    imports.qrc \
    resources.qrc

target.path = /tmp/presentation
INSTALLS += target

HEADERS += \
    NativeInterface.h
