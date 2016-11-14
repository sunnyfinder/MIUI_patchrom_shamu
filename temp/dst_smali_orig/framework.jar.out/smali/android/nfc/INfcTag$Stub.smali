.class public abstract Landroid/nfc/INfcTag$Stub;
.super Landroid/os/Binder;
.source "INfcTag.java"

# interfaces
.implements Landroid/nfc/INfcTag;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/nfc/INfcTag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/nfc/INfcTag$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.nfc.INfcTag"

.field static final TRANSACTION_canMakeReadOnly:I = 0x11

.field static final TRANSACTION_close:I = 0x1

.field static final TRANSACTION_connect:I = 0x2

.field static final TRANSACTION_formatNdef:I = 0xc

.field static final TRANSACTION_getExtendedLengthApdusSupported:I = 0x13

.field static final TRANSACTION_getMaxTransceiveLength:I = 0x12

.field static final TRANSACTION_getTechList:I = 0x4

.field static final TRANSACTION_getTimeout:I = 0xf

.field static final TRANSACTION_isNdef:I = 0x5

.field static final TRANSACTION_isPresent:I = 0x6

.field static final TRANSACTION_ndefIsWritable:I = 0xb

.field static final TRANSACTION_ndefMakeReadOnly:I = 0xa

.field static final TRANSACTION_ndefRead:I = 0x8

.field static final TRANSACTION_ndefWrite:I = 0x9

.field static final TRANSACTION_reconnect:I = 0x3

.field static final TRANSACTION_rediscover:I = 0xd

.field static final TRANSACTION_resetTimeouts:I = 0x10

.field static final TRANSACTION_setTimeout:I = 0xe

