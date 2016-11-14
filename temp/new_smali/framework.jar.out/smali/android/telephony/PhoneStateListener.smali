.class public Landroid/telephony/PhoneStateListener;
.super Ljava/lang/Object;
.source "PhoneStateListener.java"


# static fields
.field private static final DBG:Z = false

.field public static final LISTEN_CALL_FORWARDING_INDICATOR:I = 0x8

.field public static final LISTEN_CALL_STATE:I = 0x20

.field public static final LISTEN_CARRIER_NETWORK_CHANGE:I = 0x10000

.field public static final LISTEN_CELL_INFO:I = 0x400

.field public static final LISTEN_CELL_LOCATION:I = 0x10

.field public static final LISTEN_DATA_ACTIVITY:I = 0x80

.field public static final LISTEN_DATA_CONNECTION_REAL_TIME_INFO:I = 0x2000

.field public static final LISTEN_DATA_CONNECTION_STATE:I = 0x40

.field public static final LISTEN_MESSAGE_WAITING_INDICATOR:I = 0x4

.field public static final LISTEN_NONE:I = 0x0

.field public static final LISTEN_OEM_HOOK_RAW_EVENT:I = 0x8000

.field public static final LISTEN_OTASP_CHANGED:I = 0x200

.field public static final LISTEN_PRECISE_CALL_STATE:I = 0x800

.field public static final LISTEN_PRECISE_DATA_CONNECTION_STATE:I = 0x1000

.field public static final LISTEN_SERVICE_STATE:I = 0x1

.field public static final LISTEN_SIGNAL_STRENGTH:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final LISTEN_SIGNAL_STRENGTHS:I = 0x100

.field public static final LISTEN_VOLTE_STATE:I = 0x4000

.field private static final LOG_TAG:Ljava/lang/String; = "PhoneStateListener"


# instance fields
.field callback:Lcom/android/internal/telephony/IPhoneStateListener;

.field private final mHandler:Landroid/os/Handler;

.field protected mSubId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const v0, 0x7fffffff

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroid/telephony/PhoneStateListener;-><init>(ILandroid/os/Looper;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "subId"    # I

    .prologue
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Landroid/telephony/PhoneStateListener;-><init>(ILandroid/os/Looper;)V

    return-void
.end method

.method public constructor <init>(ILandroid/os/Looper;)V
    .locals 1
    .param p1, "subId"    # I
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Landroid/telephony/PhoneStateListener;->mSubId:I

    new-instance v0, Landroid/telephony/PhoneStateListener$2;

    invoke-direct {v0, p0}, Landroid/telephony/PhoneStateListener$2;-><init>(Landroid/telephony/PhoneStateListener;)V

    iput-object v0, p0, Landroid/telephony/PhoneStateListener;->callback:Lcom/android/internal/telephony/IPhoneStateListener;

    iput p1, p0, Landroid/telephony/PhoneStateListener;->mSubId:I

    new-instance v0, Landroid/telephony/PhoneStateListener$1;

    invoke-direct {v0, p0, p2}, Landroid/telephony/PhoneStateListener$1;-><init>(Landroid/telephony/PhoneStateListener;Landroid/os/Looper;)V

    iput-object v0, p0, Landroid/telephony/PhoneStateListener;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    const v0, 0x7fffffff

    invoke-direct {p0, v0, p1}, Landroid/telephony/PhoneStateListener;-><init>(ILandroid/os/Looper;)V

    return-void
.end method

.method static synthetic access$000(Landroid/telephony/PhoneStateListener;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Landroid/telephony/PhoneStateListener;

    .prologue
    iget-object v0, p0, Landroid/telephony/PhoneStateListener;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const-string v0, "PhoneStateListener"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public onCallForwardingIndicatorChanged(Z)V
    .locals 0
    .param p1, "cfi"    # Z

    .prologue
    return-void
.end method

.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 0
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .prologue
    return-void
.end method

.method public onCarrierNetworkChange(Z)V
    .locals 0
    .param p1, "active"    # Z

    .prologue
    return-void
.end method

.method public onCellInfoChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/telephony/CellInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "cellInfo":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/CellInfo;>;"
    return-void
.end method

.method public onCellLocationChanged(Landroid/telephony/CellLocation;)V
    .locals 0
    .param p1, "location"    # Landroid/telephony/CellLocation;

    .prologue
    return-void
.end method

.method public onDataActivity(I)V
    .locals 0
    .param p1, "direction"    # I

    .prologue
    return-void
.end method

.method public onDataConnectionRealTimeInfoChanged(Landroid/telephony/DataConnectionRealTimeInfo;)V
    .locals 0
    .param p1, "dcRtInfo"    # Landroid/telephony/DataConnectionRealTimeInfo;

    .prologue
    return-void
.end method

.method public onDataConnectionStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    return-void
.end method

.method public onDataConnectionStateChanged(II)V
    .locals 0
    .param p1, "state"    # I
    .param p2, "networkType"    # I

    .prologue
    return-void
.end method

.method public onMessageWaitingIndicatorChanged(Z)V
    .locals 0
    .param p1, "mwi"    # Z

    .prologue
    return-void
.end method

.method public onOemHookRawEvent([B)V
    .locals 0
    .param p1, "rawData"    # [B

    .prologue
    return-void
.end method

.method public onOtaspChanged(I)V
    .locals 0
    .param p1, "otaspMode"    # I

    .prologue
    return-void
.end method

.method public onPreciseCallStateChanged(Landroid/telephony/PreciseCallState;)V
    .locals 0
    .param p1, "callState"    # Landroid/telephony/PreciseCallState;

    .prologue
    return-void
.end method

.method public onPreciseDataConnectionStateChanged(Landroid/telephony/PreciseDataConnectionState;)V
    .locals 0
    .param p1, "dataConnectionState"    # Landroid/telephony/PreciseDataConnectionState;

    .prologue
    return-void
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 0
    .param p1, "serviceState"    # Landroid/telephony/ServiceState;

    .prologue
    return-void
.end method

.method public onSignalStrengthChanged(I)V
    .locals 0
    .param p1, "asu"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 0
    .param p1, "signalStrength"    # Landroid/telephony/SignalStrength;

    .prologue
    return-void
.end method

.method public onVoLteServiceStateChanged(Landroid/telephony/VoLteServiceState;)V
    .locals 0
    .param p1, "stateInfo"    # Landroid/telephony/VoLteServiceState;

    .prologue
    return-void
.end method
