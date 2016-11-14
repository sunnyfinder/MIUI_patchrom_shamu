.class public Lcom/android/internal/os/InstallerConnection;
.super Ljava/lang/Object;
.source "InstallerConnection.java"


# static fields
.field private static final LOCAL_DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "InstallerConnection"


# instance fields
.field private final buf:[B

.field private mIn:Ljava/io/InputStream;

.field private mOut:Ljava/io/OutputStream;

.field private mSocket:Landroid/net/LocalSocket;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    return-void
.end method

.method private connect()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    if-eqz v2, :cond_0

    return v4

    :cond_0
    const-string v2, "InstallerConnection"

    const-string v3, "connecting..."

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v2, Landroid/net/LocalSocket;

    invoke-direct {v2}, Landroid/net/LocalSocket;-><init>()V

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    new-instance v0, Landroid/net/LocalSocketAddress;

    const-string v2, "installd"

    sget-object v3, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v0, v2, v3}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .local v0, "address":Landroid/net/LocalSocketAddress;
    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v2, v0}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mIn:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mOut:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v4

    .end local v0    # "address":Landroid/net/LocalSocketAddress;
    :catch_0
    move-exception v1

    .local v1, "ex":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/android/internal/os/InstallerConnection;->disconnect()V

    const/4 v2, 0x0

    return v2
.end method

