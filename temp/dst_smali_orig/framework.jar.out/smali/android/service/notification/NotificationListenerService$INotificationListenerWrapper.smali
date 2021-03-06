.class Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;
.super Landroid/service/notification/INotificationListener$Stub;
.source "NotificationListenerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/service/notification/NotificationListenerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "INotificationListenerWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/service/notification/NotificationListenerService;


# direct methods
.method private constructor <init>(Landroid/service/notification/NotificationListenerService;)V
    .locals 0
    .param p1, "this$0"    # Landroid/service/notification/NotificationListenerService;

    .prologue
    iput-object p1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-direct {p0}, Landroid/service/notification/INotificationListener$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/service/notification/NotificationListenerService;Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;)V
    .locals 0
    .param p1, "this$0"    # Landroid/service/notification/NotificationListenerService;

    .prologue
    invoke-direct {p0, p1}, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;-><init>(Landroid/service/notification/NotificationListenerService;)V

    return-void
.end method


# virtual methods
.method public onInterruptionFilterChanged(I)V
    .locals 3
    .param p1, "interruptionFilter"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    :try_start_0
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-virtual {v1, p1}, Landroid/service/notification/NotificationListenerService;->onInterruptionFilterChanged(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error running onInterruptionFilterChanged"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onListenerConnected(Landroid/service/notification/NotificationRankingUpdate;)V
    .locals 4
    .param p1, "update"    # Landroid/service/notification/NotificationRankingUpdate;

    .prologue
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get2(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1, p1}, Landroid/service/notification/NotificationListenerService;->-wrap1(Landroid/service/notification/NotificationListenerService;Landroid/service/notification/NotificationRankingUpdate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-virtual {v1}, Landroid/service/notification/NotificationListenerService;->onListenerConnected()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit v2

    return-void

    :catch_0
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    :try_start_2
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Error running onListenerConnected"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public onListenerHintsChanged(I)V
    .locals 3
    .param p1, "hints"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    :try_start_0
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-virtual {v1, p1}, Landroid/service/notification/NotificationListenerService;->onListenerHintsChanged(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error running onListenerHintsChanged"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onNotificationPosted(Landroid/service/notification/IStatusBarNotificationHolder;Landroid/service/notification/NotificationRankingUpdate;)V
    .locals 7
    .param p1, "sbnHolder"    # Landroid/service/notification/IStatusBarNotificationHolder;
    .param p2, "update"    # Landroid/service/notification/NotificationRankingUpdate;

    .prologue
    :try_start_0
    invoke-interface {p1}, Landroid/service/notification/IStatusBarNotificationHolder;->get()Landroid/service/notification/StatusBarNotification;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .local v2, "sbn":Landroid/service/notification/StatusBarNotification;
    :try_start_1
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4}, Landroid/service/notification/NotificationListenerService;->-wrap0(Landroid/service/notification/NotificationListenerService;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/app/Notification$Builder;->rebuild(Landroid/content/Context;Landroid/app/Notification;)Landroid/app/Notification;

    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-virtual {v2}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/service/notification/NotificationListenerService;->-wrap2(Landroid/service/notification/NotificationListenerService;Landroid/app/Notification;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v2    # "sbn":Landroid/service/notification/StatusBarNotification;
    :goto_0
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4}, Landroid/service/notification/NotificationListenerService;->-get2(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;

    move-result-object v5

    monitor-enter v5

    :try_start_2
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4, p2}, Landroid/service/notification/NotificationListenerService;->-wrap1(Landroid/service/notification/NotificationListenerService;Landroid/service/notification/NotificationRankingUpdate;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_0

    :try_start_3
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    iget-object v6, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v6}, Landroid/service/notification/NotificationListenerService;->-get1(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$RankingMap;

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Landroid/service/notification/NotificationListenerService;->onNotificationPosted(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/NotificationListenerService$RankingMap;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    monitor-exit v5

    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "onNotificationPosted: Error receiving StatusBarNotification"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "sbn":Landroid/service/notification/StatusBarNotification;
    :catch_1
    move-exception v1

    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const/4 v2, 0x0

    .local v2, "sbn":Landroid/service/notification/StatusBarNotification;
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onNotificationPosted: can\'t rebuild notification from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v2    # "sbn":Landroid/service/notification/StatusBarNotification;
    :cond_0
    :try_start_4
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    iget-object v6, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v6}, Landroid/service/notification/NotificationListenerService;->-get1(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$RankingMap;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/service/notification/NotificationListenerService;->onNotificationRankingUpdate(Landroid/service/notification/NotificationListenerService$RankingMap;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :catch_2
    move-exception v3

    .local v3, "t":Ljava/lang/Throwable;
    :try_start_5
    iget-object v4, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v4}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "Error running onNotificationPosted"

    invoke-static {v4, v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method

.method public onNotificationRankingUpdate(Landroid/service/notification/NotificationRankingUpdate;)V
    .locals 4
    .param p1, "update"    # Landroid/service/notification/NotificationRankingUpdate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get2(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1, p1}, Landroid/service/notification/NotificationListenerService;->-wrap1(Landroid/service/notification/NotificationListenerService;Landroid/service/notification/NotificationRankingUpdate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v3}, Landroid/service/notification/NotificationListenerService;->-get1(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$RankingMap;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/service/notification/NotificationListenerService;->onNotificationRankingUpdate(Landroid/service/notification/NotificationListenerService$RankingMap;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit v2

    return-void

    :catch_0
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    :try_start_2
    iget-object v1, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v1}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Error running onNotificationRankingUpdate"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public onNotificationRemoved(Landroid/service/notification/IStatusBarNotificationHolder;Landroid/service/notification/NotificationRankingUpdate;)V
    .locals 6
    .param p1, "sbnHolder"    # Landroid/service/notification/IStatusBarNotificationHolder;
    .param p2, "update"    # Landroid/service/notification/NotificationRankingUpdate;

    .prologue
    :try_start_0
    invoke-interface {p1}, Landroid/service/notification/IStatusBarNotificationHolder;->get()Landroid/service/notification/StatusBarNotification;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .local v1, "sbn":Landroid/service/notification/StatusBarNotification;
    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v3}, Landroid/service/notification/NotificationListenerService;->-get2(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;

    move-result-object v4

    monitor-enter v4

    :try_start_1
    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v3, p2}, Landroid/service/notification/NotificationListenerService;->-wrap1(Landroid/service/notification/NotificationListenerService;Landroid/service/notification/NotificationRankingUpdate;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    iget-object v5, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v5}, Landroid/service/notification/NotificationListenerService;->-get1(Landroid/service/notification/NotificationListenerService;)Landroid/service/notification/NotificationListenerService$RankingMap;

    move-result-object v5

    invoke-virtual {v3, v1, v5}, Landroid/service/notification/NotificationListenerService;->onNotificationRemoved(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/NotificationListenerService$RankingMap;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit v4

    return-void

    .end local v1    # "sbn":Landroid/service/notification/StatusBarNotification;
    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v3}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "onNotificationRemoved: Error receiving StatusBarNotification"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "sbn":Landroid/service/notification/StatusBarNotification;
    :catch_1
    move-exception v2

    .local v2, "t":Ljava/lang/Throwable;
    :try_start_3
    iget-object v3, p0, Landroid/service/notification/NotificationListenerService$INotificationListenerWrapper;->this$0:Landroid/service/notification/NotificationListenerService;

    invoke-static {v3}, Landroid/service/notification/NotificationListenerService;->-get0(Landroid/service/notification/NotificationListenerService;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "Error running onNotificationRemoved"

    invoke-static {v3, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method
