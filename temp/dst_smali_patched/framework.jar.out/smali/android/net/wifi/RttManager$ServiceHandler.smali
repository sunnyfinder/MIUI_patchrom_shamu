.class Landroid/net/wifi/RttManager$ServiceHandler;
.super Landroid/os/Handler;
.source "RttManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/wifi/RttManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServiceHandler"
.end annotation


# direct methods
.method constructor <init>(Landroid/os/Looper;)V
    .locals 0
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    const-string v1, "RttManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RTT manager get message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Landroid/net/wifi/RttManager;->-wrap0(I)Ljava/lang/Object;

    move-result-object v0

    .local v0, "listener":Ljava/lang/Object;
    if-nez v0, :cond_1

    const-string v1, "RttManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid listener key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .end local v0    # "listener":Ljava/lang/Object;
    :pswitch_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-nez v1, :cond_0

    invoke-static {}, Landroid/net/wifi/RttManager;->-get0()Lcom/android/internal/util/AsyncChannel;

    move-result-object v1

    const v2, 0x11001

    invoke-virtual {v1, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    :goto_0
    invoke-static {}, Landroid/net/wifi/RttManager;->-get1()Ljava/util/concurrent/CountDownLatch;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :cond_0
    const-string v1, "RttManager"

    const-string v2, "Failed to set up channel connection"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Landroid/net/wifi/RttManager;->-set0(Lcom/android/internal/util/AsyncChannel;)Lcom/android/internal/util/AsyncChannel;

    goto :goto_0

    :pswitch_2
    return-void

    :pswitch_3
    const-string v1, "RttManager"

    const-string v2, "Channel connection lost"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Landroid/net/wifi/RttManager;->-set0(Lcom/android/internal/util/AsyncChannel;)Lcom/android/internal/util/AsyncChannel;

    invoke-virtual {p0}, Landroid/net/wifi/RttManager$ServiceHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    return-void

    .restart local v0    # "listener":Ljava/lang/Object;
    :cond_1
    const-string v1, "RttManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "listener key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_1

    const-string v1, "RttManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ignoring message "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_4
    invoke-virtual {p0, v0, p1}, Landroid/net/wifi/RttManager$ServiceHandler;->reportSuccess(Ljava/lang/Object;Landroid/os/Message;)V

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Landroid/net/wifi/RttManager;->-wrap1(I)Ljava/lang/Object;

    .end local v0    # "listener":Ljava/lang/Object;
    :goto_1
    return-void

    .restart local v0    # "listener":Ljava/lang/Object;
    :pswitch_5
    invoke-virtual {p0, v0, p1}, Landroid/net/wifi/RttManager$ServiceHandler;->reportFailure(Ljava/lang/Object;Landroid/os/Message;)V

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Landroid/net/wifi/RttManager;->-wrap1(I)Ljava/lang/Object;

    goto :goto_1

    :pswitch_6
    check-cast v0, Landroid/net/wifi/RttManager$RttListener;

    .end local v0    # "listener":Ljava/lang/Object;
    invoke-interface {v0}, Landroid/net/wifi/RttManager$RttListener;->onAborted()V

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Landroid/net/wifi/RttManager;->-wrap1(I)Ljava/lang/Object;

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x11000
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x27202
        :pswitch_5
        :pswitch_4
        :pswitch_6
    .end packed-switch
.end method

.method reportFailure(Ljava/lang/Object;Landroid/os/Message;)V
    .locals 4
    .param p1, "listener"    # Ljava/lang/Object;
    .param p2, "msg"    # Landroid/os/Message;

    .prologue
    move-object v1, p1

    check-cast v1, Landroid/net/wifi/RttManager$RttListener;

    .local v1, "rttListener":Landroid/net/wifi/RttManager$RttListener;
    iget-object v0, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .local v0, "bundle":Landroid/os/Bundle;
    check-cast p1, Landroid/net/wifi/RttManager$RttListener;

    .end local p1    # "listener":Ljava/lang/Object;
    iget v2, p2, Landroid/os/Message;->arg1:I

    const-string v3, "android.net.wifi.RttManager.Description"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Landroid/net/wifi/RttManager$RttListener;->onFailure(ILjava/lang/String;)V

    return-void
.end method

.method reportSuccess(Ljava/lang/Object;Landroid/os/Message;)V
    .locals 3
    .param p1, "listener"    # Ljava/lang/Object;
    .param p2, "msg"    # Landroid/os/Message;

    .prologue
    move-object v1, p1

    check-cast v1, Landroid/net/wifi/RttManager$RttListener;

    .local v1, "rttListener":Landroid/net/wifi/RttManager$RttListener;
    iget-object v0, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/net/wifi/RttManager$ParcelableRttResults;

    .local v0, "parcelableResults":Landroid/net/wifi/RttManager$ParcelableRttResults;
    check-cast p1, Landroid/net/wifi/RttManager$RttListener;

    .end local p1    # "listener":Ljava/lang/Object;
    iget-object v2, v0, Landroid/net/wifi/RttManager$ParcelableRttResults;->mResults:[Landroid/net/wifi/RttManager$RttResult;

    invoke-interface {p1, v2}, Landroid/net/wifi/RttManager$RttListener;->onSuccess([Landroid/net/wifi/RttManager$RttResult;)V

    return-void
.end method