.method private readFully([BI)Z
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "len"    # I

    .prologue
    const/4 v3, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/android/internal/os/InstallerConnection;->mIn:Ljava/io/InputStream;

    const/4 v2, 0x0

    invoke-static {v1, p1, v2, p2}, Llibcore/io/Streams;->readFully(Ljava/io/InputStream;[BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    return v1

    :catch_0
    move-exception v0

    .local v0, "ioe":Ljava/io/IOException;
    const-string v1, "InstallerConnection"

    const-string v2, "read exception"

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/internal/os/InstallerConnection;->disconnect()V

    return v3
.end method

.method private readReply()I
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v4, -0x1

    iget-object v1, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2}, Lcom/android/internal/os/InstallerConnection;->readFully([BI)Z

    move-result v1

    if-nez v1, :cond_0

    return v4

    :cond_0
    iget-object v1, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int v0, v1, v2

    .local v0, "len":I
    if-lt v0, v3, :cond_1

    iget-object v1, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    array-length v1, v1

    if-le v0, v1, :cond_2

    :cond_1
    const-string v1, "InstallerConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid reply length ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/internal/os/InstallerConnection;->disconnect()V

    return v4

    :cond_2
    iget-object v1, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    invoke-direct {p0, v1, v0}, Lcom/android/internal/os/InstallerConnection;->readFully([BI)Z

    move-result v1

    if-nez v1, :cond_3

    return v4

    :cond_3
    return v0
.end method

.method private writeCommand(Ljava/lang/String;)Z
    .locals 9
    .param p1, "cmdString"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .local v0, "cmd":[B
    array-length v2, v0

    .local v2, "len":I
    if-lt v2, v8, :cond_0

    iget-object v3, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    array-length v3, v3

    if-le v2, v3, :cond_1

    :cond_0
    return v7

    :cond_1
    iget-object v3, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    and-int/lit16 v4, v2, 0xff

    int-to-byte v4, v4

    aput-byte v4, v3, v7

    iget-object v3, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    shr-int/lit8 v4, v2, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v3, v8

    :try_start_0
    iget-object v3, p0, Lcom/android/internal/os/InstallerConnection;->mOut:Ljava/io/OutputStream;

    iget-object v4, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/OutputStream;->write([BII)V

    iget-object v3, p0, Lcom/android/internal/os/InstallerConnection;->mOut:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v8

    :catch_0
    move-exception v1

    .local v1, "ex":Ljava/io/IOException;
    const-string v3, "InstallerConnection"

    const-string v4, "write error"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/internal/os/InstallerConnection;->disconnect()V

    return v7
.end method


# virtual methods
.method public dexopt(Ljava/lang/String;IZLjava/lang/String;IZ)I
    .locals 11
    .param p1, "apkPath"    # Ljava/lang/String;
    .param p2, "uid"    # I
    .param p3, "isPublic"    # Z
    .param p4, "instructionSet"    # Ljava/lang/String;
    .param p5, "dexoptNeeded"    # I
    .param p6, "bootComplete"    # Z

    .prologue
    const-string v4, "*"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    move/from16 v6, p5

    move/from16 v10, p6

    invoke-virtual/range {v0 .. v10}, Lcom/android/internal/os/InstallerConnection;->dexopt(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;IZZLjava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public dexopt(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;IZZLjava/lang/String;Z)I
    .locals 3
    .param p1, "apkPath"    # Ljava/lang/String;
    .param p2, "uid"    # I
    .param p3, "isPublic"    # Z
    .param p4, "pkgName"    # Ljava/lang/String;
    .param p5, "instructionSet"    # Ljava/lang/String;
    .param p6, "dexoptNeeded"    # I
    .param p7, "vmSafeMode"    # Z
    .param p8, "debuggable"    # Z
    .param p9, "outputPath"    # Ljava/lang/String;
    .param p10, "bootComplete"    # Z

    .prologue
    const/16 v2, 0x20

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "dexopt"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_0

    const-string v1, " 1"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz p7, :cond_1

    const-string v1, " 1"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p8, :cond_2

    const-string v1, " 1"

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-eqz p9, :cond_3

    .end local p9    # "outputPath":Ljava/lang/String;
    :goto_3
    invoke-virtual {v0, p9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p10, :cond_4

    const-string v1, " 1"

    :goto_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/os/InstallerConnection;->execute(Ljava/lang/String;)I

    move-result v1

    return v1

    .restart local p9    # "outputPath":Ljava/lang/String;
    :cond_0
    const-string v1, " 0"

    goto :goto_0

    :cond_1
    const-string v1, " 0"

    goto :goto_1

    :cond_2
    const-string v1, " 0"

    goto :goto_2

    :cond_3
    const-string p9, "!"

    goto :goto_3

    .end local p9    # "outputPath":Ljava/lang/String;
    :cond_4
    const-string v1, " 0"

    goto :goto_4
.end method

.method public disconnect()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const-string v0, "InstallerConnection"

    const-string v1, "disconnecting..."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    iget-object v0, p0, Lcom/android/internal/os/InstallerConnection;->mIn:Ljava/io/InputStream;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    iget-object v0, p0, Lcom/android/internal/os/InstallerConnection;->mOut:Ljava/io/OutputStream;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mSocket:Landroid/net/LocalSocket;

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mIn:Ljava/io/InputStream;

    iput-object v2, p0, Lcom/android/internal/os/InstallerConnection;->mOut:Ljava/io/OutputStream;

    return-void
.end method

.method public execute(Ljava/lang/String;)I
    .locals 3
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    invoke-virtual {p0, p1}, Lcom/android/internal/os/InstallerConnection;->transact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "res":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/NumberFormatException;
    const/4 v2, -0x1

    return v2
.end method

.method public declared-synchronized transact(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/internal/os/InstallerConnection;->connect()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "InstallerConnection"

    const-string v3, "connection failed"

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "-1"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/internal/os/InstallerConnection;->writeCommand(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "InstallerConnection"

    const-string v3, "write command failed? reconnect!"

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/internal/os/InstallerConnection;->connect()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0, p1}, Lcom/android/internal/os/InstallerConnection;->writeCommand(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/android/internal/os/InstallerConnection;->readReply()I

    move-result v0

    .local v0, "replyLength":I
    if-lez v0, :cond_3

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/os/InstallerConnection;->buf:[B

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Ljava/lang/String;-><init>([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .local v1, "s":Ljava/lang/String;
    monitor-exit p0

    return-object v1

    .end local v0    # "replyLength":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    :try_start_2
    const-string v2, "-1"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v2

    .restart local v0    # "replyLength":I
    :cond_3
    :try_start_3
    const-string v2, "-1"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v2

    .end local v0    # "replyLength":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public waitForConnection()V
    .locals 2

    .prologue
    :goto_0
    const-string v0, "ping"

    invoke-virtual {p0, v0}, Lcom/android/internal/os/InstallerConnection;->execute(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "InstallerConnection"

    const-string v1, "installd not ready"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_0
.end method
