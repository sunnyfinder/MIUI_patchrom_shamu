.class public Lcom/android/server/connectivity/Vpn;
.super Ljava/lang/Object;
.source "Vpn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;,
        Lcom/android/server/connectivity/Vpn$Connection;
    }
.end annotation


# static fields
.field private static final LOGD:Z = true

.field private static final NETWORKTYPE:Ljava/lang/String; = "VPN"

.field private static final TAG:Ljava/lang/String; = "Vpn"


# instance fields
.field private mConfig:Lcom/android/internal/net/VpnConfig;

.field private mConnection:Lcom/android/server/connectivity/Vpn$Connection;

.field private mContext:Landroid/content/Context;

.field private volatile mEnableTeardown:Z

.field private mInterface:Ljava/lang/String;

.field private mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

.field private final mLooper:Landroid/os/Looper;

.field private final mNetd:Landroid/os/INetworkManagementService;

.field private mNetworkAgent:Landroid/net/NetworkAgent;

.field private final mNetworkCapabilities:Landroid/net/NetworkCapabilities;

.field private mNetworkInfo:Landroid/net/NetworkInfo;

.field private mObserver:Landroid/net/INetworkManagementEventObserver;

.field private mOwnerUID:I

.field private mPackage:Ljava/lang/String;

.field private mStatusIntent:Landroid/app/PendingIntent;

.field private final mUserHandle:I

.field private mUserIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mVpnUsers:Ljava/util/List;
    .annotation build Lcom/android/internal/annotations/GuardedBy;
        value = "this"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/UidRange;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Landroid/content/Context;Landroid/os/INetworkManagementService;I)V
    .locals 7
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "netService"    # Landroid/os/INetworkManagementService;
    .param p4, "userHandle"    # I

    .prologue
    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/connectivity/Vpn;->mEnableTeardown:Z

    iput-object v4, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    iput-object v4, p0, Lcom/android/server/connectivity/Vpn;->mUserIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/android/server/connectivity/Vpn$3;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Vpn$3;-><init>(Lcom/android/server/connectivity/Vpn;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mObserver:Landroid/net/INetworkManagementEventObserver;

    iput-object p2, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/server/connectivity/Vpn;->mNetd:Landroid/os/INetworkManagementService;

    iput p4, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mLooper:Landroid/os/Looper;

    const-string v0, "[Legacy VPN]"

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    iget v1, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, v0, v1}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    :try_start_0
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mObserver:Landroid/net/INetworkManagementEventObserver;

    invoke-interface {p3, v0}, Landroid/os/INetworkManagementService;->registerObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-nez p4, :cond_0

    new-instance v0, Lcom/android/server/connectivity/Vpn$1;

    invoke-direct {v0, p0}, Lcom/android/server/connectivity/Vpn$1;-><init>(Lcom/android/server/connectivity/Vpn;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mUserIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .local v3, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.USER_ADDED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.USER_REMOVED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mUserIntentReceiver:Landroid/content/BroadcastReceiver;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .end local v3    # "intentFilter":Landroid/content/IntentFilter;
    :cond_0
    new-instance v0, Landroid/net/NetworkInfo;

    const/16 v1, 0x11

    const/4 v2, 0x0

    const-string v4, "VPN"

    const-string v5, ""

    invoke-direct {v0, v1, v2, v4, v5}, Landroid/net/NetworkInfo;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    new-instance v0, Landroid/net/NetworkCapabilities;

    invoke-direct {v0}, Landroid/net/NetworkCapabilities;-><init>()V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->addTransportType(I)Landroid/net/NetworkCapabilities;

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->removeCapability(I)Landroid/net/NetworkCapabilities;

    return-void

    :catch_0
    move-exception v6

    .local v6, "e":Landroid/os/RemoteException;
    const-string v0, "Vpn"

    const-string v1, "Problem registering observer"

    invoke-static {v0, v1, v6}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/server/connectivity/Vpn;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->onUserAdded(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/connectivity/Vpn;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->onUserRemoved(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/server/connectivity/Vpn;)Lcom/android/server/connectivity/Vpn$Connection;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/android/server/connectivity/Vpn;Lcom/android/server/connectivity/Vpn$Connection;)Lcom/android/server/connectivity/Vpn$Connection;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Lcom/android/server/connectivity/Vpn$Connection;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/server/connectivity/Vpn;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/server/connectivity/Vpn;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->agentDisconnect()V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/server/connectivity/Vpn;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-boolean v0, p0, Lcom/android/server/connectivity/Vpn;->mEnableTeardown:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/android/server/connectivity/Vpn;)Landroid/net/INetworkManagementEventObserver;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mObserver:Landroid/net/INetworkManagementEventObserver;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/server/connectivity/Vpn;Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Landroid/net/NetworkInfo$DetailedState;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/connectivity/Vpn;->updateState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/server/connectivity/Vpn;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->agentConnect()V

    return-void
.end method

.method static synthetic access$1900(Lcom/android/server/connectivity/Vpn;)Landroid/net/NetworkInfo;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/server/connectivity/Vpn;)Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    return-object v0
.end method

