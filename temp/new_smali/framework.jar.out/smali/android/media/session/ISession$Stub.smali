.class public abstract Landroid/media/session/ISession$Stub;
.super Landroid/os/Binder;
.source "ISession.java"

# interfaces
.implements Landroid/media/session/ISession;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/session/ISession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/session/ISession$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.media.session.ISession"

.field static final TRANSACTION_destroy:I = 0x7

.field static final TRANSACTION_getController:I = 0x2

.field static final TRANSACTION_sendEvent:I = 0x1

.field static final TRANSACTION_setActive:I = 0x4

.field static final TRANSACTION_setCurrentVolume:I = 0x10

.field static final TRANSACTION_setExtras:I = 0xc

.field static final TRANSACTION_setFlags:I = 0x3

.field static final TRANSACTION_setLaunchPendingIntent:I = 0x6

.field static final TRANSACTION_setMediaButtonReceiver:I = 0x5

.field static final TRANSACTION_setMetadata:I = 0x8

.field static final TRANSACTION_setPlaybackState:I = 0x9

.field static final TRANSACTION_setPlaybackToLocal:I = 0xe

.field static final TRANSACTION_setPlaybackToRemote:I = 0xf

.field static final TRANSACTION_setQueue:I = 0xa

.field static final TRANSACTION_setQueueTitle:I = 0xb

.field static final TRANSACTION_setRatingType:I = 0xd


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "android.media.session.ISession"

    invoke-virtual {p0, p0, v0}, Landroid/media/session/ISession$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/media/session/ISession;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string v1, "android.media.session.ISession"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/media/session/ISession;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/media/session/ISession;

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/media/session/ISession$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Landroid/media/session/ISession$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
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
    const/4 v4, 0x1

    sparse-switch p1, :sswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_0
    return v4

    :sswitch_0
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_1
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .local v0, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .local v1, "_arg1":Landroid/os/Bundle;
    :goto_1
    invoke-virtual {p0, v0, v1}, Landroid/media/session/ISession$Stub;->sendEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v1    # "_arg1":Landroid/os/Bundle;
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "_arg1":Landroid/os/Bundle;
    goto :goto_1

    .end local v0    # "_arg0":Ljava/lang/String;
    .end local v1    # "_arg1":Landroid/os/Bundle;
    :sswitch_2
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/media/session/ISession$Stub;->getController()Landroid/media/session/ISessionController;

    move-result-object v2

    .local v2, "_result":Landroid/media/session/ISessionController;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v2, :cond_1

    invoke-interface {v2}, Landroid/media/session/ISessionController;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    :goto_2
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    goto :goto_2

    .end local v2    # "_result":Landroid/media/session/ISessionController;
    :sswitch_3
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .local v0, "_arg0":I
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setFlags(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v0    # "_arg0":I
    :sswitch_4
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_2

    move v0, v4

    .local v0, "_arg0":Z
    :goto_3
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setActive(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v0    # "_arg0":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    :sswitch_5
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_3

    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .local v0, "_arg0":Landroid/app/PendingIntent;
    :goto_4
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setMediaButtonReceiver(Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    goto :goto_4

    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :sswitch_6
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_4

    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    :goto_5
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setLaunchPendingIntent(Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    goto :goto_5

    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :sswitch_7
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/media/session/ISession$Stub;->destroy()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    :sswitch_8
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_5

    sget-object v3, Landroid/media/MediaMetadata;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaMetadata;

    .local v0, "_arg0":Landroid/media/MediaMetadata;
    :goto_6
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setMetadata(Landroid/media/MediaMetadata;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/media/MediaMetadata;
    :cond_5
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/media/MediaMetadata;
    goto :goto_6

    .end local v0    # "_arg0":Landroid/media/MediaMetadata;
    :sswitch_9
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_6

    sget-object v3, Landroid/media/session/PlaybackState;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/PlaybackState;

    .local v0, "_arg0":Landroid/media/session/PlaybackState;
    :goto_7
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/media/session/PlaybackState;
    :cond_6
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/media/session/PlaybackState;
    goto :goto_7

    .end local v0    # "_arg0":Landroid/media/session/PlaybackState;
    :sswitch_a
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_7

    sget-object v3, Landroid/content/pm/ParceledListSlice;->CREATOR:Landroid/os/Parcelable$ClassLoaderCreator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$ClassLoaderCreator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ParceledListSlice;

    .local v0, "_arg0":Landroid/content/pm/ParceledListSlice;
    :goto_8
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setQueue(Landroid/content/pm/ParceledListSlice;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/content/pm/ParceledListSlice;
    :cond_7
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/content/pm/ParceledListSlice;
    goto :goto_8

    .end local v0    # "_arg0":Landroid/content/pm/ParceledListSlice;
    :sswitch_b
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_8

    sget-object v3, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .local v0, "_arg0":Ljava/lang/CharSequence;
    :goto_9
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setQueueTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Ljava/lang/CharSequence;
    :cond_8
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Ljava/lang/CharSequence;
    goto :goto_9

    .end local v0    # "_arg0":Ljava/lang/CharSequence;
    :sswitch_c
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_9

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .local v0, "_arg0":Landroid/os/Bundle;
    :goto_a
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setExtras(Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/os/Bundle;
    :cond_9
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/os/Bundle;
    goto :goto_a

    .end local v0    # "_arg0":Landroid/os/Bundle;
    :sswitch_d
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .local v0, "_arg0":I
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setRatingType(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":I
    :sswitch_e
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_a

    sget-object v3, Landroid/media/AudioAttributes;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioAttributes;

    .local v0, "_arg0":Landroid/media/AudioAttributes;
    :goto_b
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setPlaybackToLocal(Landroid/media/AudioAttributes;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":Landroid/media/AudioAttributes;
    :cond_a
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/media/AudioAttributes;
    goto :goto_b

    .end local v0    # "_arg0":Landroid/media/AudioAttributes;
    :sswitch_f
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .local v0, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .local v1, "_arg1":I
    invoke-virtual {p0, v0, v1}, Landroid/media/session/ISession$Stub;->setPlaybackToRemote(II)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .end local v0    # "_arg0":I
    .end local v1    # "_arg1":I
    :sswitch_10
    const-string v3, "android.media.session.ISession"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .restart local v0    # "_arg0":I
    invoke-virtual {p0, v0}, Landroid/media/session/ISession$Stub;->setCurrentVolume(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

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