.field static final TRANSACTION_transceive:I = 0x7


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "android.nfc.INfcTag"

    invoke-virtual {p0, p0, v0}, Landroid/nfc/INfcTag$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/nfc/INfcTag;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    const-string v1, "android.nfc.INfcTag"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/nfc/INfcTag;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/nfc/INfcTag;

    .end local v0    # "iin":Landroid/os/IInterface;
    return-object v0

    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    new-instance v1, Landroid/nfc/INfcTag$Stub$Proxy;

    invoke-direct {v1, p0}, Landroid/nfc/INfcTag$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 12
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    sparse-switch p1, :sswitch_data_0

    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v11

    return v11

    :sswitch_0
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v11, 0x1

    return v11

    :sswitch_1
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .local v0, "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->close(I)I

    move-result v5

    .local v5, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v5    # "_result":I
    :sswitch_2
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .local v1, "_arg1":I
    invoke-virtual {p0, v0, v1}, Landroid/nfc/INfcTag$Stub;->connect(II)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    .end local v5    # "_result":I
    :sswitch_3
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->reconnect(I)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v5    # "_result":I
    :sswitch_4
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->getTechList(I)[I

    move-result-object v10

    .local v10, "_result":[I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v10}, Landroid/os/Parcel;->writeIntArray([I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v10    # "_result":[I
    :sswitch_5
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->isNdef(I)Z

    move-result v9

    .local v9, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_0

    const/4 v11, 0x1

    :goto_0
    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    :cond_0
    const/4 v11, 0x0

    goto :goto_0

    .end local v0    # "_arg0":I
    .end local v9    # "_result":Z
    :sswitch_6
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->isPresent(I)Z

    move-result v9

    .restart local v9    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_1

    const/4 v11, 0x1

    :goto_1
    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    :cond_1
    const/4 v11, 0x0

    goto :goto_1

    .end local v0    # "_arg0":I
    .end local v9    # "_result":Z
    :sswitch_7
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v3

    .local v3, "_arg1":[B
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_2

    const/4 v4, 0x1

    .local v4, "_arg2":Z
    :goto_2
    invoke-virtual {p0, v0, v3, v4}, Landroid/nfc/INfcTag$Stub;->transceive(I[BZ)Landroid/nfc/TransceiveResult;

    move-result-object v8

    .local v8, "_result":Landroid/nfc/TransceiveResult;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v8, :cond_3

    const/4 v11, 0x1

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    invoke-virtual {v8, p3, v11}, Landroid/nfc/TransceiveResult;->writeToParcel(Landroid/os/Parcel;I)V

    :goto_3
    const/4 v11, 0x1

    return v11

    .end local v4    # "_arg2":Z
    .end local v8    # "_result":Landroid/nfc/TransceiveResult;
    :cond_2
    const/4 v4, 0x0

    .restart local v4    # "_arg2":Z
    goto :goto_2

    .restart local v8    # "_result":Landroid/nfc/TransceiveResult;
    :cond_3
    const/4 v11, 0x0

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_3

    .end local v0    # "_arg0":I
    .end local v3    # "_arg1":[B
    .end local v4    # "_arg2":Z
    .end local v8    # "_result":Landroid/nfc/TransceiveResult;
    :sswitch_8
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->ndefRead(I)Landroid/nfc/NdefMessage;

    move-result-object v6

    .local v6, "_result":Landroid/nfc/NdefMessage;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v6, :cond_4

    const/4 v11, 0x1

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    invoke-virtual {v6, p3, v11}, Landroid/nfc/NdefMessage;->writeToParcel(Landroid/os/Parcel;I)V

    :goto_4
    const/4 v11, 0x1

    return v11

    :cond_4
    const/4 v11, 0x0

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_4

    .end local v0    # "_arg0":I
    .end local v6    # "_result":Landroid/nfc/NdefMessage;
    :sswitch_9
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_5

    sget-object v11, Landroid/nfc/NdefMessage;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v11, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/nfc/NdefMessage;

    :goto_5
    invoke-virtual {p0, v0, v2}, Landroid/nfc/INfcTag$Stub;->ndefWrite(ILandroid/nfc/NdefMessage;)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v5    # "_result":I
    :cond_5
    const/4 v2, 0x0

    .local v2, "_arg1":Landroid/nfc/NdefMessage;
    goto :goto_5

    .end local v0    # "_arg0":I
    .end local v2    # "_arg1":Landroid/nfc/NdefMessage;
    :sswitch_a
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->ndefMakeReadOnly(I)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v5    # "_result":I
    :sswitch_b
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->ndefIsWritable(I)Z

    move-result v9

    .restart local v9    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_6

    const/4 v11, 0x1

    :goto_6
    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    :cond_6
    const/4 v11, 0x0

    goto :goto_6

    .end local v0    # "_arg0":I
    .end local v9    # "_result":Z
    :sswitch_c
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v3

    .restart local v3    # "_arg1":[B
    invoke-virtual {p0, v0, v3}, Landroid/nfc/INfcTag$Stub;->formatNdef(I[B)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v3    # "_arg1":[B
    .end local v5    # "_result":I
    :sswitch_d
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->rediscover(I)Landroid/nfc/Tag;

    move-result-object v7

    .local v7, "_result":Landroid/nfc/Tag;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v7, :cond_7

    const/4 v11, 0x1

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    invoke-virtual {v7, p3, v11}, Landroid/nfc/Tag;->writeToParcel(Landroid/os/Parcel;I)V

    :goto_7
    const/4 v11, 0x1

    return v11

    :cond_7
    const/4 v11, 0x0

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_7

    .end local v0    # "_arg0":I
    .end local v7    # "_result":Landroid/nfc/Tag;
    :sswitch_e
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .restart local v1    # "_arg1":I
    invoke-virtual {p0, v0, v1}, Landroid/nfc/INfcTag$Stub;->setTimeout(II)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    .end local v5    # "_result":I
    :sswitch_f
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->getTimeout(I)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v5    # "_result":I
    :sswitch_10
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/nfc/INfcTag$Stub;->resetTimeouts()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    :sswitch_11
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->canMakeReadOnly(I)Z

    move-result v9

    .restart local v9    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_8

    const/4 v11, 0x1

    :goto_8
    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    :cond_8
    const/4 v11, 0x0

    goto :goto_8

    .end local v0    # "_arg0":I
    .end local v9    # "_result":Z
    :sswitch_12
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/nfc/INfcTag$Stub;->getMaxTransceiveLength(I)I

    move-result v5

    .restart local v5    # "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    .end local v0    # "_arg0":I
    .end local v5    # "_result":I
    :sswitch_13
    const-string v11, "android.nfc.INfcTag"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/nfc/INfcTag$Stub;->getExtendedLengthApdusSupported()Z

    move-result v9

    .restart local v9    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_9

    const/4 v11, 0x1

    :goto_9
    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v11, 0x1

    return v11

    :cond_9
    const/4 v11, 0x0

    goto :goto_9

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_d
        0xe -> :sswitch_e
        0xf -> :sswitch_f
        0x10 -> :sswitch_10
        0x11 -> :sswitch_11
        0x12 -> :sswitch_12
        0x13 -> :sswitch_13
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
