.class Lcom/android/server/wifi/WifiStateMachine$InitialState;
.super Lcom/android/internal/util/State;
.source "WifiStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wifi/WifiStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InitialState"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/wifi/WifiStateMachine;


# direct methods
.method constructor <init>(Lcom/android/server/wifi/WifiStateMachine;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/wifi/WifiStateMachine;

    .prologue
    .line 5774
    iput-object p1, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public enter()V
    .locals 4

    .prologue
    .line 5777
    invoke-static {}, Lcom/android/server/wifi/WifiNative;->stopHal()V

    .line 5778
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get106(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiNative;

    invoke-static {}, Lcom/android/server/wifi/WifiNative;->unloadDriver()Z

    .line 5779
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get107(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    if-nez v0, :cond_0

    .line 5780
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    new-instance v1, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v1}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    invoke-static {v0, v1}, Lcom/android/server/wifi/WifiStateMachine;->-set50(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/internal/util/AsyncChannel;)Lcom/android/internal/util/AsyncChannel;

    .line 5781
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get107(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v1}, Lcom/android/server/wifi/WifiStateMachine;->-get20(Lcom/android/server/wifi/WifiStateMachine;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-virtual {v2}, Lcom/android/server/wifi/WifiStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 5782
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get108(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/p2p/WifiP2pServiceImpl;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/wifi/p2p/WifiP2pServiceImpl;->getP2pStateMachineMessenger()Landroid/os/Messenger;

    move-result-object v3

    .line 5781
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/util/AsyncChannel;->connect(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)V

    .line 5785
    :cond_0
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get97(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    if-nez v0, :cond_1

    .line 5786
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    new-instance v1, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v1}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    invoke-static {v0, v1}, Lcom/android/server/wifi/WifiStateMachine;->-set48(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/internal/util/AsyncChannel;)Lcom/android/internal/util/AsyncChannel;

    .line 5787
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    .line 5788
    iget-object v1, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v1}, Lcom/android/server/wifi/WifiStateMachine;->-get20(Lcom/android/server/wifi/WifiStateMachine;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-virtual {v2}, Lcom/android/server/wifi/WifiStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 5787
    invoke-static {v1, v2}, Lcom/android/server/wifi/WifiApConfigStore;->makeWifiApConfigStore(Landroid/content/Context;Landroid/os/Handler;)Lcom/android/server/wifi/WifiApConfigStore;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/server/wifi/WifiStateMachine;->-set49(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/server/wifi/WifiApConfigStore;)Lcom/android/server/wifi/WifiApConfigStore;

    .line 5789
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get98(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiApConfigStore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/wifi/WifiApConfigStore;->loadApConfiguration()V

    .line 5790
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get97(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v1}, Lcom/android/server/wifi/WifiStateMachine;->-get20(Lcom/android/server/wifi/WifiStateMachine;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-virtual {v2}, Lcom/android/server/wifi/WifiStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 5791
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get98(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiApConfigStore;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/wifi/WifiApConfigStore;->getMessenger()Landroid/os/Messenger;

    move-result-object v3

    .line 5790
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/util/AsyncChannel;->connectSync(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)I

    .line 5794
    :cond_1
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v0}, Lcom/android/server/wifi/WifiStateMachine;->-get100(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiConfigStore;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/wifi/WifiConfigStore;->enableHalBasedPno:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5796
    iget-object v0, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/wifi/WifiStateMachine;->-set21(Lcom/android/server/wifi/WifiStateMachine;Z)Z

    .line 5776
    :cond_2
    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 7
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 5801
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-virtual {p0}, Lcom/android/server/wifi/WifiStateMachine$InitialState;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, p1, v4}, Lcom/android/server/wifi/WifiStateMachine;->-wrap36(Lcom/android/server/wifi/WifiStateMachine;Landroid/os/Message;Ljava/lang/String;)V

    .line 5802
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 5873
    return v5

    .line 5804
    :sswitch_0
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get106(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiNative;

    invoke-static {}, Lcom/android/server/wifi/WifiNative;->loadDriver()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 5806
    :try_start_0
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get59(Lcom/android/server/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get45(Lcom/android/server/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "STA"

    invoke-interface {v3, v4, v5}, Landroid/os/INetworkManagementService;->wifiFirmwareReload(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5818
    :goto_0
    :try_start_1
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get59(Lcom/android/server/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get45(Lcom/android/server/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/os/INetworkManagementService;->setInterfaceDown(Ljava/lang/String;)V

    .line 5819
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get59(Lcom/android/server/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get45(Lcom/android/server/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/os/INetworkManagementService;->clearInterfaceAddresses(Ljava/lang/String;)V

    .line 5822
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get59(Lcom/android/server/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get45(Lcom/android/server/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/os/INetworkManagementService;->setInterfaceIpv6PrivacyExtensions(Ljava/lang/String;Z)V

    .line 5828
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get59(Lcom/android/server/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get45(Lcom/android/server/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/os/INetworkManagementService;->disableIpv6(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 5839
    :goto_1
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get105(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiMonitor;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get63(Lcom/android/server/wifi/WifiStateMachine;)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiMonitor;->killSupplicant(Z)V

    .line 5841
    invoke-static {}, Lcom/android/server/wifi/WifiNative;->startHal()Z

    move-result v3

    if-nez v3, :cond_0

    .line 5843
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const-string/jumbo v4, "Failed to start HAL"

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    .line 5846
    :cond_0
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get106(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiNative;

    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get63(Lcom/android/server/wifi/WifiStateMachine;)Z

    move-result v3

    invoke-static {v3}, Lcom/android/server/wifi/WifiNative;->startSupplicant(Z)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 5847
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->-wrap53(Lcom/android/server/wifi/WifiStateMachine;I)V

    .line 5848
    invoke-static {}, Lcom/android/server/wifi/WifiStateMachine;->-get0()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const-string/jumbo v4, "Supplicant start successful"

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->log(Ljava/lang/String;)V

    .line 5849
    :cond_1
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get105(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiMonitor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/wifi/WifiMonitor;->startMonitoring()V

    .line 5850
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get79(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/State;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->-wrap57(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/internal/util/IState;)V

    .line 5875
    :goto_2
    return v6

    .line 5807
    :catch_0
    move-exception v0

    .line 5808
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to reload STA firmware "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 5831
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 5832
    .local v1, "ie":Ljava/lang/IllegalStateException;
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to change interface settings: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 5829
    .end local v1    # "ie":Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v2

    .line 5830
    .local v2, "re":Landroid/os/RemoteException;
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to change interface settings: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 5852
    .end local v2    # "re":Landroid/os/RemoteException;
    :cond_2
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const-string/jumbo v4, "Failed to start supplicant!"

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto :goto_2

    .line 5855
    :cond_3
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const-string/jumbo v4, "Failed to load driver"

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto :goto_2

    .line 5859
    :sswitch_1
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-get106(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/server/wifi/WifiNative;

    invoke-static {}, Lcom/android/server/wifi/WifiNative;->loadDriver()Z

    move-result v3

    if-nez v3, :cond_4

    .line 5860
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const-string/jumbo v4, "Failed to load driver for softap"

    invoke-virtual {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V

    goto :goto_2

    .line 5862
    :cond_4
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v3}, Lcom/android/server/wifi/WifiStateMachine;->-wrap5(Lcom/android/server/wifi/WifiStateMachine;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 5863
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const/16 v4, 0xc

    invoke-static {v3, v4, v5}, Lcom/android/server/wifi/WifiStateMachine;->-wrap52(Lcom/android/server/wifi/WifiStateMachine;II)V

    .line 5864
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get76(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/State;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->-wrap57(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/internal/util/IState;)V

    goto/16 :goto_2

    .line 5866
    :cond_5
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    const/16 v4, 0xe

    invoke-static {v3, v4, v5}, Lcom/android/server/wifi/WifiStateMachine;->-wrap52(Lcom/android/server/wifi/WifiStateMachine;II)V

    .line 5868
    iget-object v3, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    iget-object v4, p0, Lcom/android/server/wifi/WifiStateMachine$InitialState;->this$0:Lcom/android/server/wifi/WifiStateMachine;

    invoke-static {v4}, Lcom/android/server/wifi/WifiStateMachine;->-get44(Lcom/android/server/wifi/WifiStateMachine;)Lcom/android/internal/util/State;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/server/wifi/WifiStateMachine;->-wrap57(Lcom/android/server/wifi/WifiStateMachine;Lcom/android/internal/util/IState;)V

    goto/16 :goto_2

    .line 5802
    :sswitch_data_0
    .sparse-switch
        0x2000b -> :sswitch_0
        0x20015 -> :sswitch_1
    .end sparse-switch
.end method
