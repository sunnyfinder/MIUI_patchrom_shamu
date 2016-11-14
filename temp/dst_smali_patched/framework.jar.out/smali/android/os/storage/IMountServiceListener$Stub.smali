.class public abstract Landroid/os/storage/IMountServiceListener$Stub;
.super Landroid/os/Binder;
.source "IMountServiceListener.java"

# interfaces
.implements Landroid/os/storage/IMountServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/storage/IMountServiceListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/storage/IMountServiceListener$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "IMountServiceListener"

.field static final TRANSACTION_onDiskDestroyed:I = 0x7

.field static final TRANSACTION_onDiskScanned:I = 0x6

.field static final TRANSACTION_onStorageStateChanged:I = 0x2

.field static final TRANSACTION_onUsbMassStorageConnectionChanged:I = 0x1

.field static final TRANSACTION_onVolumeForgotten:I = 0x5

.field static final TRANSACTION_onVolumeRecordChanged:I = 0x4

.field static final TRANSACTION_onVolumeStateChanged:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "IMountServiceListener"

    invoke-virtual {p0, p0, v0}, Landroid/os/storage/IMountServiceListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountServiceListener;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    const-string v1, "IMountServiceListener"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/os/storage/IMountServiceListener;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/os/storage/IMountServiceListener;

    .end local v0    # "iin":Landroid/os/IInterface;
    return-object v0

    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    new-instance v1, Landroid/os/storage/IMountServiceListener$Stub$Proxy;

    invoke-direct {v1, p0}, Landroid/os/storage/IMountServiceListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    const-string v11, "IMountServiceListener"

    invoke-virtual {p3, v11}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v11, 0x1

    return v11

    :sswitch_1
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_0

    const/4 v0, 0x1

    .local v0, "connected":Z
    :goto_0
    invoke-virtual {p0, v0}, Landroid/os/storage/IMountServiceListener$Stub;->onUsbMassStorageConnectionChanged(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v0    # "connected":Z
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "connected":Z
    goto :goto_0

    .end local v0    # "connected":Z
    :sswitch_2
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    .local v7, "path":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    .local v6, "oldState":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .local v4, "newState":Ljava/lang/String;
    invoke-virtual {p0, v7, v6, v4}, Landroid/os/storage/IMountServiceListener$Stub;->onStorageStateChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v4    # "newState":Ljava/lang/String;
    .end local v6    # "oldState":Ljava/lang/String;
    .end local v7    # "path":Ljava/lang/String;
    :sswitch_3
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    const/4 v11, 0x0

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Landroid/os/storage/VolumeInfo;

    .local v9, "vol":Landroid/os/storage/VolumeInfo;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .local v5, "oldState":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .local v3, "newState":I
    invoke-virtual {p0, v9, v5, v3}, Landroid/os/storage/IMountServiceListener$Stub;->onVolumeStateChanged(Landroid/os/storage/VolumeInfo;II)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v3    # "newState":I
    .end local v5    # "oldState":I
    .end local v9    # "vol":Landroid/os/storage/VolumeInfo;
    :sswitch_4
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    const/4 v11, 0x0

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/os/storage/VolumeRecord;

    .local v8, "rec":Landroid/os/storage/VolumeRecord;
    invoke-virtual {p0, v8}, Landroid/os/storage/IMountServiceListener$Stub;->onVolumeRecordChanged(Landroid/os/storage/VolumeRecord;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v8    # "rec":Landroid/os/storage/VolumeRecord;
    :sswitch_5
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .local v2, "fsUuid":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/os/storage/IMountServiceListener$Stub;->onVolumeForgotten(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v2    # "fsUuid":Ljava/lang/String;
    :sswitch_6
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    const/4 v11, 0x0

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/storage/DiskInfo;

    .local v1, "disk":Landroid/os/storage/DiskInfo;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v10

    .local v10, "volumeCount":I
    invoke-virtual {p0, v1, v10}, Landroid/os/storage/IMountServiceListener$Stub;->onDiskScanned(Landroid/os/storage/DiskInfo;I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    .end local v1    # "disk":Landroid/os/storage/DiskInfo;
    .end local v10    # "volumeCount":I
    :sswitch_7
    const-string v11, "IMountServiceListener"

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    const/4 v11, 0x0

    invoke-virtual {p2, v11}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/storage/DiskInfo;

    .restart local v1    # "disk":Landroid/os/storage/DiskInfo;
    invoke-virtual {p0, v1}, Landroid/os/storage/IMountServiceListener$Stub;->onDiskDestroyed(Landroid/os/storage/DiskInfo;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v11, 0x1

    return v11

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
