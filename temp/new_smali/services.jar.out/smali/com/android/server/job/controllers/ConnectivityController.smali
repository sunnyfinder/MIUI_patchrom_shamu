.class public Lcom/android/server/job/controllers/ConnectivityController;
.super Lcom/android/server/job/controllers/StateController;
.source "ConnectivityController.java"

# interfaces
.implements Landroid/net/ConnectivityManager$OnNetworkActiveListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/job/controllers/ConnectivityController$ConnectivityChangedReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "JobScheduler.Conn"

.field private static mSingleton:Lcom/android/server/job/controllers/ConnectivityController;

.field private static sCreationLock:Ljava/lang/Object;


# instance fields
.field private final mConnectivityChangedReceiver:Landroid/content/BroadcastReceiver;

.field private mNetworkConnected:Z

.field private mNetworkUnmetered:Z

.field private final mTrackedJobs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/job/controllers/JobStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/server/job/controllers/ConnectivityController;->sCreationLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/android/server/job/StateChangedListener;Landroid/content/Context;)V
    .locals 7
    .param p1, "stateChangedListener"    # Lcom/android/server/job/StateChangedListener;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    invoke-direct {p0, p1, p2}, Lcom/android/server/job/controllers/StateController;-><init>(Lcom/android/server/job/StateChangedListener;Landroid/content/Context;)V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    new-instance v0, Lcom/android/server/job/controllers/ConnectivityController$ConnectivityChangedReceiver;

    invoke-direct {v0, p0}, Lcom/android/server/job/controllers/ConnectivityController$ConnectivityChangedReceiver;-><init>(Lcom/android/server/job/controllers/ConnectivityController;)V

    iput-object v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mConnectivityChangedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .local v3, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/job/controllers/ConnectivityController;->mConnectivityChangedReceiver:Landroid/content/BroadcastReceiver;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    const-string v0, "connectivity"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    check-cast v6, Lcom/android/server/ConnectivityService;

    .local v6, "cs":Lcom/android/server/ConnectivityService;
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lcom/android/server/ConnectivityService;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v6}, Lcom/android/server/ConnectivityService;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    :cond_0
    iget-boolean v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    if-eqz v0, :cond_2

    invoke-virtual {v6}, Lcom/android/server/ConnectivityService;->isActiveNetworkMetered()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    :cond_1
    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$002(Lcom/android/server/job/controllers/ConnectivityController;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/job/controllers/ConnectivityController;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/server/job/controllers/ConnectivityController;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/job/controllers/ConnectivityController;

    .prologue
    iget-boolean v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    return v0
.end method

.method static synthetic access$102(Lcom/android/server/job/controllers/ConnectivityController;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/job/controllers/ConnectivityController;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/server/job/controllers/ConnectivityController;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/job/controllers/ConnectivityController;
    .param p1, "x1"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/job/controllers/ConnectivityController;->updateTrackedJobs(I)V

    return-void
.end method

.method public static get(Lcom/android/server/job/JobSchedulerService;)Lcom/android/server/job/controllers/ConnectivityController;
    .locals 3
    .param p0, "jms"    # Lcom/android/server/job/JobSchedulerService;

    .prologue
    sget-object v1, Lcom/android/server/job/controllers/ConnectivityController;->sCreationLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/android/server/job/controllers/ConnectivityController;->mSingleton:Lcom/android/server/job/controllers/ConnectivityController;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/server/job/controllers/ConnectivityController;

    invoke-virtual {p0}, Lcom/android/server/job/JobSchedulerService;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/android/server/job/controllers/ConnectivityController;-><init>(Lcom/android/server/job/StateChangedListener;Landroid/content/Context;)V

    sput-object v0, Lcom/android/server/job/controllers/ConnectivityController;->mSingleton:Lcom/android/server/job/controllers/ConnectivityController;

    :cond_0
    sget-object v0, Lcom/android/server/job/controllers/ConnectivityController;->mSingleton:Lcom/android/server/job/controllers/ConnectivityController;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private updateTrackedJobs(I)V
    .locals 8
    .param p1, "userId"    # I

    .prologue
    iget-object v6, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    monitor-enter v6

    const/4 v0, 0x0

    .local v0, "changed":Z
    :try_start_0
    iget-object v5, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/job/controllers/JobStatus;

    .local v2, "js":Lcom/android/server/job/controllers/JobStatus;
    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->getUserId()I

    move-result v5

    if-ne v5, p1, :cond_0

    iget-object v5, v2, Lcom/android/server/job/controllers/JobStatus;->connectivityConstraintSatisfied:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-boolean v7, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    .local v3, "prevIsConnected":Z
    iget-object v5, v2, Lcom/android/server/job/controllers/JobStatus;->unmeteredConstraintSatisfied:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-boolean v7, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v4

    .local v4, "prevIsMetered":Z
    iget-boolean v5, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    if-ne v3, v5, :cond_1

    iget-boolean v5, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    if-eq v4, v5, :cond_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .end local v2    # "js":Lcom/android/server/job/controllers/JobStatus;
    .end local v3    # "prevIsConnected":Z
    .end local v4    # "prevIsMetered":Z
    :cond_2
    if-eqz v0, :cond_3

    iget-object v5, p0, Lcom/android/server/job/controllers/ConnectivityController;->mStateChangedListener:Lcom/android/server/job/StateChangedListener;

    invoke-interface {v5}, Lcom/android/server/job/StateChangedListener;->onControllerStateChanged()V

    :cond_3
    monitor-exit v6

    return-void

    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method


# virtual methods
.method public dumpControllerState(Ljava/io/PrintWriter;)V
    .locals 6
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    const-string v2, "Conn."

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "connected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " unmetered: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/job/controllers/JobStatus;

    .local v1, "js":Lcom/android/server/job/controllers/JobStatus;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": C="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/android/server/job/controllers/JobStatus;->hasConnectivityConstraint()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", UM="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/android/server/job/controllers/JobStatus;->hasUnmeteredConstraint()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .end local v1    # "js":Lcom/android/server/job/controllers/JobStatus;
    :cond_0
    return-void
.end method

.method public maybeStartTrackingJob(Lcom/android/server/job/controllers/JobStatus;)V
    .locals 3
    .param p1, "jobStatus"    # Lcom/android/server/job/controllers/JobStatus;

    .prologue
    invoke-virtual {p1}, Lcom/android/server/job/controllers/JobStatus;->hasConnectivityConstraint()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/server/job/controllers/JobStatus;->hasUnmeteredConstraint()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    monitor-enter v1

    :try_start_0
    iget-object v0, p1, Lcom/android/server/job/controllers/JobStatus;->connectivityConstraintSatisfied:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-boolean v2, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkConnected:Z

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p1, Lcom/android/server/job/controllers/JobStatus;->unmeteredConstraintSatisfied:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-boolean v2, p0, Lcom/android/server/job/controllers/ConnectivityController;->mNetworkUnmetered:Z

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public maybeStopTrackingJob(Lcom/android/server/job/controllers/JobStatus;)V
    .locals 2
    .param p1, "jobStatus"    # Lcom/android/server/job/controllers/JobStatus;

    .prologue
    invoke-virtual {p1}, Lcom/android/server/job/controllers/JobStatus;->hasConnectivityConstraint()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/server/job/controllers/JobStatus;->hasUnmeteredConstraint()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public declared-synchronized onNetworkActive()V
    .locals 4

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p0, Lcom/android/server/job/controllers/ConnectivityController;->mTrackedJobs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/job/controllers/JobStatus;

    .local v1, "js":Lcom/android/server/job/controllers/JobStatus;
    invoke-virtual {v1}, Lcom/android/server/job/controllers/JobStatus;->isReady()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/job/controllers/ConnectivityController;->mStateChangedListener:Lcom/android/server/job/StateChangedListener;

    invoke-interface {v2, v1}, Lcom/android/server/job/StateChangedListener;->onRunJobNow(Lcom/android/server/job/controllers/JobStatus;)V

    goto :goto_0

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "js":Lcom/android/server/job/controllers/JobStatus;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void
.end method
