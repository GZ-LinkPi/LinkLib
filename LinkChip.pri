DEFINES += $$chip
isEmpty(HOME){
    HOME=/home/zc
}

contains(DEFINES,HI3559A){
message("CHIP:HI3559A")
isEmpty(CROSS){
    CROSS=$$HOME/cross/mix100
}
isEmpty(MPP){
    MPP=$$HOME/3559A/SDK/Hi3559AV100_SDK_V2.0.0.7/mpp/out/linux/multi-core
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
DEFINES += ISP_V2
QMAKE_RPATHDIR += $$MPP/lib
LIBS += -lpthread -lm -ldl -lstdc++ \
        -L$$MPP/lib  $$MPP/lib/libmpi.a $$MPP/lib/libhdmi.a \
        $$MPP/lib/libdpu_rect.a  $$MPP/lib/libdpu_match.a $$MPP/lib/libhiavslut.a $$MPP/lib/libpos_query.a \
        $$MPP/lib/libisp.a  $$MPP/lib/lib_hidehaze.a $$MPP/lib/lib_hidrc.a \
        $$MPP/lib/lib_hildci.a  $$MPP/lib/lib_hiae.a $$MPP/lib/lib_hiawb.a  \
        $$MPP/lib/libVoiceEngine.a $$MPP/lib/libdnvqe.a  $$MPP/lib/libupvqe.a  $$MPP/lib/libaacenc.a $$MPP/lib/libaacdec.a \
        -lhive_common  -lhive_HPF  -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC -lsecurec

}
}

contains(DEFINES,HI3531A){
message("CHIP:HI3531A")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v300
}
isEmpty(MPP){
    MPP=$$HOME/3531A/SDK/Hi3531A_SDK_V1.0.4.0/mpp
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS +=  $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a $$MPP/lib/libhdmi.a $$MPP/lib/libive.a $$MPP/lib/libjpeg6b.a \
        $$MPP/lib/libmd.a $$MPP/lib/libpciv.a $$MPP/lib/libtde.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3521A){
message("CHIP:HI3521A")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v300
}
isEmpty(MPP){
    MPP=$$HOME/3521A/SDK/Hi3521A_SDK_V1.0.5.0/mpp
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS += $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a $$MPP/lib/libhdmi.a $$MPP/lib/libive.a $$MPP/lib/libjpeg6b.a \
        $$MPP/lib/libmd.a $$MPP/lib/libtde.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3531D){
message("CHIP:HI3531D")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v500
}
isEmpty(MPP){
    MPP=$$HOME/3531D/SDK/Hi3531D_SDK_V1.0.3.0/mpp
}
QT += script
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS += $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a $$MPP/lib/libhdmi.a $$MPP/lib/libive.a $$MPP/lib/libjpeg6b.a \
        $$MPP/lib/libmd.a $$MPP/lib/libpciv.a $$MPP/lib/libtde.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3516C){
message("CHIP:HI3516C")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v500/3516C
}
isEmpty(MPP){
    MPP=$$HOME/3516C/SDK/Hi3516CV300_SDK_V1.0.3.0/mpp
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS +=  $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a  $$MPP/lib/libive.a  \
        $$MPP/lib/libmd.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3516A){
message("CHIP:HI3516A")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v300/3516A
}
isEmpty(MPP){
    MPP=$$HOME/3516A/SDK/Hi3516A_SDK_V1.0.7.0/mpp
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS += $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a  $$MPP/lib/libive.a  \
         $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3519){
message("CHIP:HI3519")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v500
}
isEmpty(MPP){
    MPP=$$HOME/3519/SDK/Hi3519V101_SDK_V1.0.5.0/mpp_big-little
}
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS += $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a $$MPP/lib/libive.a \
        $$MPP/lib/libmd.a $$MPP/lib/libpciv.a $$MPP/lib/libtde.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}

contains(DEFINES,HI3536C){
message("CHIP:HI3536C")
isEmpty(CROSS){
    CROSS=$$HOME/cross/v500
}
isEmpty(MPP){
    MPP=$$HOME/3536C/SDK/Hi3536C_SDK_V1.0.2.0/mpp
}
QT += script
INCLUDEPATH += $$MPP/include
INCLUDEPATH += $$CROSS/ffmpeg/include
if(!contains(DEFINES,LINK_LIBRARY)){
LIBS += $$MPP/lib/libmpi.a $$MPP/lib/libdnvqe.a $$MPP/lib/libhdmi.a $$MPP/lib/libive.a $$MPP/lib/libjpeg6b.a \
        $$MPP/lib/libmd.a  $$MPP/lib/libtde.a $$MPP/lib/libupvqe.a $$MPP/lib/libVoiceEngine.a \
        -L$$MPP/lib -lhive_common -lhive_RNR -lhive_HPF -lhive_GAIN -lhive_EQ -lhive_ANR -lhive_AGC -lhive_AEC \
        -lpthread -lm -ldl
}
}
