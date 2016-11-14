.class public abstract Landroid/bluetooth/IBluetoothManager$Stub;
.super Landroid/os/Binder;
.source "IBluetoothManager.java"

# interfaces
.implements Landroid/bluetooth/IBluetoothManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/bluetooth/IBluetoothManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/bluetooth/IBluetoothManager$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.bluetooth.IBluetoothManager"

.field static final TRANSACTION_bindBluetoothProfileService:I = 0xa

.field static final TRANSACTION_disable:I = 0x8

.field static final TRANSACTION_enable:I = 0x6

.field static final TRANSACTION_enableNoAutoConnect:I = 0x7

.field static final TRANSACTION_getAddress:I = 0xc

.field static final TRANSACTION_getBluetoothGatt:I = 0x9

.field static final TRANSACTION_getName:I = 0xd

.field static final TRANSACTION_isBleAppPresent:I = 0x10

.field static final TRANSACTION_isBleScanAlwaysAvailable:I = 0xe

.field static final TRANSACTION_isEnabled:I = 0x5

.field static final TRANSACTION_registerAdapter:I = 0x1

.field static final TRANSACTION_registerStateChangeCallback:I = 0x3

.field static final TRANSACTION_unbindBluetoothProfileService:I = 0xb

.field static final TRANSACTION_unregisterAdapter:I = 0x2

.field static final TRANSACTION_unregisterStateChangeCallback:I = 0x4

