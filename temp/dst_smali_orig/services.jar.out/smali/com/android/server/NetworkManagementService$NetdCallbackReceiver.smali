.class Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;
.super Ljava/lang/Object;
.source "NetworkManagementService.java"

# interfaces
.implements Lcom/android/server/INativeDaemonConnectorCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NetworkManagementService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetdCallbackReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NetworkManagementService;


# direct methods
.method private constructor <init>(Lcom/android/server/NetworkManagementService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/NetworkManagementService;

    .prologue
    iput-object p1, p0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/NetworkManagementService;Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/NetworkManagementService;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;-><init>(Lcom/android/server/NetworkManagementService;)V

    return-void
.end method


# virtual methods
.method public onCheckHoldWakeLock(I)Z
    .locals 1
    .param p1, "code"    # I

    .prologue
    const/16 v0, 0x265

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDaemonConnected()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    iget-object v0, p0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    invoke-static {v0}, Lcom/android/server/NetworkManagementService;->-get1(Lcom/android/server/NetworkManagementService;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    invoke-static {v0}, Lcom/android/server/NetworkManagementService;->-get1(Lcom/android/server/NetworkManagementService;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    invoke-static {v0, v1}, Lcom/android/server/NetworkManagementService;->-set0(Lcom/android/server/NetworkManagementService;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    invoke-static {v0}, Lcom/android/server/NetworkManagementService;->-get2(Lcom/android/server/NetworkManagementService;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver$1;

    invoke-direct {v1, p0}, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver$1;-><init>(Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onEvent(ILjava/lang/String;[Ljava/lang/String;)Z
    .locals 31
    .param p1, "code"    # I
    .param p2, "raw"    # Ljava/lang/String;
    .param p3, "cooked"    # [Ljava/lang/String;

    .prologue
    const-string v5, "Invalid event from daemon (%s)"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .local v14, "errorMessage":Ljava/lang/String;
    sparse-switch p1, :sswitch_data_0

    :goto_0
    const/4 v5, 0x0

    return v5

    :sswitch_0
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x4

    if-lt v5, v6, :cond_0

    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "Iface"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "added"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    invoke-static {v5, v6}, Lcom/android/server/NetworkManagementService;->-wrap2(Lcom/android/server/NetworkManagementService;Ljava/lang/String;)V

    const/4 v5, 0x1

    return v5

    :cond_0
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_1
    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "removed"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    invoke-static {v5, v6}, Lcom/android/server/NetworkManagementService;->-wrap6(Lcom/android/server/NetworkManagementService;Ljava/lang/String;)V

    const/4 v5, 0x1

    return v5

    :cond_2
    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "changed"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x5

    if-ne v5, v6, :cond_3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    const/4 v7, 0x4

    aget-object v7, p3, v7

    const-string v10, "up"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    invoke-static {v5, v6, v7}, Lcom/android/server/NetworkManagementService;->-wrap7(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Z)V

    const/4 v5, 0x1

    return v5

    :cond_3
    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "linkstate"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x5

    if-ne v5, v6, :cond_4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    const/4 v7, 0x4

    aget-object v7, p3, v7

    const-string v10, "up"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    invoke-static {v5, v6, v7}, Lcom/android/server/NetworkManagementService;->-wrap5(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Z)V

    const/4 v5, 0x1

    return v5

    :cond_4
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :sswitch_1
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x5

    if-lt v5, v6, :cond_5

    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "limit"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "alert"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    const/4 v7, 0x4

    aget-object v7, p3, v7

    invoke-static {v5, v6, v7}, Lcom/android/server/NetworkManagementService;->-wrap8(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v5, 0x1

    return v5

    :cond_5
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_6
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :sswitch_2
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x4

    if-lt v5, v6, :cond_7

    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "IfaceClass"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-wide/16 v8, 0x0

    .local v8, "timestampNanos":J
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x5

    if-ne v5, v6, :cond_8

    const/4 v5, 0x4

    :try_start_0
    aget-object v5, p3, v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-wide v8

    :goto_1
    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "active"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    .local v21, "isActive":Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-eqz v21, :cond_9

    sget v7, Landroid/telephony/DataConnectionRealTimeInfo;->DC_POWER_STATE_HIGH:I

    :goto_2
    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lcom/android/server/NetworkManagementService;->-wrap3(Lcom/android/server/NetworkManagementService;IIJZ)V

    const/4 v5, 0x1

    return v5

    .end local v8    # "timestampNanos":J
    .end local v21    # "isActive":Z
    :cond_7
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .restart local v8    # "timestampNanos":J
    :cond_8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v8

    goto :goto_1

    .restart local v21    # "isActive":Z
    :cond_9
    sget v7, Landroid/telephony/DataConnectionRealTimeInfo;->DC_POWER_STATE_LOW:I

    goto :goto_2

    .end local v8    # "timestampNanos":J
    .end local v21    # "isActive":Z
    :sswitch_3
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x7

    if-lt v5, v6, :cond_a

    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "Address"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    const/4 v5, 0x4

    aget-object v19, p3, v5

    .local v19, "iface":Ljava/lang/String;
    const/4 v5, 0x5

    :try_start_1
    aget-object v5, p3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .local v16, "flags":I
    const/4 v5, 0x6

    aget-object v5, p3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v26

    .local v26, "scope":I
    new-instance v4, Landroid/net/LinkAddress;

    const/4 v5, 0x3

    aget-object v5, p3, v5

    move/from16 v0, v16

    move/from16 v1, v26

    invoke-direct {v4, v5, v0, v1}, Landroid/net/LinkAddress;-><init>(Ljava/lang/String;II)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .local v4, "address":Landroid/net/LinkAddress;
    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "updated"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    move-object/from16 v0, v19

    invoke-static {v5, v0, v4}, Lcom/android/server/NetworkManagementService;->-wrap1(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Landroid/net/LinkAddress;)V

    :goto_3
    const/4 v5, 0x1

    return v5

    .end local v4    # "address":Landroid/net/LinkAddress;
    .end local v16    # "flags":I
    .end local v19    # "iface":Ljava/lang/String;
    .end local v26    # "scope":I
    :cond_a
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .restart local v19    # "iface":Ljava/lang/String;
    :catch_0
    move-exception v12

    .local v12, "e":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v12    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v13

    .local v13, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v13    # "e":Ljava/lang/NumberFormatException;
    .restart local v4    # "address":Landroid/net/LinkAddress;
    .restart local v16    # "flags":I
    .restart local v26    # "scope":I
    :cond_b
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    move-object/from16 v0, v19

    invoke-static {v5, v0, v4}, Lcom/android/server/NetworkManagementService;->-wrap0(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Landroid/net/LinkAddress;)V

    goto :goto_3

    .end local v4    # "address":Landroid/net/LinkAddress;
    .end local v16    # "flags":I
    .end local v19    # "iface":Ljava/lang/String;
    .end local v26    # "scope":I
    :sswitch_4
    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x6

    if-ne v5, v6, :cond_c

    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "DnsInfo"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    const/4 v5, 0x2

    aget-object v5, p3, v5

    const-string v6, "servers"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    const/4 v5, 0x4

    :try_start_2
    aget-object v5, p3, v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-wide v22

    .local v22, "lifetime":J
    const/4 v5, 0x5

    aget-object v5, p3, v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v27

    .local v27, "servers":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    move-wide/from16 v0, v22

    move-object/from16 v2, v27

    invoke-static {v5, v6, v0, v1, v2}, Lcom/android/server/NetworkManagementService;->-wrap4(Lcom/android/server/NetworkManagementService;Ljava/lang/String;J[Ljava/lang/String;)V

    .end local v22    # "lifetime":J
    .end local v27    # "servers":[Ljava/lang/String;
    :cond_c
    const/4 v5, 0x1

    return v5

    :catch_2
    move-exception v13

    .restart local v13    # "e":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v13    # "e":Ljava/lang/NumberFormatException;
    :sswitch_5
    const/4 v5, 0x1

    aget-object v5, p3, v5

    const-string v6, "Route"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    move-object/from16 v0, p3

    array-length v5, v0

    const/4 v6, 0x6

    if-ge v5, v6, :cond_e

    :cond_d
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_e
    const/16 v30, 0x0

    .local v30, "via":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "dev":Ljava/lang/String;
    const/16 v29, 0x1

    .local v29, "valid":Z
    const/16 v18, 0x4

    .end local v11    # "dev":Ljava/lang/String;
    .end local v30    # "via":Ljava/lang/String;
    .local v18, "i":I
    :goto_4
    add-int/lit8 v5, v18, 0x1

    move-object/from16 v0, p3

    array-length v6, v0

    if-ge v5, v6, :cond_13

    if-eqz v29, :cond_13

    aget-object v5, p3, v18

    const-string v6, "dev"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    if-nez v11, :cond_f

    add-int/lit8 v5, v18, 0x1

    aget-object v11, p3, v5

    :goto_5
    add-int/lit8 v18, v18, 0x2

    goto :goto_4

    :cond_f
    const/16 v29, 0x0

    goto :goto_5

    :cond_10
    aget-object v5, p3, v18

    const-string v6, "via"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    if-nez v30, :cond_11

    add-int/lit8 v5, v18, 0x1

    aget-object v30, p3, v5

    .local v30, "via":Ljava/lang/String;
    goto :goto_5

    .end local v30    # "via":Ljava/lang/String;
    :cond_11
    const/16 v29, 0x0

    goto :goto_5

    :cond_12
    const/16 v29, 0x0

    goto :goto_5

    :cond_13
    if-eqz v29, :cond_15

    const/16 v17, 0x0

    .local v17, "gateway":Ljava/net/InetAddress;
    if-eqz v30, :cond_14

    :try_start_3
    invoke-static/range {v30 .. v30}, Ljava/net/InetAddress;->parseNumericAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v17

    .end local v17    # "gateway":Ljava/net/InetAddress;
    :cond_14
    new-instance v25, Landroid/net/RouteInfo;

    new-instance v5, Landroid/net/IpPrefix;

    const/4 v6, 0x3

    aget-object v6, p3, v6

    invoke-direct {v5, v6}, Landroid/net/IpPrefix;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v17

    invoke-direct {v0, v5, v1, v11}, Landroid/net/RouteInfo;-><init>(Landroid/net/IpPrefix;Ljava/net/InetAddress;Ljava/lang/String;)V

    .local v25, "route":Landroid/net/RouteInfo;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/NetworkManagementService$NetdCallbackReceiver;->this$0:Lcom/android/server/NetworkManagementService;

    const/4 v6, 0x2

    aget-object v6, p3, v6

    move-object/from16 v0, v25

    invoke-static {v5, v6, v0}, Lcom/android/server/NetworkManagementService;->-wrap9(Lcom/android/server/NetworkManagementService;Ljava/lang/String;Landroid/net/RouteInfo;)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    const/4 v5, 0x1

    return v5

    .end local v25    # "route":Landroid/net/RouteInfo;
    :catch_3
    move-exception v12

    :cond_15
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v18    # "i":I
    .end local v29    # "valid":Z
    :sswitch_6
    const/4 v5, 0x1

    aget-object v5, p3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v28

    .local v28, "uid":I
    const/4 v5, 0x2

    aget-object v5, p3, v5

    invoke-static {v5}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v15

    .local v15, "firstPacket":[B
    :try_start_4
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    move/from16 v0, v28

    invoke-interface {v5, v0, v15}, Landroid/app/IActivityManager;->notifyCleartextNetwork(I[B)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    :catch_4
    move-exception v20

    .local v20, "ignored":Landroid/os/RemoteException;
    goto/16 :goto_0

    .end local v15    # "firstPacket":[B
    .end local v20    # "ignored":Landroid/os/RemoteException;
    .end local v28    # "uid":I
    .restart local v8    # "timestampNanos":J
    :catch_5
    move-exception v24

    .local v24, "ne":Ljava/lang/NumberFormatException;
    goto/16 :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0x258 -> :sswitch_0
        0x259 -> :sswitch_1
        0x265 -> :sswitch_2
        0x266 -> :sswitch_3
        0x267 -> :sswitch_4
        0x268 -> :sswitch_5
        0x269 -> :sswitch_6
    .end sparse-switch
.end method