.method static synthetic access$402(Lcom/android/server/connectivity/Vpn;Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;)Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/server/connectivity/Vpn;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/server/connectivity/Vpn;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/server/connectivity/Vpn;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->jniCheck(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$702(Lcom/android/server/connectivity/Vpn;Landroid/app/PendingIntent;)Landroid/app/PendingIntent;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Landroid/app/PendingIntent;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mStatusIntent:Landroid/app/PendingIntent;

    return-object p1
.end method

.method static synthetic access$802(Lcom/android/server/connectivity/Vpn;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$900(Lcom/android/server/connectivity/Vpn;)Lcom/android/internal/net/VpnConfig;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    return-object v0
.end method

.method static synthetic access$902(Lcom/android/server/connectivity/Vpn;Lcom/android/internal/net/VpnConfig;)Lcom/android/internal/net/VpnConfig;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/connectivity/Vpn;
    .param p1, "x1"    # Lcom/android/internal/net/VpnConfig;

    .prologue
    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    return-object p1
.end method

.method private addVpnUserLocked(I)V
    .locals 8
    .param p1, "userHandle"    # I

    .prologue
    const/4 v7, -0x1

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    if-nez v5, :cond_0

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "VPN is not active"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v5, v5, Lcom/android/internal/net/VpnConfig;->allowedApplications:Ljava/util/List;

    if-eqz v5, :cond_5

    const/4 v1, -0x1

    .local v1, "start":I
    const/4 v2, -0x1

    .local v2, "stop":I
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v5, v5, Lcom/android/internal/net/VpnConfig;->allowedApplications:Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/android/server/connectivity/Vpn;->getAppsUids(Ljava/util/List;I)Ljava/util/SortedSet;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .local v3, "uid":I
    if-ne v1, v7, :cond_2

    move v1, v3

    :cond_1
    :goto_1
    move v2, v3

    goto :goto_0

    :cond_2
    add-int/lit8 v5, v2, 0x1

    if-eq v3, v5, :cond_1

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    new-instance v6, Landroid/net/UidRange;

    invoke-direct {v6, v1, v2}, Landroid/net/UidRange;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v3

    goto :goto_1

    .end local v3    # "uid":I
    :cond_3
    if-eq v1, v7, :cond_4

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    new-instance v6, Landroid/net/UidRange;

    invoke-direct {v6, v1, v2}, Landroid/net/UidRange;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "start":I
    .end local v2    # "stop":I
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->prepareStatusIntent()V

    return-void

    :cond_5
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v5, v5, Lcom/android/internal/net/VpnConfig;->disallowedApplications:Ljava/util/List;

    if-eqz v5, :cond_8

    invoke-static {p1}, Landroid/net/UidRange;->createForUser(I)Landroid/net/UidRange;

    move-result-object v4

    .local v4, "userRange":Landroid/net/UidRange;
    iget v1, v4, Landroid/net/UidRange;->start:I

    .restart local v1    # "start":I
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v5, v5, Lcom/android/internal/net/VpnConfig;->disallowedApplications:Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/android/server/connectivity/Vpn;->getAppsUids(Ljava/util/List;I)Ljava/util/SortedSet;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .restart local v3    # "uid":I
    if-ne v3, v1, :cond_6

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    new-instance v6, Landroid/net/UidRange;

    add-int/lit8 v7, v3, -0x1

    invoke-direct {v6, v1, v7}, Landroid/net/UidRange;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v3, 0x1

    goto :goto_3

    .end local v3    # "uid":I
    :cond_7
    iget v5, v4, Landroid/net/UidRange;->stop:I

    if-gt v1, v5, :cond_4

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    new-instance v6, Landroid/net/UidRange;

    iget v7, v4, Landroid/net/UidRange;->stop:I

    invoke-direct {v6, v1, v7}, Landroid/net/UidRange;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "start":I
    .end local v4    # "userRange":Landroid/net/UidRange;
    :cond_8
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-static {p1}, Landroid/net/UidRange;->createForUser(I)Landroid/net/UidRange;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private agentConnect()V
    .locals 15

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0xc

    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->makeLinkProperties()Landroid/net/LinkProperties;

    move-result-object v7

    .local v7, "lp":Landroid/net/LinkProperties;
    invoke-virtual {v7}, Landroid/net/LinkProperties;->hasIPv4DefaultRoute()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v7}, Landroid/net/LinkProperties;->hasIPv6DefaultRoute()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->addCapability(I)Landroid/net/NetworkCapabilities;

    :goto_0
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/NetworkInfo;->setIsAvailable(Z)V

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v0, v1, v2, v2}, Landroid/net/NetworkInfo;->setDetailedState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v9, Landroid/net/NetworkMisc;

    invoke-direct {v9}, Landroid/net/NetworkMisc;-><init>()V

    .local v9, "networkMisc":Landroid/net/NetworkMisc;
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-boolean v0, v0, Lcom/android/internal/net/VpnConfig;->allowBypass:Z

    iput-boolean v0, v9, Landroid/net/NetworkMisc;->allowBypass:Z

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v12

    .local v12, "token":J
    :try_start_0
    new-instance v0, Lcom/android/server/connectivity/Vpn$2;

    iget-object v2, p0, Lcom/android/server/connectivity/Vpn;->mLooper:Landroid/os/Looper;

    iget-object v3, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    const-string v4, "VPN"

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    iget-object v6, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v8, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v9}, Lcom/android/server/connectivity/Vpn$2;-><init>(Lcom/android/server/connectivity/Vpn;Landroid/os/Looper;Landroid/content/Context;Ljava/lang/String;Landroid/net/NetworkInfo;Landroid/net/NetworkCapabilities;Landroid/net/LinkProperties;ILandroid/net/NetworkMisc;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    iget v0, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, v0}, Lcom/android/server/connectivity/Vpn;->addVpnUserLocked(I)V

    iget v0, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    if-nez v0, :cond_3

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v12

    :try_start_1
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/UserManager;->getUsers()Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v14

    .local v14, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/UserInfo;

    .local v11, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v11}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, v11, Landroid/content/pm/UserInfo;->id:I

    invoke-direct {p0, v0}, Lcom/android/server/connectivity/Vpn;->addVpnUserLocked(I)V

    goto :goto_1

    .end local v9    # "networkMisc":Landroid/net/NetworkMisc;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "user":Landroid/content/pm/UserInfo;
    .end local v12    # "token":J
    .end local v14    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_2
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->removeCapability(I)Landroid/net/NetworkCapabilities;

    goto :goto_0

    .restart local v9    # "networkMisc":Landroid/net/NetworkMisc;
    .restart local v12    # "token":J
    :catchall_0
    move-exception v0

    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0

    :catchall_1
    move-exception v0

    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0

    :cond_3
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    iget-object v2, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Landroid/net/UidRange;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/UidRange;

    invoke-virtual {v1, v0}, Landroid/net/NetworkAgent;->addUidRanges([Landroid/net/UidRange;)V

    return-void
.end method

.method private agentDisconnect()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    invoke-direct {p0, v0, v1}, Lcom/android/server/connectivity/Vpn;->agentDisconnect(Landroid/net/NetworkInfo;Landroid/net/NetworkAgent;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    :cond_0
    return-void
.end method

.method private agentDisconnect(Landroid/net/NetworkAgent;)V
    .locals 2
    .param p1, "networkAgent"    # Landroid/net/NetworkAgent;

    .prologue
    new-instance v0, Landroid/net/NetworkInfo;

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    invoke-direct {v0, v1}, Landroid/net/NetworkInfo;-><init>(Landroid/net/NetworkInfo;)V

    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    invoke-direct {p0, v0, p1}, Lcom/android/server/connectivity/Vpn;->agentDisconnect(Landroid/net/NetworkInfo;Landroid/net/NetworkAgent;)V

    return-void
.end method

.method private agentDisconnect(Landroid/net/NetworkInfo;Landroid/net/NetworkAgent;)V
    .locals 2
    .param p1, "networkInfo"    # Landroid/net/NetworkInfo;
    .param p2, "networkAgent"    # Landroid/net/NetworkAgent;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/net/NetworkInfo;->setIsAvailable(Z)V

    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->DISCONNECTED:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {p1, v0, v1, v1}, Landroid/net/NetworkInfo;->setDetailedState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    invoke-virtual {p2, p1}, Landroid/net/NetworkAgent;->sendNetworkInfo(Landroid/net/NetworkInfo;)V

    :cond_0
    return-void
.end method

.method private enforceControlPermission()V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.CONTROL_VPN"

    const-string v2, "Unauthorized Caller"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingPermission(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static findIPv4DefaultRoute(Landroid/net/LinkProperties;)Landroid/net/RouteInfo;
    .locals 4
    .param p0, "prop"    # Landroid/net/LinkProperties;

    .prologue
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getAllRoutes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/RouteInfo;

    .local v1, "route":Landroid/net/RouteInfo;
    invoke-virtual {v1}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v2

    instance-of v2, v2, Ljava/net/Inet4Address;

    if-eqz v2, :cond_0

    return-object v1

    .end local v1    # "route":Landroid/net/RouteInfo;
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to find IPv4 default gateway"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getAppUid(Ljava/lang/String;I)I
    .locals 4
    .param p1, "app"    # Ljava/lang/String;
    .param p2, "userHandle"    # I

    .prologue
    const-string v3, "[Legacy VPN]"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    :goto_0
    return v2

    :cond_0
    iget-object v3, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .local v1, "pm":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {v1, p1, p2}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .local v2, "result":I
    goto :goto_0

    .end local v2    # "result":I
    :catch_0
    move-exception v0

    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, -0x1

    .restart local v2    # "result":I
    goto :goto_0
.end method

.method private getAppsUids(Ljava/util/List;I)Ljava/util/SortedSet;
    .locals 5
    .param p2, "userHandle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/TreeSet;

    invoke-direct {v3}, Ljava/util/TreeSet;-><init>()V

    .local v3, "uids":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .local v0, "app":Ljava/lang/String;
    invoke-direct {p0, v0, p2}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v2

    .local v2, "uid":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v0    # "app":Ljava/lang/String;
    .end local v2    # "uid":I
    :cond_1
    return-object v3
.end method

.method private isCallerEstablishedOwnerLocked()Z
    .locals 2

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isRunningLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    iget v1, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isRunningLocked()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isVpnUserPreConsented(Ljava/lang/String;)Z
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    const-string v2, "appops"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .local v0, "appOps":Landroid/app/AppOpsManager;
    const/16 v1, 0x2f

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-virtual {v0, v1, v2, p1}, Landroid/app/AppOpsManager;->noteOpNoThrow(IILjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private native jniAddAddress(Ljava/lang/String;Ljava/lang/String;I)Z
.end method

.method private native jniCheck(Ljava/lang/String;)I
.end method

.method private native jniCreate(I)I
.end method

.method private native jniDelAddress(Ljava/lang/String;Ljava/lang/String;I)Z
.end method

.method private native jniGetName(I)Ljava/lang/String;
.end method

.method private native jniReset(Ljava/lang/String;)V
.end method

.method private native jniSetAddresses(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private makeLinkProperties()Landroid/net/LinkProperties;
    .locals 14

    .prologue
    const/4 v13, 0x7

    const/4 v12, 0x0

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-boolean v1, v9, Lcom/android/internal/net/VpnConfig;->allowIPv4:Z

    .local v1, "allowIPv4":Z
    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-boolean v2, v9, Lcom/android/internal/net/VpnConfig;->allowIPv6:Z

    .local v2, "allowIPv6":Z
    new-instance v7, Landroid/net/LinkProperties;

    invoke-direct {v7}, Landroid/net/LinkProperties;-><init>()V

    .local v7, "lp":Landroid/net/LinkProperties;
    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    invoke-virtual {v7, v9}, Landroid/net/LinkProperties;->setInterfaceName(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->addresses:Ljava/util/List;

    if-eqz v9, :cond_0

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->addresses:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/LinkAddress;

    .local v0, "address":Landroid/net/LinkAddress;
    invoke-virtual {v7, v0}, Landroid/net/LinkProperties;->addLinkAddress(Landroid/net/LinkAddress;)Z

    invoke-virtual {v0}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v9

    instance-of v9, v9, Ljava/net/Inet4Address;

    or-int/2addr v1, v9

    invoke-virtual {v0}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v9

    instance-of v9, v9, Ljava/net/Inet6Address;

    or-int/2addr v2, v9

    goto :goto_0

    .end local v0    # "address":Landroid/net/LinkAddress;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->routes:Ljava/util/List;

    if-eqz v9, :cond_1

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->routes:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/RouteInfo;

    .local v8, "route":Landroid/net/RouteInfo;
    invoke-virtual {v7, v8}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    invoke-virtual {v8}, Landroid/net/RouteInfo;->getDestination()Landroid/net/IpPrefix;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/IpPrefix;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .local v0, "address":Ljava/net/InetAddress;
    instance-of v9, v0, Ljava/net/Inet4Address;

    or-int/2addr v1, v9

    instance-of v9, v0, Ljava/net/Inet6Address;

    or-int/2addr v2, v9

    goto :goto_1

    .end local v0    # "address":Ljava/net/InetAddress;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "route":Landroid/net/RouteInfo;
    :cond_1
    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->dnsServers:Ljava/util/List;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->dnsServers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .local v4, "dnsServer":Ljava/lang/String;
    invoke-static {v4}, Ljava/net/InetAddress;->parseNumericAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .restart local v0    # "address":Ljava/net/InetAddress;
    invoke-virtual {v7, v0}, Landroid/net/LinkProperties;->addDnsServer(Ljava/net/InetAddress;)Z

    instance-of v9, v0, Ljava/net/Inet4Address;

    or-int/2addr v1, v9

    instance-of v9, v0, Ljava/net/Inet6Address;

    or-int/2addr v2, v9

    goto :goto_2

    .end local v0    # "address":Ljava/net/InetAddress;
    .end local v4    # "dnsServer":Ljava/lang/String;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_2
    if-nez v1, :cond_3

    new-instance v9, Landroid/net/RouteInfo;

    new-instance v10, Landroid/net/IpPrefix;

    sget-object v11, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    invoke-direct {v10, v11, v12}, Landroid/net/IpPrefix;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {v9, v10, v13}, Landroid/net/RouteInfo;-><init>(Landroid/net/IpPrefix;I)V

    invoke-virtual {v7, v9}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    :cond_3
    if-nez v2, :cond_4

    new-instance v9, Landroid/net/RouteInfo;

    new-instance v10, Landroid/net/IpPrefix;

    sget-object v11, Ljava/net/Inet6Address;->ANY:Ljava/net/InetAddress;

    invoke-direct {v10, v11, v12}, Landroid/net/IpPrefix;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {v9, v10, v13}, Landroid/net/RouteInfo;-><init>(Landroid/net/IpPrefix;I)V

    invoke-virtual {v7, v9}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)Z

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .local v3, "buffer":Ljava/lang/StringBuilder;
    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->searchDomains:Ljava/util/List;

    if-eqz v9, :cond_5

    iget-object v9, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v9, v9, Lcom/android/internal/net/VpnConfig;->searchDomains:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .local v5, "domain":Ljava/lang/String;
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0x20

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .end local v5    # "domain":Ljava/lang/String;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/net/LinkProperties;->setDomains(Ljava/lang/String;)V

    return-object v7
.end method

.method private onUserAdded(I)V
    .locals 6
    .param p1, "userHandle"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v1

    .local v1, "mgr":Landroid/os/UserManager;
    invoke-virtual {v1, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v3

    .local v3, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v3}, Landroid/content/pm/UserInfo;->isRestricted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_0

    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->addVpnUserLocked(I)V

    iget-object v4, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    if-eqz v4, :cond_0

    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->uidRangesForUser(I)Ljava/util/List;

    move-result-object v2

    .local v2, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/net/UidRange;>;"
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Landroid/net/UidRange;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/net/UidRange;

    invoke-virtual {v5, v4}, Landroid/net/NetworkAgent;->addUidRanges([Landroid/net/UidRange;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v2    # "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/net/UidRange;>;"
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Vpn"

    const-string v5, "Failed to add restricted user to owner"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "mgr":Landroid/os/UserManager;
    .end local v3    # "user":Landroid/content/pm/UserInfo;
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4
.end method

.method private onUserRemoved(I)V
    .locals 5
    .param p1, "userHandle"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v1

    .local v1, "mgr":Landroid/os/UserManager;
    invoke-virtual {v1, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v2

    .local v2, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v2}, Landroid/content/pm/UserInfo;->isRestricted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->removeVpnUserLocked(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    :try_start_2
    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Vpn"

    const-string v4, "Failed to remove restricted user to owner"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "mgr":Landroid/os/UserManager;
    .end local v2    # "user":Landroid/content/pm/UserInfo;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method private prepareInternal(Ljava/lang/String;)V
    .locals 8
    .param p1, "newPackage"    # Ljava/lang/String;

    .prologue
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .local v2, "token":J
    :try_start_0
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mStatusIntent:Landroid/app/PendingIntent;

    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->agentDisconnect()V

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/server/connectivity/Vpn;->jniReset(Ljava/lang/String;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    :cond_0
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    :try_start_1
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    # getter for: Lcom/android/server/connectivity/Vpn$Connection;->mService:Landroid/os/IBinder;
    invoke-static {v1}, Lcom/android/server/connectivity/Vpn$Connection;->access$200(Lcom/android/server/connectivity/Vpn$Connection;)Landroid/os/IBinder;

    move-result-object v1

    const v4, 0xffffff

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-interface {v1, v4, v5, v6, v7}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    :try_start_2
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    invoke-virtual {v1, v4}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_1
    :try_start_3
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetd:Landroid/os/INetworkManagementService;

    iget v4, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    invoke-interface {v1, v4}, Landroid/os/INetworkManagementService;->denyProtect(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_2
    :try_start_4
    const-string v1, "Vpn"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Switched from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    iget v1, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, p1, v1}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetd:Landroid/os/INetworkManagementService;

    iget v4, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    invoke-interface {v1, v4}, Landroid/os/INetworkManagementService;->allowProtect(I)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_3
    const/4 v1, 0x0

    :try_start_6
    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->IDLE:Landroid/net/NetworkInfo$DetailedState;

    const-string v4, "prepare"

    invoke-direct {p0, v1, v4}, Lcom/android/server/connectivity/Vpn;->updateState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :cond_2
    :try_start_7
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    invoke-virtual {v1}, Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;->exit()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v1

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_8
    const-string v1, "Vpn"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to disallow UID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to call protect() "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "Vpn"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to allow UID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to call protect() "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_3

    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    goto/16 :goto_0
.end method

.method private prepareStatusIntent()V
    .locals 3

    .prologue
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .local v0, "token":J
    :try_start_0
    iget-object v2, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/internal/net/VpnConfig;->getIntentForStatusPanel(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/connectivity/Vpn;->mStatusIntent:Landroid/app/PendingIntent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
.end method

.method private removeVpnUserLocked(I)V
    .locals 3
    .param p1, "userHandle"    # I

    .prologue
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "VPN is not active"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->uidRangesForUser(I)Ljava/util/List;

    move-result-object v0

    .local v0, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/net/UidRange;>;"
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Landroid/net/UidRange;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/net/UidRange;

    invoke-virtual {v2, v1}, Landroid/net/NetworkAgent;->removeUidRanges([Landroid/net/UidRange;)V

    :cond_1
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/connectivity/Vpn;->mStatusIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method private declared-synchronized startLegacyVpn(Lcom/android/internal/net/VpnConfig;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .param p1, "config"    # Lcom/android/internal/net/VpnConfig;
    .param p2, "racoon"    # [Ljava/lang/String;
    .param p3, "mtpd"    # [Ljava/lang/String;

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/server/connectivity/Vpn;->stopLegacyVpnPrivileged()V

    const-string v0, "[Legacy VPN]"

    invoke-direct {p0, v0}, Lcom/android/server/connectivity/Vpn;->prepareInternal(Ljava/lang/String;)V

    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    const-string v1, "startLegacyVpn"

    invoke-direct {p0, v0, v1}, Lcom/android/server/connectivity/Vpn;->updateState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V

    new-instance v0, Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;-><init>(Lcom/android/server/connectivity/Vpn;Lcom/android/internal/net/VpnConfig;[Ljava/lang/String;[Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    invoke-virtual {v0}, Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private uidRangesForUser(I)Ljava/util/List;
    .locals 6
    .param p1, "userHandle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/net/UidRange;",
            ">;"
        }
    .end annotation

    .prologue
    invoke-static {p1}, Landroid/net/UidRange;->createForUser(I)Landroid/net/UidRange;

    move-result-object v3

    .local v3, "userRange":Landroid/net/UidRange;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .local v2, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/net/UidRange;>;"
    iget-object v4, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/UidRange;

    .local v1, "range":Landroid/net/UidRange;
    iget v4, v1, Landroid/net/UidRange;->start:I

    iget v5, v3, Landroid/net/UidRange;->start:I

    if-lt v4, v5, :cond_0

    iget v4, v1, Landroid/net/UidRange;->stop:I

    iget v5, v3, Landroid/net/UidRange;->stop:I

    if-gt v4, v5, :cond_0

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v1    # "range":Landroid/net/UidRange;
    :cond_1
    return-object v2
.end method

.method private updateState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V
    .locals 3
    .param p1, "detailedState"    # Landroid/net/NetworkInfo$DetailedState;
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    const-string v0, "Vpn"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setting state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", reason="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroid/net/NetworkInfo;->setDetailedState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v0, v1}, Landroid/net/NetworkAgent;->sendNetworkInfo(Landroid/net/NetworkInfo;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addAddress(Ljava/lang/String;I)Z
    .locals 3
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefixLength"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isCallerEstablishedOwnerLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    invoke-direct {p0, v1, p1, p2}, Lcom/android/server/connectivity/Vpn;->jniAddAddress(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v0

    .local v0, "success":Z
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->makeLinkProperties()Landroid/net/LinkProperties;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/NetworkAgent;->sendLinkProperties(Landroid/net/LinkProperties;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "success":Z
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized appliesToUid(I)Z
    .locals 4
    .param p1, "uid"    # I

    .prologue
    const/4 v2, 0x0

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isRunningLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/UidRange;

    .local v1, "uidRange":Landroid/net/UidRange;
    iget v3, v1, Landroid/net/UidRange;->start:I

    if-gt v3, p1, :cond_2

    iget v3, v1, Landroid/net/UidRange;->stop:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gt p1, v3, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "uidRange":Landroid/net/UidRange;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized establish(Lcom/android/internal/net/VpnConfig;)Landroid/os/ParcelFileDescriptor;
    .locals 26
    .param p1, "config"    # Lcom/android/internal/net/VpnConfig;

    .prologue
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v12

    .local v12, "mgr":Landroid/os/UserManager;
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    move/from16 v23, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_0

    const/16 v20, 0x0

    :goto_0
    monitor-exit p0

    return-object v20

    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/android/server/connectivity/Vpn;->isVpnUserPreConsented(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_1

    const/16 v20, 0x0

    goto :goto_0

    :cond_1
    new-instance v10, Landroid/content/Intent;

    const-string v22, "android.net.VpnService"

    move-object/from16 v0, v22

    invoke-direct {v10, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v10, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v18

    .local v18, "token":J
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    move/from16 v22, v0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v21

    .local v21, "user":Landroid/content/pm/UserInfo;
    invoke-virtual/range {v21 .. v21}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v22

    if-nez v22, :cond_2

    const-string v22, "no_config_vpn"

    new-instance v23, Landroid/os/UserHandle;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    move/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/os/UserHandle;-><init>(I)V

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v12, v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v22

    if-eqz v22, :cond_3

    :cond_2
    new-instance v22, Ljava/lang/SecurityException;

    const-string v23, "Restricted users cannot establish VPNs"

    invoke-direct/range {v22 .. v23}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v21    # "user":Landroid/content/pm/UserInfo;
    :catch_0
    move-exception v7

    .local v7, "e":Landroid/os/RemoteException;
    :try_start_3
    new-instance v22, Ljava/lang/SecurityException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Cannot find "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v7    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v22

    :try_start_4
    invoke-static/range {v18 .. v19}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v22
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .end local v10    # "intent":Landroid/content/Intent;
    .end local v12    # "mgr":Landroid/os/UserManager;
    .end local v18    # "token":J
    :catchall_1
    move-exception v22

    monitor-exit p0

    throw v22

    .restart local v10    # "intent":Landroid/content/Intent;
    .restart local v12    # "mgr":Landroid/os/UserManager;
    .restart local v18    # "token":J
    .restart local v21    # "user":Landroid/content/pm/UserInfo;
    :cond_3
    :try_start_5
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v22

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    move/from16 v25, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-interface {v0, v10, v1, v2, v3}, Landroid/content/pm/IPackageManager;->resolveService(Landroid/content/Intent;Ljava/lang/String;II)Landroid/content/pm/ResolveInfo;

    move-result-object v9

    .local v9, "info":Landroid/content/pm/ResolveInfo;
    if-nez v9, :cond_4

    new-instance v22, Ljava/lang/SecurityException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Cannot find "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v22

    :cond_4
    const-string v22, "android.permission.BIND_VPN_SERVICE"

    iget-object v0, v9, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->permission:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    new-instance v22, Ljava/lang/SecurityException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " does not require "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "android.permission.BIND_VPN_SERVICE"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_5
    :try_start_6
    invoke-static/range {v18 .. v19}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    .local v13, "oldConfig":Lcom/android/internal/net/VpnConfig;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    .local v15, "oldInterface":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    .local v14, "oldConnection":Lcom/android/server/connectivity/Vpn$Connection;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    move-object/from16 v16, v0

    .local v16, "oldNetworkAgent":Landroid/net/NetworkAgent;
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    move-object/from16 v17, v0

    .local v17, "oldUsers":Ljava/util/List;, "Ljava/util/List<Landroid/net/UidRange;>;"
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/net/VpnConfig;->mtu:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/android/server/connectivity/Vpn;->jniCreate(I)I

    move-result v22

    invoke-static/range {v22 .. v22}, Landroid/os/ParcelFileDescriptor;->adoptFd(I)Landroid/os/ParcelFileDescriptor;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-result-object v20

    .local v20, "tun":Landroid/os/ParcelFileDescriptor;
    :try_start_7
    sget-object v22, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    const-string v23, "establish"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/android/server/connectivity/Vpn;->updateState(Landroid/net/NetworkInfo$DetailedState;Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/android/server/connectivity/Vpn;->jniGetName(I)Ljava/lang/String;

    move-result-object v11

    .local v11, "interfaze":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .local v5, "builder":Ljava/lang/StringBuilder;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->addresses:Ljava/util/List;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/LinkAddress;

    .local v4, "address":Landroid/net/LinkAddress;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, " "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    .end local v4    # "address":Landroid/net/LinkAddress;
    .end local v5    # "builder":Ljava/lang/StringBuilder;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v11    # "interfaze":Ljava/lang/String;
    :catch_1
    move-exception v7

    .local v7, "e":Ljava/lang/RuntimeException;
    :try_start_8
    invoke-static/range {v20 .. v20}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/connectivity/Vpn;->agentDisconnect()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    throw v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .end local v7    # "e":Ljava/lang/RuntimeException;
    .restart local v5    # "builder":Ljava/lang/StringBuilder;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v11    # "interfaze":Ljava/lang/String;
    :cond_6
    :try_start_9
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v11, v1}, Lcom/android/server/connectivity/Vpn;->jniSetAddresses(Ljava/lang/String;Ljava/lang/String;)I

    move-result v22

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_7

    new-instance v22, Ljava/lang/IllegalArgumentException;

    const-string v23, "At least one address must be specified"

    invoke-direct/range {v22 .. v23}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v22

    :cond_7
    new-instance v6, Lcom/android/server/connectivity/Vpn$Connection;

    const/16 v22, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v6, v0, v1}, Lcom/android/server/connectivity/Vpn$Connection;-><init>(Lcom/android/server/connectivity/Vpn;Lcom/android/server/connectivity/Vpn$1;)V

    .local v6, "connection":Lcom/android/server/connectivity/Vpn$Connection;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    const v23, 0x4000001

    new-instance v24, Landroid/os/UserHandle;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    move/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Landroid/os/UserHandle;-><init>(I)V

    move-object/from16 v0, v22

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v10, v6, v1, v2}, Landroid/content/Context;->bindServiceAsUser(Landroid/content/Intent;Landroid/content/ServiceConnection;ILandroid/os/UserHandle;)Z

    move-result v22

    if-nez v22, :cond_8

    new-instance v22, Ljava/lang/IllegalStateException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Cannot bind "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v22

    :cond_8
    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/android/server/connectivity/Vpn;->mConnection:Lcom/android/server/connectivity/Vpn$Connection;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mPackage:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/android/internal/net/VpnConfig;->interfaze:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p1

    iput-wide v0, v2, Lcom/android/internal/net/VpnConfig;->startTime:J

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/connectivity/Vpn;->mVpnUsers:Ljava/util/List;

    invoke-direct/range {p0 .. p0}, Lcom/android/server/connectivity/Vpn;->agentConnect()V

    if-eqz v14, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/android/server/connectivity/Vpn;->agentDisconnect(Landroid/net/NetworkAgent;)V

    if-eqz v15, :cond_a

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_a

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/server/connectivity/Vpn;->jniReset(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :cond_a
    :try_start_a
    invoke-virtual/range {v20 .. v20}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v22

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/android/internal/net/VpnConfig;->blocking:Z

    move/from16 v23, v0

    invoke-static/range {v22 .. v23}, Llibcore/io/IoUtils;->setBlocking(Ljava/io/FileDescriptor;Z)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    const-string v22, "Vpn"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Established by "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " on "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_0

    :catch_2
    move-exception v7

    .local v7, "e":Ljava/io/IOException;
    :try_start_c
    new-instance v22, Ljava/lang/IllegalStateException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Cannot set tunnel\'s fd as blocking="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/android/internal/net/VpnConfig;->blocking:Z

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v22
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_1
.end method

.method public getLegacyVpnConfig()Lcom/android/internal/net/VpnConfig;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized getLegacyVpnInfo()Lcom/android/internal/net/LegacyVpnInfo;
    .locals 1

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->enforceControlPermission()V

    invoke-virtual {p0}, Lcom/android/server/connectivity/Vpn;->getLegacyVpnInfoPrivileged()Lcom/android/internal/net/LegacyVpnInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLegacyVpnInfoPrivileged()Lcom/android/internal/net/LegacyVpnInfo;
    .locals 2

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_1
    new-instance v0, Lcom/android/internal/net/LegacyVpnInfo;

    invoke-direct {v0}, Lcom/android/internal/net/LegacyVpnInfo;-><init>()V

    .local v0, "info":Lcom/android/internal/net/LegacyVpnInfo;
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v1, v1, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/internal/net/LegacyVpnInfo;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    invoke-static {v1}, Lcom/android/internal/net/LegacyVpnInfo;->stateFromNetworkInfo(Landroid/net/NetworkInfo;)I

    move-result v1

    iput v1, v0, Lcom/android/internal/net/LegacyVpnInfo;->state:I

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mStatusIntent:Landroid/app/PendingIntent;

    iput-object v1, v0, Lcom/android/internal/net/LegacyVpnInfo;->intent:Landroid/app/PendingIntent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "info":Lcom/android/internal/net/LegacyVpnInfo;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getNetId()I
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    iget v0, v0, Landroid/net/NetworkAgent;->netId:I

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNetworkInfo()Landroid/net/NetworkInfo;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mNetworkInfo:Landroid/net/NetworkInfo;

    return-object v0
.end method

.method public declared-synchronized getUnderlyingNetworks()[Landroid/net/Network;
    .locals 1

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isRunningLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v0, v0, Lcom/android/internal/net/VpnConfig;->underlyingNetworks:[Landroid/net/Network;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getVpnConfig()Lcom/android/internal/net/VpnConfig;
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->enforceControlPermission()V

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    return-object v0
.end method

.method public declared-synchronized getVpnInfo()Lcom/android/internal/net/VpnInfo;
    .locals 2

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isRunningLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/android/internal/net/VpnInfo;

    invoke-direct {v0}, Lcom/android/internal/net/VpnInfo;-><init>()V

    .local v0, "info":Lcom/android/internal/net/VpnInfo;
    iget v1, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    iput v1, v0, Lcom/android/internal/net/VpnInfo;->ownerUid:I

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/internal/net/VpnInfo;->vpnIface:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "info":Lcom/android/internal/net/VpnInfo;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized interfaceStatusChanged(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "iface"    # Ljava/lang/String;
    .param p2, "up"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mObserver:Landroid/net/INetworkManagementEventObserver;

    invoke-interface {v0, p1, p2}, Landroid/net/INetworkManagementEventObserver;->interfaceStatusChanged(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized prepare(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "oldPackage"    # Ljava/lang/String;
    .param p2, "newPackage"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    monitor-enter p0

    if-eqz p1, :cond_3

    :try_start_0
    iget v2, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, p1, v2}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v2

    iget v3, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    if-eq v2, v3, :cond_2

    const-string v2, "[Legacy VPN]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->isVpnUserPreConsented(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->prepareInternal(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    :try_start_1
    const-string v2, "[Legacy VPN]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-direct {p0, p1}, Lcom/android/server/connectivity/Vpn;->isVpnUserPreConsented(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v0, "[Legacy VPN]"

    invoke-direct {p0, v0}, Lcom/android/server/connectivity/Vpn;->prepareInternal(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_0

    const-string v1, "[Legacy VPN]"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget v1, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, p2, v1}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v1

    iget v2, p0, Lcom/android/server/connectivity/Vpn;->mOwnerUID:I

    if-eq v1, v2, :cond_0

    :cond_4
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->enforceControlPermission()V

    invoke-direct {p0, p2}, Lcom/android/server/connectivity/Vpn;->prepareInternal(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeAddress(Ljava/lang/String;I)Z
    .locals 3
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefixLength"    # I

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isCallerEstablishedOwnerLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mInterface:Ljava/lang/String;

    invoke-direct {p0, v1, p1, p2}, Lcom/android/server/connectivity/Vpn;->jniDelAddress(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v0

    .local v0, "success":Z
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mNetworkAgent:Landroid/net/NetworkAgent;

    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->makeLinkProperties()Landroid/net/LinkProperties;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/NetworkAgent;->sendLinkProperties(Landroid/net/LinkProperties;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "success":Z
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setEnableTeardown(Z)V
    .locals 0
    .param p1, "enableTeardown"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/server/connectivity/Vpn;->mEnableTeardown:Z

    return-void
.end method

.method public setPackageAuthorization(Ljava/lang/String;Z)V
    .locals 8
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "authorized"    # Z

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->enforceControlPermission()V

    iget v5, p0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-direct {p0, p1, v5}, Lcom/android/server/connectivity/Vpn;->getAppUid(Ljava/lang/String;I)I

    move-result v4

    .local v4, "uid":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    const-string v5, "[Legacy VPN]"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .local v2, "token":J
    :try_start_0
    iget-object v5, p0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    const-string v6, "appops"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .local v0, "appOps":Landroid/app/AppOpsManager;
    const/16 v6, 0x2f

    if-eqz p2, :cond_2

    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v0, v6, v4, p1, v5}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    :cond_2
    const/4 v5, 0x1

    goto :goto_1

    .end local v0    # "appOps":Landroid/app/AppOpsManager;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v5, "Vpn"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to set app ops for package "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uid "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public declared-synchronized setUnderlyingNetworks([Landroid/net/Network;)Z
    .locals 4
    .param p1, "networks"    # [Landroid/net/Network;

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->isCallerEstablishedOwnerLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    if-nez p1, :cond_2

    :try_start_1
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/android/internal/net/VpnConfig;->underlyingNetworks:[Landroid/net/Network;

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    array-length v2, p1

    new-array v2, v2, [Landroid/net/Network;

    iput-object v2, v1, Lcom/android/internal/net/VpnConfig;->underlyingNetworks:[Landroid/net/Network;

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    aget-object v1, p1, v0

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v1, v1, Lcom/android/internal/net/VpnConfig;->underlyingNetworks:[Landroid/net/Network;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/android/server/connectivity/Vpn;->mConfig:Lcom/android/internal/net/VpnConfig;

    iget-object v1, v1, Lcom/android/internal/net/VpnConfig;->underlyingNetworks:[Landroid/net/Network;

    new-instance v2, Landroid/net/Network;

    aget-object v3, p1, v0

    iget v3, v3, Landroid/net/Network;->netId:I

    invoke-direct {v2, v3}, Landroid/net/Network;-><init>(I)V

    aput-object v2, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public startLegacyVpn(Lcom/android/internal/net/VpnProfile;Landroid/security/KeyStore;Landroid/net/LinkProperties;)V
    .locals 3
    .param p1, "profile"    # Lcom/android/internal/net/VpnProfile;
    .param p2, "keyStore"    # Landroid/security/KeyStore;
    .param p3, "egress"    # Landroid/net/LinkProperties;

    .prologue
    invoke-direct {p0}, Lcom/android/server/connectivity/Vpn;->enforceControlPermission()V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .local v0, "token":J
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/connectivity/Vpn;->startLegacyVpnPrivileged(Lcom/android/internal/net/VpnProfile;Landroid/security/KeyStore;Landroid/net/LinkProperties;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
.end method

.method public startLegacyVpnPrivileged(Lcom/android/internal/net/VpnProfile;Landroid/security/KeyStore;Landroid/net/LinkProperties;)V
    .locals 17
    .param p1, "profile"    # Lcom/android/internal/net/VpnProfile;
    .param p2, "keyStore"    # Landroid/security/KeyStore;
    .param p3, "egress"    # Landroid/net/LinkProperties;

    .prologue
    invoke-virtual/range {p2 .. p2}, Landroid/security/KeyStore;->isUnlocked()Z

    move-result v14

    if-nez v14, :cond_0

    new-instance v14, Ljava/lang/IllegalStateException;

    const-string v15, "KeyStore isn\'t unlocked"

    invoke-direct {v14, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14

    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/connectivity/Vpn;->mContext:Landroid/content/Context;

    invoke-static {v14}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v6

    .local v6, "mgr":Landroid/os/UserManager;
    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    invoke-virtual {v6, v14}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v11

    .local v11, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v11}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v14

    if-nez v14, :cond_1

    const-string v14, "no_config_vpn"

    new-instance v15, Landroid/os/UserHandle;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/connectivity/Vpn;->mUserHandle:I

    move/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v6, v14, v15}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v14

    if-eqz v14, :cond_2

    :cond_1
    new-instance v14, Ljava/lang/SecurityException;

    const-string v15, "Restricted users cannot establish VPNs"

    invoke-direct {v14, v15}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v14

    :cond_2
    invoke-static/range {p3 .. p3}, Lcom/android/server/connectivity/Vpn;->findIPv4DefaultRoute(Landroid/net/LinkProperties;)Landroid/net/RouteInfo;

    move-result-object v5

    .local v5, "ipv4DefaultRoute":Landroid/net/RouteInfo;
    invoke-virtual {v5}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v14

    invoke-virtual {v14}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    .local v3, "gateway":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/net/RouteInfo;->getInterface()Ljava/lang/String;

    move-result-object v4

    .local v4, "iface":Ljava/lang/String;
    const-string v8, ""

    .local v8, "privateKey":Ljava/lang/String;
    const-string v12, ""

    .local v12, "userCert":Ljava/lang/String;
    const-string v1, ""

    .local v1, "caCert":Ljava/lang/String;
    const-string v10, ""

    .local v10, "serverCert":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->ipsecUserCert:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_3

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "USRPKEY_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecUserCert:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "USRCERT_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecUserCert:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/security/KeyStore;->get(Ljava/lang/String;)[B

    move-result-object v13

    .local v13, "value":[B
    if-nez v13, :cond_7

    const/4 v12, 0x0

    .end local v13    # "value":[B
    :cond_3
    :goto_0
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->ipsecCaCert:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_4

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "CACERT_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecCaCert:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/security/KeyStore;->get(Ljava/lang/String;)[B

    move-result-object v13

    .restart local v13    # "value":[B
    if-nez v13, :cond_8

    const/4 v1, 0x0

    .end local v13    # "value":[B
    :cond_4
    :goto_1
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->ipsecServerCert:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_5

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "USRCERT_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecServerCert:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/security/KeyStore;->get(Ljava/lang/String;)[B

    move-result-object v13

    .restart local v13    # "value":[B
    if-nez v13, :cond_9

    const/4 v10, 0x0

    .end local v13    # "value":[B
    :cond_5
    :goto_2
    if-eqz v8, :cond_6

    if-eqz v12, :cond_6

    if-eqz v1, :cond_6

    if-nez v10, :cond_a

    :cond_6
    new-instance v14, Ljava/lang/IllegalStateException;

    const-string v15, "Cannot load credentials"

    invoke-direct {v14, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14

    .restart local v13    # "value":[B
    :cond_7
    new-instance v12, Ljava/lang/String;

    .end local v12    # "userCert":Ljava/lang/String;
    sget-object v14, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v12, v13, v14}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_0

    .restart local v12    # "userCert":Ljava/lang/String;
    :cond_8
    new-instance v1, Ljava/lang/String;

    .end local v1    # "caCert":Ljava/lang/String;
    sget-object v14, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v13, v14}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_1

    .restart local v1    # "caCert":Ljava/lang/String;
    :cond_9
    new-instance v10, Ljava/lang/String;

    .end local v10    # "serverCert":Ljava/lang/String;
    sget-object v14, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v10, v13, v14}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_2

    .end local v13    # "value":[B
    .restart local v10    # "serverCert":Ljava/lang/String;
    :cond_a
    const/4 v9, 0x0

    .local v9, "racoon":[Ljava/lang/String;
    move-object/from16 v0, p1

    iget v14, v0, Lcom/android/internal/net/VpnProfile;->type:I

    packed-switch v14, :pswitch_data_0

    :goto_3
    const/4 v7, 0x0

    .local v7, "mtpd":[Ljava/lang/String;
    move-object/from16 v0, p1

    iget v14, v0, Lcom/android/internal/net/VpnProfile;->type:I

    packed-switch v14, :pswitch_data_1

    :goto_4
    new-instance v2, Lcom/android/internal/net/VpnConfig;

    invoke-direct {v2}, Lcom/android/internal/net/VpnConfig;-><init>()V

    .local v2, "config":Lcom/android/internal/net/VpnConfig;
    const/4 v14, 0x1

    iput-boolean v14, v2, Lcom/android/internal/net/VpnConfig;->legacy:Z

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->key:Ljava/lang/String;

    iput-object v14, v2, Lcom/android/internal/net/VpnConfig;->user:Ljava/lang/String;

    iput-object v4, v2, Lcom/android/internal/net/VpnConfig;->interfaze:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->name:Ljava/lang/String;

    iput-object v14, v2, Lcom/android/internal/net/VpnConfig;->session:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->routes:Ljava/lang/String;

    invoke-virtual {v2, v14}, Lcom/android/internal/net/VpnConfig;->addLegacyRoutes(Ljava/lang/String;)V

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->dnsServers:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_b

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->dnsServers:Ljava/lang/String;

    const-string v15, " +"

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    iput-object v14, v2, Lcom/android/internal/net/VpnConfig;->dnsServers:Ljava/util/List;

    :cond_b
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->searchDomains:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_c

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/internal/net/VpnProfile;->searchDomains:Ljava/lang/String;

    const-string v15, " +"

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    iput-object v14, v2, Lcom/android/internal/net/VpnConfig;->searchDomains:Ljava/util/List;

    :cond_c
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v9, v7}, Lcom/android/server/connectivity/Vpn;->startLegacyVpn(Lcom/android/internal/net/VpnConfig;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void

    .end local v2    # "config":Lcom/android/internal/net/VpnConfig;
    .end local v7    # "mtpd":[Ljava/lang/String;
    :pswitch_0
    const/4 v14, 0x6

    new-array v9, v14, [Ljava/lang/String;

    .end local v9    # "racoon":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v9, v14

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x2

    const-string v15, "udppsk"

    aput-object v15, v9, v14

    const/4 v14, 0x3

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecIdentifier:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x4

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecSecret:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x5

    const-string v15, "1701"

    aput-object v15, v9, v14

    .restart local v9    # "racoon":[Ljava/lang/String;
    goto/16 :goto_3

    :pswitch_1
    const/16 v14, 0x8

    new-array v9, v14, [Ljava/lang/String;

    .end local v9    # "racoon":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v9, v14

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x2

    const-string v15, "udprsa"

    aput-object v15, v9, v14

    const/4 v14, 0x3

    aput-object v8, v9, v14

    const/4 v14, 0x4

    aput-object v12, v9, v14

    const/4 v14, 0x5

    aput-object v1, v9, v14

    const/4 v14, 0x6

    aput-object v10, v9, v14

    const/4 v14, 0x7

    const-string v15, "1701"

    aput-object v15, v9, v14

    .restart local v9    # "racoon":[Ljava/lang/String;
    goto/16 :goto_3

    :pswitch_2
    const/16 v14, 0x9

    new-array v9, v14, [Ljava/lang/String;

    .end local v9    # "racoon":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v9, v14

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x2

    const-string v15, "xauthpsk"

    aput-object v15, v9, v14

    const/4 v14, 0x3

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecIdentifier:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x4

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->ipsecSecret:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x5

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->username:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x6

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->password:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x7

    const-string v15, ""

    aput-object v15, v9, v14

    const/16 v14, 0x8

    aput-object v3, v9, v14

    .restart local v9    # "racoon":[Ljava/lang/String;
    goto/16 :goto_3

    :pswitch_3
    const/16 v14, 0xb

    new-array v9, v14, [Ljava/lang/String;

    .end local v9    # "racoon":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v9, v14

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x2

    const-string v15, "xauthrsa"

    aput-object v15, v9, v14

    const/4 v14, 0x3

    aput-object v8, v9, v14

    const/4 v14, 0x4

    aput-object v12, v9, v14

    const/4 v14, 0x5

    aput-object v1, v9, v14

    const/4 v14, 0x6

    aput-object v10, v9, v14

    const/4 v14, 0x7

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->username:Ljava/lang/String;

    aput-object v15, v9, v14

    const/16 v14, 0x8

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->password:Ljava/lang/String;

    aput-object v15, v9, v14

    const/16 v14, 0x9

    const-string v15, ""

    aput-object v15, v9, v14

    const/16 v14, 0xa

    aput-object v3, v9, v14

    .restart local v9    # "racoon":[Ljava/lang/String;
    goto/16 :goto_3

    :pswitch_4
    const/16 v14, 0x9

    new-array v9, v14, [Ljava/lang/String;

    .end local v9    # "racoon":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v9, v14

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x2

    const-string v15, "hybridrsa"

    aput-object v15, v9, v14

    const/4 v14, 0x3

    aput-object v1, v9, v14

    const/4 v14, 0x4

    aput-object v10, v9, v14

    const/4 v14, 0x5

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->username:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x6

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->password:Ljava/lang/String;

    aput-object v15, v9, v14

    const/4 v14, 0x7

    const-string v15, ""

    aput-object v15, v9, v14

    const/16 v14, 0x8

    aput-object v3, v9, v14

    .restart local v9    # "racoon":[Ljava/lang/String;
    goto/16 :goto_3

    .restart local v7    # "mtpd":[Ljava/lang/String;
    :pswitch_5
    const/16 v14, 0x14

    new-array v7, v14, [Ljava/lang/String;

    .end local v7    # "mtpd":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v7, v14

    const/4 v14, 0x1

    const-string v15, "pptp"

    aput-object v15, v7, v14

    const/4 v14, 0x2

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v7, v14

    const/4 v14, 0x3

    const-string v15, "1723"

    aput-object v15, v7, v14

    const/4 v14, 0x4

    const-string v15, "name"

    aput-object v15, v7, v14

    const/4 v14, 0x5

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->username:Ljava/lang/String;

    aput-object v15, v7, v14

    const/4 v14, 0x6

    const-string v15, "password"

    aput-object v15, v7, v14

    const/4 v14, 0x7

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->password:Ljava/lang/String;

    aput-object v15, v7, v14

    const/16 v14, 0x8

    const-string v15, "linkname"

    aput-object v15, v7, v14

    const/16 v14, 0x9

    const-string v15, "vpn"

    aput-object v15, v7, v14

    const/16 v14, 0xa

    const-string v15, "refuse-eap"

    aput-object v15, v7, v14

    const/16 v14, 0xb

    const-string v15, "nodefaultroute"

    aput-object v15, v7, v14

    const/16 v14, 0xc

    const-string v15, "usepeerdns"

    aput-object v15, v7, v14

    const/16 v14, 0xd

    const-string v15, "idle"

    aput-object v15, v7, v14

    const/16 v14, 0xe

    const-string v15, "1800"

    aput-object v15, v7, v14

    const/16 v14, 0xf

    const-string v15, "mtu"

    aput-object v15, v7, v14

    const/16 v14, 0x10

    const-string v15, "1400"

    aput-object v15, v7, v14

    const/16 v14, 0x11

    const-string v15, "mru"

    aput-object v15, v7, v14

    const/16 v14, 0x12

    const-string v15, "1400"

    aput-object v15, v7, v14

    const/16 v15, 0x13

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/android/internal/net/VpnProfile;->mppe:Z

    if-eqz v14, :cond_d

    const-string v14, "+mppe"

    :goto_5
    aput-object v14, v7, v15

    .restart local v7    # "mtpd":[Ljava/lang/String;
    goto/16 :goto_4

    .end local v7    # "mtpd":[Ljava/lang/String;
    :cond_d
    const-string v14, "nomppe"

    goto :goto_5

    .restart local v7    # "mtpd":[Ljava/lang/String;
    :pswitch_6
    const/16 v14, 0x14

    new-array v7, v14, [Ljava/lang/String;

    .end local v7    # "mtpd":[Ljava/lang/String;
    const/4 v14, 0x0

    aput-object v4, v7, v14

    const/4 v14, 0x1

    const-string v15, "l2tp"

    aput-object v15, v7, v14

    const/4 v14, 0x2

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->server:Ljava/lang/String;

    aput-object v15, v7, v14

    const/4 v14, 0x3

    const-string v15, "1701"

    aput-object v15, v7, v14

    const/4 v14, 0x4

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->l2tpSecret:Ljava/lang/String;

    aput-object v15, v7, v14

    const/4 v14, 0x5

    const-string v15, "name"

    aput-object v15, v7, v14

    const/4 v14, 0x6

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->username:Ljava/lang/String;

    aput-object v15, v7, v14

    const/4 v14, 0x7

    const-string v15, "password"

    aput-object v15, v7, v14

    const/16 v14, 0x8

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/android/internal/net/VpnProfile;->password:Ljava/lang/String;

    aput-object v15, v7, v14

    const/16 v14, 0x9

    const-string v15, "linkname"

    aput-object v15, v7, v14

    const/16 v14, 0xa

    const-string v15, "vpn"

    aput-object v15, v7, v14

    const/16 v14, 0xb

    const-string v15, "refuse-eap"

    aput-object v15, v7, v14

    const/16 v14, 0xc

    const-string v15, "nodefaultroute"

    aput-object v15, v7, v14

    const/16 v14, 0xd

    const-string v15, "usepeerdns"

    aput-object v15, v7, v14

    const/16 v14, 0xe

    const-string v15, "idle"

    aput-object v15, v7, v14

    const/16 v14, 0xf

    const-string v15, "1800"

    aput-object v15, v7, v14

    const/16 v14, 0x10

    const-string v15, "mtu"

    aput-object v15, v7, v14

    const/16 v14, 0x11

    const-string v15, "1400"

    aput-object v15, v7, v14

    const/16 v14, 0x12

    const-string v15, "mru"

    aput-object v15, v7, v14

    const/16 v14, 0x13

    const-string v15, "1400"

    aput-object v15, v7, v14

    .restart local v7    # "mtpd":[Ljava/lang/String;
    goto/16 :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public declared-synchronized stopLegacyVpnPrivileged()V
    .locals 2

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    invoke-virtual {v0}, Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;->exit()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/connectivity/Vpn;->mLegacyVpnRunner:Lcom/android/server/connectivity/Vpn$LegacyVpnRunner;

    const-string v1, "LegacyVpnRunner"

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method