.field static final TRANSACTION_updateBleAppCount:I = 0xf


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "android.bluetooth.IBluetoothManager"

    invoke-virtual {p0, p0, v0}, Landroid/bluetooth/IBluetoothManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManager;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    const-string v1, "android.bluetooth.IBluetoothManager"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/bluetooth/IBluetoothManager;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/bluetooth/IBluetoothManager;

    .end local v0    # "iin":Landroid/os/IInterface;
    return-object v0

    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    new-instance v1, Landroid/bluetooth/IBluetoothManager$Stub$Proxy;

    invoke-direct {v1, p0}, Landroid/bluetooth/IBluetoothManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 14
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

    move-result v13

    return v13

    :sswitch_0
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v13, 0x1

    return v13

    :sswitch_1
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothManagerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManagerCallback;

    move-result-object v2

    .local v2, "_arg0":Landroid/bluetooth/IBluetoothManagerCallback;
    invoke-virtual {p0, v2}, Landroid/bluetooth/IBluetoothManager$Stub;->registerAdapter(Landroid/bluetooth/IBluetoothManagerCallback;)Landroid/bluetooth/IBluetooth;

    move-result-object v9

    .local v9, "_result":Landroid/bluetooth/IBluetooth;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/bluetooth/IBluetooth;->asBinder()Landroid/os/IBinder;

    move-result-object v13

    :goto_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    const/4 v13, 0x1

    return v13

    :cond_0
    const/4 v13, 0x0

    goto :goto_0

    .end local v2    # "_arg0":Landroid/bluetooth/IBluetoothManagerCallback;
    .end local v9    # "_result":Landroid/bluetooth/IBluetooth;
    :sswitch_2
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothManagerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManagerCallback;

    move-result-object v2

    .restart local v2    # "_arg0":Landroid/bluetooth/IBluetoothManagerCallback;
    invoke-virtual {p0, v2}, Landroid/bluetooth/IBluetoothManager$Stub;->unregisterAdapter(Landroid/bluetooth/IBluetoothManagerCallback;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v13, 0x1

    return v13

    .end local v2    # "_arg0":Landroid/bluetooth/IBluetoothManagerCallback;
    :sswitch_3
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothStateChangeCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothStateChangeCallback;

    move-result-object v3

    .local v3, "_arg0":Landroid/bluetooth/IBluetoothStateChangeCallback;
    invoke-virtual {p0, v3}, Landroid/bluetooth/IBluetoothManager$Stub;->registerStateChangeCallback(Landroid/bluetooth/IBluetoothStateChangeCallback;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v13, 0x1

    return v13

    .end local v3    # "_arg0":Landroid/bluetooth/IBluetoothStateChangeCallback;
    :sswitch_4
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothStateChangeCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothStateChangeCallback;

    move-result-object v3

    .restart local v3    # "_arg0":Landroid/bluetooth/IBluetoothStateChangeCallback;
    invoke-virtual {p0, v3}, Landroid/bluetooth/IBluetoothManager$Stub;->unregisterStateChangeCallback(Landroid/bluetooth/IBluetoothStateChangeCallback;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v13, 0x1

    return v13

    .end local v3    # "_arg0":Landroid/bluetooth/IBluetoothStateChangeCallback;
    :sswitch_5
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->isEnabled()Z

    move-result v12

    .local v12, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_1

    const/4 v13, 0x1

    :goto_1
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_1
    const/4 v13, 0x0

    goto :goto_1

    .end local v12    # "_result":Z
    :sswitch_6
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->enable()Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_2

    const/4 v13, 0x1

    :goto_2
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_2
    const/4 v13, 0x0

    goto :goto_2

    .end local v12    # "_result":Z
    :sswitch_7
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->enableNoAutoConnect()Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_3

    const/4 v13, 0x1

    :goto_3
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_3
    const/4 v13, 0x0

    goto :goto_3

    .end local v12    # "_result":Z
    :sswitch_8
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_4

    const/4 v5, 0x1

    .local v5, "_arg0":Z
    :goto_4
    invoke-virtual {p0, v5}, Landroid/bluetooth/IBluetoothManager$Stub;->disable(Z)Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_5

    const/4 v13, 0x1

    :goto_5
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    .end local v5    # "_arg0":Z
    .end local v12    # "_result":Z
    :cond_4
    const/4 v5, 0x0

    .restart local v5    # "_arg0":Z
    goto :goto_4

    .restart local v12    # "_result":Z
    :cond_5
    const/4 v13, 0x0

    goto :goto_5

    .end local v5    # "_arg0":Z
    .end local v12    # "_result":Z
    :sswitch_9
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->getBluetoothGatt()Landroid/bluetooth/IBluetoothGatt;

    move-result-object v10

    .local v10, "_result":Landroid/bluetooth/IBluetoothGatt;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v10, :cond_6

    invoke-interface {v10}, Landroid/bluetooth/IBluetoothGatt;->asBinder()Landroid/os/IBinder;

    move-result-object v13

    :goto_6
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    const/4 v13, 0x1

    return v13

    :cond_6
    const/4 v13, 0x0

    goto :goto_6

    .end local v10    # "_result":Landroid/bluetooth/IBluetoothGatt;
    :sswitch_a
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .local v1, "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothProfileServiceConnection$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothProfileServiceConnection;

    move-result-object v6

    .local v6, "_arg1":Landroid/bluetooth/IBluetoothProfileServiceConnection;
    invoke-virtual {p0, v1, v6}, Landroid/bluetooth/IBluetoothManager$Stub;->bindBluetoothProfileService(ILandroid/bluetooth/IBluetoothProfileServiceConnection;)Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_7

    const/4 v13, 0x1

    :goto_7
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_7
    const/4 v13, 0x0

    goto :goto_7

    .end local v1    # "_arg0":I
    .end local v6    # "_arg1":Landroid/bluetooth/IBluetoothProfileServiceConnection;
    .end local v12    # "_result":Z
    :sswitch_b
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .restart local v1    # "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v13

    invoke-static {v13}, Landroid/bluetooth/IBluetoothProfileServiceConnection$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothProfileServiceConnection;

    move-result-object v6

    .restart local v6    # "_arg1":Landroid/bluetooth/IBluetoothProfileServiceConnection;
    invoke-virtual {p0, v1, v6}, Landroid/bluetooth/IBluetoothManager$Stub;->unbindBluetoothProfileService(ILandroid/bluetooth/IBluetoothProfileServiceConnection;)V

    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 v13, 0x1

    return v13

    .end local v1    # "_arg0":I
    .end local v6    # "_arg1":Landroid/bluetooth/IBluetoothProfileServiceConnection;
    :sswitch_c
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->getAddress()Ljava/lang/String;

    move-result-object v11

    .local v11, "_result":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v13, 0x1

    return v13

    .end local v11    # "_result":Ljava/lang/String;
    :sswitch_d
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->getName()Ljava/lang/String;

    move-result-object v11

    .restart local v11    # "_result":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v13, 0x1

    return v13

    .end local v11    # "_result":Ljava/lang/String;
    :sswitch_e
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->isBleScanAlwaysAvailable()Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_8

    const/4 v13, 0x1

    :goto_8
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_8
    const/4 v13, 0x0

    goto :goto_8

    .end local v12    # "_result":Z
    :sswitch_f
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    .local v4, "_arg0":Landroid/os/IBinder;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_9

    const/4 v7, 0x1

    .local v7, "_arg1":Z
    :goto_9
    invoke-virtual {p0, v4, v7}, Landroid/bluetooth/IBluetoothManager$Stub;->updateBleAppCount(Landroid/os/IBinder;Z)I

    move-result v8

    .local v8, "_result":I
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    .end local v7    # "_arg1":Z
    .end local v8    # "_result":I
    :cond_9
    const/4 v7, 0x0

    .restart local v7    # "_arg1":Z
    goto :goto_9

    .end local v4    # "_arg0":Landroid/os/IBinder;
    .end local v7    # "_arg1":Z
    :sswitch_10
    const-string v13, "android.bluetooth.IBluetoothManager"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/bluetooth/IBluetoothManager$Stub;->isBleAppPresent()Z

    move-result v12

    .restart local v12    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v12, :cond_a

    const/4 v13, 0x1

    :goto_a
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v13, 0x1

    return v13

    :cond_a
    const/4 v13, 0x0

    goto :goto_a

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
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_d
        0xe -> :sswitch_e
        0xf -> :sswitch_f
        0x10 -> :sswitch_10
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
