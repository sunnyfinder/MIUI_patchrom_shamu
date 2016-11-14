.class public Landroid/hardware/camera2/legacy/CameraDeviceState;
.super Ljava/lang/Object;
.source "CameraDeviceState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final NO_CAPTURE_ERROR:I = -0x1

.field private static final STATE_CAPTURING:I = 0x4

.field private static final STATE_CONFIGURING:I = 0x2

.field private static final STATE_ERROR:I = 0x0

.field private static final STATE_IDLE:I = 0x3

.field private static final STATE_UNCONFIGURED:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CameraDeviceState"

.field private static final sStateNames:[Ljava/lang/String;


# instance fields
.field private mCurrentError:I

.field private mCurrentHandler:Landroid/os/Handler;

.field private mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

.field private mCurrentRequest:Landroid/hardware/camera2/legacy/RequestHolder;

.field private mCurrentState:I


# direct methods
.method static synthetic -get0(Landroid/hardware/camera2/legacy/CameraDeviceState;)I
    .locals 1

    iget v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    return v0
.end method

.method static synthetic -get1(Landroid/hardware/camera2/legacy/CameraDeviceState;)Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;
    .locals 1

    iget-object v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    return-object v0
.end method

.method static synthetic -get2(Landroid/hardware/camera2/legacy/CameraDeviceState;)Landroid/hardware/camera2/legacy/RequestHolder;
    .locals 1

    iget-object v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentRequest:Landroid/hardware/camera2/legacy/RequestHolder;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "ERROR"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "UNCONFIGURED"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "CONFIGURING"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "IDLE"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "CAPTURING"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sput-object v0, Landroid/hardware/camera2/legacy/CameraDeviceState;->sStateNames:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    iput-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentRequest:Landroid/hardware/camera2/legacy/RequestHolder;

    iput-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    iput-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    return-void
.end method

.method private doStateTransition(I)V
    .locals 3
    .param p1, "newState"    # I

    .prologue
    const-wide/16 v0, 0x0

    const/4 v2, -0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(IJI)V

    return-void
.end method

.method private doStateTransition(IJI)V
    .locals 8
    .param p1, "newState"    # I
    .param p2, "timestamp"    # J
    .param p4, "error"    # I

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x3

    const/4 v4, 0x0

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq p1, v1, :cond_1

    const-string v0, "UNKNOWN"

    .local v0, "stateName":Ljava/lang/String;
    if-ltz p1, :cond_0

    sget-object v1, Landroid/hardware/camera2/legacy/CameraDeviceState;->sStateNames:[Ljava/lang/String;

    array-length v1, v1

    if-ge p1, v1, :cond_0

    sget-object v1, Landroid/hardware/camera2/legacy/CameraDeviceState;->sStateNames:[Ljava/lang/String;

    aget-object v0, v1, p1

    :cond_0
    const-string v1, "CameraDeviceState"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Legacy camera service transitioning to state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0    # "stateName":Ljava/lang/String;
    :cond_1
    if-eqz p1, :cond_2

    if-eq p1, v5, :cond_2

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, p1, :cond_2

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$3;

    invoke-direct {v2, p0}, Landroid/hardware/camera2/legacy/CameraDeviceState$3;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Transition to unknown state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_1
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$4;

    invoke-direct {v2, p0}, Landroid/hardware/camera2/legacy/CameraDeviceState$4;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    iput v4, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    :cond_4
    :goto_0
    return-void

    :pswitch_2
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v6, :cond_5

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v5, :cond_5

    const-string v1, "CameraDeviceState"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot call configure while in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput v6, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    invoke-direct {p0, v4}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    goto :goto_0

    :cond_5
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v7, :cond_6

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v1, :cond_6

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v1, :cond_6

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$5;

    invoke-direct {v2, p0}, Landroid/hardware/camera2/legacy/CameraDeviceState$5;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_6
    iput v7, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    goto :goto_0

    :pswitch_3
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v5, :cond_4

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v7, :cond_7

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_7

    const-string v1, "CameraDeviceState"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot call idle while in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput v6, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    invoke-direct {p0, v4}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    goto :goto_0

    :cond_7
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v5, :cond_8

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v1, :cond_8

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v1, :cond_8

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$6;

    invoke-direct {v2, p0}, Landroid/hardware/camera2/legacy/CameraDeviceState$6;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_8
    iput v5, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    goto/16 :goto_0

    :pswitch_4
    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    if-eq v1, v5, :cond_9

    iget v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_9

    const-string v1, "CameraDeviceState"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot call capture while in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput v6, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    invoke-direct {p0, v4}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    goto/16 :goto_0

    :cond_9
    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v1, :cond_a

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v1, :cond_a

    const/4 v1, -0x1

    if-eq p4, v1, :cond_b

    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$7;

    invoke-direct {v2, p0, p4}, Landroid/hardware/camera2/legacy/CameraDeviceState$7;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_a
    :goto_1
    const/4 v1, 0x4

    iput v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    goto/16 :goto_0

    :cond_b
    iget-object v1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v2, Landroid/hardware/camera2/legacy/CameraDeviceState$8;

    invoke-direct {v2, p0, p2, p3}, Landroid/hardware/camera2/legacy/CameraDeviceState$8;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;J)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public declared-synchronized setCameraDeviceCallbacks(Landroid/os/Handler;Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "listener"    # Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    .prologue
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    iput-object p2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCaptureResult(Landroid/hardware/camera2/legacy/RequestHolder;Landroid/hardware/camera2/impl/CameraMetadataNative;I)Z
    .locals 6
    .param p1, "request"    # Landroid/hardware/camera2/legacy/RequestHolder;
    .param p2, "result"    # Landroid/hardware/camera2/impl/CameraMetadataNative;
    .param p3, "captureError"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v5, -0x1

    monitor-enter p0

    :try_start_0
    iget v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    const-string v2, "CameraDeviceState"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot receive result while in state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentState:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x1

    iput v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    iget v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, v5, :cond_0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    :try_start_1
    iget-object v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentListener:Landroid/hardware/camera2/legacy/CameraDeviceState$CameraDeviceStateListener;

    if-eqz v2, :cond_2

    if-eq p3, v5, :cond_3

    iget-object v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v3, Landroid/hardware/camera2/legacy/CameraDeviceState$1;

    invoke-direct {v3, p0, p3, p1}, Landroid/hardware/camera2/legacy/CameraDeviceState$1;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;ILandroid/hardware/camera2/legacy/RequestHolder;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    :goto_1
    iget v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v2, v5, :cond_4

    :goto_2
    monitor-exit p0

    return v0

    :cond_3
    :try_start_2
    iget-object v2, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentHandler:Landroid/os/Handler;

    new-instance v3, Landroid/hardware/camera2/legacy/CameraDeviceState$2;

    invoke-direct {v3, p0, p2, p1}, Landroid/hardware/camera2/legacy/CameraDeviceState$2;-><init>(Landroid/hardware/camera2/legacy/CameraDeviceState;Landroid/hardware/camera2/impl/CameraMetadataNative;Landroid/hardware/camera2/legacy/RequestHolder;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_4
    move v0, v1

    goto :goto_2
.end method

.method public declared-synchronized setCaptureStart(Landroid/hardware/camera2/legacy/RequestHolder;JI)Z
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/legacy/RequestHolder;
    .param p2, "timestamp"    # J
    .param p4, "captureError"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentRequest:Landroid/hardware/camera2/legacy/RequestHolder;

    const/4 v0, 0x4

    invoke-direct {p0, v0, p2, p3, p4}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(IJI)V

    iget v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setConfiguring()Z
    .locals 2

    .prologue
    monitor-enter p0

    const/4 v0, 0x2

    :try_start_0
    invoke-direct {p0, v0}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    iget v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setError(I)V
    .locals 1
    .param p1, "error"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    iput p1, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setIdle()Z
    .locals 2

    .prologue
    monitor-enter p0

    const/4 v0, 0x3

    :try_start_0
    invoke-direct {p0, v0}, Landroid/hardware/camera2/legacy/CameraDeviceState;->doStateTransition(I)V

    iget v0, p0, Landroid/hardware/camera2/legacy/CameraDeviceState;->mCurrentError:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
