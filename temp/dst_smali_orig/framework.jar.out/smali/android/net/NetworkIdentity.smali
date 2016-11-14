.class public Landroid/net/NetworkIdentity;
.super Ljava/lang/Object;
.source "NetworkIdentity.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Landroid/net/NetworkIdentity;",
        ">;"
    }
.end annotation


# static fields
.field public static final COMBINE_SUBTYPE_ENABLED:Z = true
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SUBTYPE_COMBINED:I = -0x1

.field private static final TAG:Ljava/lang/String; = "NetworkIdentity"


# instance fields
.field final mNetworkId:Ljava/lang/String;

.field final mRoaming:Z

.field final mSubType:I

.field final mSubscriberId:Ljava/lang/String;

.field final mType:I


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "subType"    # I
    .param p3, "subscriberId"    # Ljava/lang/String;
    .param p4, "networkId"    # Ljava/lang/String;
    .param p5, "roaming"    # Z

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/net/NetworkIdentity;->mType:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/net/NetworkIdentity;->mSubType:I

    iput-object p3, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    iput-object p4, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    iput-boolean p5, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    return-void
.end method

.method public static buildNetworkIdentity(Landroid/content/Context;Landroid/net/NetworkState;)Landroid/net/NetworkIdentity;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "state"    # Landroid/net/NetworkState;

    .prologue
    iget-object v0, p1, Landroid/net/NetworkState;->networkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    .local v1, "type":I
    iget-object v0, p1, Landroid/net/NetworkState;->networkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v2

    .local v2, "subType":I
    const/4 v3, 0x0

    .local v3, "subscriberId":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "networkId":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "roaming":Z
    invoke-static {v1}, Landroid/net/ConnectivityManager;->isNetworkTypeMobile(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Landroid/net/NetworkState;->subscriberId:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "NetworkIdentity"

    const-string v8, "Active mobile network without subscriber!"

    invoke-static {v0, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v3, p1, Landroid/net/NetworkState;->subscriberId:Ljava/lang/String;

    .local v3, "subscriberId":Ljava/lang/String;
    iget-object v0, p1, Landroid/net/NetworkState;->networkInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v5

    .end local v3    # "subscriberId":Ljava/lang/String;
    .end local v4    # "networkId":Ljava/lang/String;
    .end local v5    # "roaming":Z
    :cond_1
    :goto_0
    new-instance v0, Landroid/net/NetworkIdentity;

    invoke-direct/range {v0 .. v5}, Landroid/net/NetworkIdentity;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    return-object v0

    .local v3, "subscriberId":Ljava/lang/String;
    .restart local v4    # "networkId":Ljava/lang/String;
    .restart local v5    # "roaming":Z
    :cond_2
    const/4 v0, 0x1

    if-ne v1, v0, :cond_1

    iget-object v0, p1, Landroid/net/NetworkState;->networkId:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v4, p1, Landroid/net/NetworkState;->networkId:Ljava/lang/String;

    .local v4, "networkId":Ljava/lang/String;
    goto :goto_0

    .local v4, "networkId":Ljava/lang/String;
    :cond_3
    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    .local v7, "wifi":Landroid/net/wifi/WifiManager;
    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v6

    .local v6, "info":Landroid/net/wifi/WifiInfo;
    if-eqz v6, :cond_4

    invoke-virtual {v6}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v4

    .local v4, "networkId":Ljava/lang/String;
    goto :goto_0

    .local v4, "networkId":Ljava/lang/String;
    :cond_4
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static scrubSubscriberId(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "subscriberId"    # Ljava/lang/String;

    .prologue
    const-string v0, "eng"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    if-eqz p0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x6

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "null"

    return-object v0
.end method

.method public static scrubSubscriberId([Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p0, "subscriberId"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    if-nez p0, :cond_0

    return-object v2

    :cond_0
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/String;

    .local v1, "res":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_1

    aget-object v2, p0, v0

    invoke-static {v2}, Landroid/net/NetworkIdentity;->scrubSubscriberId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method


# virtual methods
.method public compareTo(Landroid/net/NetworkIdentity;)I
    .locals 3
    .param p1, "another"    # Landroid/net/NetworkIdentity;

    .prologue
    iget v1, p0, Landroid/net/NetworkIdentity;->mType:I

    iget v2, p1, Landroid/net/NetworkIdentity;->mType:I

    invoke-static {v1, v2}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    .local v0, "res":I
    if-nez v0, :cond_0

    iget v1, p0, Landroid/net/NetworkIdentity;->mSubType:I

    iget v2, p1, Landroid/net/NetworkIdentity;->mSubType:I

    invoke-static {v1, v2}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    :cond_0
    if-nez v0, :cond_1

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p1, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    iget-object v2, p1, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    :cond_1
    if-nez v0, :cond_2

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p1, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    iget-object v2, p1, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    :cond_2
    if-nez v0, :cond_3

    iget-boolean v1, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    iget-boolean v2, p1, Landroid/net/NetworkIdentity;->mRoaming:Z

    invoke-static {v1, v2}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result v0

    :cond_3
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    check-cast p1, Landroid/net/NetworkIdentity;

    .end local p1    # "another":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/net/NetworkIdentity;->compareTo(Landroid/net/NetworkIdentity;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    instance-of v2, p1, Landroid/net/NetworkIdentity;

    if-eqz v2, :cond_1

    move-object v0, p1

    check-cast v0, Landroid/net/NetworkIdentity;

    .local v0, "ident":Landroid/net/NetworkIdentity;
    iget v2, p0, Landroid/net/NetworkIdentity;->mType:I

    iget v3, v0, Landroid/net/NetworkIdentity;->mType:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Landroid/net/NetworkIdentity;->mSubType:I

    iget v3, v0, Landroid/net/NetworkIdentity;->mSubType:I

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    iget-boolean v3, v0, Landroid/net/NetworkIdentity;->mRoaming:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    iget-object v3, v0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    iget-object v2, v0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_0
    return v1

    .end local v0    # "ident":Landroid/net/NetworkIdentity;
    :cond_1
    return v1
.end method

.method public getNetworkId()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    return-object v0
.end method

.method public getRoaming()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    return v0
.end method

.method public getSubType()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/net/NetworkIdentity;->mSubType:I

    return v0
.end method

.method public getSubscriberId()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/net/NetworkIdentity;->mType:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Landroid/net/NetworkIdentity;->mType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Landroid/net/NetworkIdentity;->mSubType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget-boolean v1, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/net/NetworkIdentity;->mType:I

    invoke-static {v2}, Landroid/net/ConnectivityManager;->getNetworkTypeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", subType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "COMBINED"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, ", subscriberId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/net/NetworkIdentity;->mSubscriberId:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/NetworkIdentity;->scrubSubscriberId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v1, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    if-eqz v1, :cond_1

    const-string v1, ", networkId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/net/NetworkIdentity;->mNetworkId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-boolean v1, p0, Landroid/net/NetworkIdentity;->mRoaming:Z

    if-eqz v1, :cond_2

    const-string v1, ", ROAMING"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
