.class Landroid/net/dhcp/DhcpClient$DhcpRequestingState;
.super Landroid/net/dhcp/DhcpClient$PacketRetransmittingState;
.source "DhcpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/dhcp/DhcpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DhcpRequestingState"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/net/dhcp/DhcpClient;


# direct methods
.method public constructor <init>(Landroid/net/dhcp/DhcpClient;)V
    .locals 1
    .param p1, "this$0"    # Landroid/net/dhcp/DhcpClient;

    .prologue
    iput-object p1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-direct {p0, p1}, Landroid/net/dhcp/DhcpClient$PacketRetransmittingState;-><init>(Landroid/net/dhcp/DhcpClient;)V

    const/16 v0, 0x4650

    iput v0, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->mTimeout:I

    return-void
.end method


# virtual methods
.method protected receivePacket(Landroid/net/dhcp/DhcpPacket;)V
    .locals 4
    .param p1, "packet"    # Landroid/net/dhcp/DhcpPacket;

    .prologue
    const/4 v3, 0x0

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-virtual {v1, p1}, Landroid/net/dhcp/DhcpClient;->isValidPacket(Landroid/net/dhcp/DhcpPacket;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    instance-of v1, p1, Landroid/net/dhcp/DhcpAckPacket;

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/net/dhcp/DhcpPacket;->toDhcpResults()Landroid/net/DhcpResults;

    move-result-object v0

    .local v0, "results":Landroid/net/DhcpResults;
    if-eqz v0, :cond_1

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v1, v0}, Landroid/net/dhcp/DhcpClient;->-set0(Landroid/net/dhcp/DhcpClient;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v1, v3}, Landroid/net/dhcp/DhcpClient;->-set1(Landroid/net/dhcp/DhcpClient;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;

    const-string v1, "DhcpClient"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Confirmed lease: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v3}, Landroid/net/dhcp/DhcpClient;->-get4(Landroid/net/dhcp/DhcpClient;)Landroid/net/DhcpResults;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-virtual {v1, p1}, Landroid/net/dhcp/DhcpClient;->setDhcpLeaseExpiry(Landroid/net/dhcp/DhcpPacket;)V

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    iget-object v2, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v2}, Landroid/net/dhcp/DhcpClient;->-get2(Landroid/net/dhcp/DhcpClient;)Lcom/android/internal/util/State;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/net/dhcp/DhcpClient;->-wrap15(Landroid/net/dhcp/DhcpClient;Lcom/android/internal/util/IState;)V

    .end local v0    # "results":Landroid/net/DhcpResults;
    :cond_1
    :goto_0
    return-void

    :cond_2
    instance-of v1, p1, Landroid/net/dhcp/DhcpNakPacket;

    if-eqz v1, :cond_1

    const-string v1, "DhcpClient"

    const-string v2, "Received NAK, returning to INIT"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v1, v3}, Landroid/net/dhcp/DhcpClient;->-set1(Landroid/net/dhcp/DhcpClient;Landroid/net/DhcpResults;)Landroid/net/DhcpResults;

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    iget-object v2, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v2}, Landroid/net/dhcp/DhcpClient;->-get3(Landroid/net/dhcp/DhcpClient;)Lcom/android/internal/util/State;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/net/dhcp/DhcpClient;->-wrap15(Landroid/net/dhcp/DhcpClient;Lcom/android/internal/util/IState;)V

    goto :goto_0
.end method

.method protected sendPacket()Z
    .locals 5

    .prologue
    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    sget-object v2, Landroid/net/dhcp/DhcpPacket;->INADDR_ANY:Ljava/net/Inet4Address;

    iget-object v0, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v0}, Landroid/net/dhcp/DhcpClient;->-get8(Landroid/net/dhcp/DhcpClient;)Landroid/net/DhcpResults;

    move-result-object v0

    iget-object v0, v0, Landroid/net/DhcpResults;->ipAddress:Landroid/net/LinkAddress;

    invoke-virtual {v0}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    iget-object v3, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v3}, Landroid/net/dhcp/DhcpClient;->-get8(Landroid/net/dhcp/DhcpClient;)Landroid/net/DhcpResults;

    move-result-object v3

    iget-object v3, v3, Landroid/net/DhcpResults;->serverAddress:Ljava/net/Inet4Address;

    sget-object v4, Landroid/net/dhcp/DhcpPacket;->INADDR_BROADCAST:Ljava/net/Inet4Address;

    invoke-static {v1, v2, v0, v3, v4}, Landroid/net/dhcp/DhcpClient;->-wrap4(Landroid/net/dhcp/DhcpClient;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;Ljava/net/Inet4Address;)Z

    move-result v0

    return v0
.end method

.method protected timeout()V
    .locals 2

    .prologue
    iget-object v0, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    iget-object v1, p0, Landroid/net/dhcp/DhcpClient$DhcpRequestingState;->this$0:Landroid/net/dhcp/DhcpClient;

    invoke-static {v1}, Landroid/net/dhcp/DhcpClient;->-get3(Landroid/net/dhcp/DhcpClient;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/net/dhcp/DhcpClient;->-wrap15(Landroid/net/dhcp/DhcpClient;Lcom/android/internal/util/IState;)V

    return-void
.end method
