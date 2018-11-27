LINK=$$PWD
INCLUDEPATH += $$LINK/include
LIBS+=-L$$LINK/$$chip/lib -lLinkBase -lLinkCodec -lLinkIO -lLinkStream -lLinkProcess

include($$PWD/LinkChip.pri)

QMAKE_RPATHDIR += $$CROSS/voaac/lib
LIBS+=  -L$$CROSS/ffmpeg/lib \
        -lavfilter -lpostproc -lavdevice -lavformat -lavcodec \
        -lavutil -lswscale -lswresample
if(!contains(DEFINES,HI3516C)){
    LIBS+=  $$CROSS/voaac/lib/libvo-aacenc.a
}

if(contains(DEFINES,HI3516C)){
    LIBS+=  $$CROSS/fdkaac/lib/libfdk-aac.a
}


#

if(!contains(DEFINES,HI3531A)){
if(!contains(DEFINES,HI3521A)){
if(!contains(DEFINES,HI3516A)){
    LIBS += -L$$CROSS/icu/lib -licuuc -licui18n -licudata
}
}
}
QT += network
