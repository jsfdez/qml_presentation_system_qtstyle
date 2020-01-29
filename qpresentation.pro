TEMPLATE = app

QT += \
    qml \
    quick \

DEFINES += \
    BRANCH=\\\"$$system(git rev-parse --abbrev-ref HEAD)\\\"

QML_IMPORT_PATH += $$PWD/imports

SOURCES += \
    main.cpp

RESOURCES += \
    imports.qrc \
    resources.qrc
