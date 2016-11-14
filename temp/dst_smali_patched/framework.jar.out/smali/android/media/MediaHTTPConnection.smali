.class public Landroid/media/MediaHTTPConnection;
.super Landroid/media/IMediaHTTPConnection$Stub;
.source "MediaHTTPConnection.java"


# static fields
.field private static final CONNECT_TIMEOUT_MS:I = 0x7530

.field private static final HTTP_TEMP_REDIRECT:I = 0x133

.field private static final MAX_REDIRECTS:I = 0x14

.field private static final TAG:Ljava/lang/String; = "MediaHTTPConnection"

.field private static final VERBOSE:Z


# instance fields
.field private mAllowCrossDomainRedirect:Z

.field private mAllowCrossProtocolRedirect:Z

.field private mConnection:Ljava/net/HttpURLConnection;

.field private mCurrentOffset:J

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mInputStream:Ljava/io/InputStream;

.field private mNativeContext:J

.field private mTotalSize:J

.field private mURL:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "media_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Landroid/media/MediaHTTPConnection;->native_init()V

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/media/IMediaHTTPConnection$Stub;-><init>()V

    iput-wide v2, p0, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mHeaders:Ljava/util/Map;

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    iput-wide v2, p0, Landroid/media/MediaHTTPConnection;->mTotalSize:J

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mInputStream:Ljava/io/InputStream;

    iput-boolean v1, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    iput-boolean v1, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossProtocolRedirect:Z

    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/net/CookieManager;

    invoke-direct {v0}, Ljava/net/CookieManager;-><init>()V

    invoke-static {v0}, Ljava/net/CookieHandler;->setDefault(Ljava/net/CookieHandler;)V

    :cond_0
    invoke-direct {p0}, Landroid/media/MediaHTTPConnection;->native_setup()V

    return-void
.end method

.method private convertHeaderStringToMap(Ljava/lang/String;)Ljava/util/Map;
    .locals 10
    .param p1, "headers"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "\r\n"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .local v4, "pairs":[Ljava/lang/String;
    array-length v8, v4

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v3, v4, v6

    .local v3, "pair":Ljava/lang/String;
    const-string v9, ":"

    invoke-virtual {v3, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .local v0, "colonPos":I
    if-ltz v0, :cond_0

    invoke-virtual {v3, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .local v1, "key":Ljava/lang/String;
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .local v5, "val":Ljava/lang/String;
    invoke-direct {p0, v1, v5}, Landroid/media/MediaHTTPConnection;->filterOutInternalHeaders(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v2, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v1    # "key":Ljava/lang/String;
    .end local v5    # "val":Ljava/lang/String;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .end local v0    # "colonPos":I
    .end local v3    # "pair":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method private filterOutInternalHeaders(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    const-string v0, "android-allow-cross-domain-redirect"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Landroid/media/MediaHTTPConnection;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    iget-boolean v0, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    iput-boolean v0, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossProtocolRedirect:Z

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static final isLocalHost(Ljava/net/URL;)Z
    .locals 5
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    if-nez p0, :cond_0

    return v3

    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    .local v0, "host":Ljava/lang/String;
    if-nez v0, :cond_1

    return v3

    :cond_1
    :try_start_0
    const-string v2, "localhost"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v4

    :cond_2
    invoke-static {v0}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_3

    return v4

    :catch_0
    move-exception v1

    :cond_3
    return v3
.end method

.method private final native native_finalize()V
.end method

.method private final native native_getIMemory()Landroid/os/IBinder;
.end method

.method private static final native native_init()V
.end method

.method private final native native_readAt(JI)I
.end method

.method private final native native_setup()V
.end method

.method private parseBoolean(Ljava/lang/String;)Z
    .locals 6
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "true"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v1, "yes"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    :cond_1
    return v1
.end method

.method private readAt(J[BI)I
    .locals 15
    .param p1, "offset"    # J
    .param p3, "data"    # [B
    .param p4, "size"    # I

    .prologue
    new-instance v9, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v9}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v9}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v8

    .local v8, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v8}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :try_start_0
    iget-wide v10, p0, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J

    cmp-long v9, p1, v10

    if-eqz v9, :cond_0

    invoke-direct/range {p0 .. p2}, Landroid/media/MediaHTTPConnection;->seekTo(J)V

    :cond_0
    iget-object v9, p0, Landroid/media/MediaHTTPConnection;->mInputStream:Ljava/io/InputStream;

    const/4 v10, 0x0

    move-object/from16 v0, p3

    move/from16 v1, p4

    invoke-virtual {v9, v0, v10, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    .local v7, "n":I
    const/4 v9, -0x1

    if-ne v7, v9, :cond_1

    const/4 v7, 0x0

    :cond_1
    iget-wide v10, p0, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J

    int-to-long v12, v7

    add-long/2addr v10, v12

    iput-wide v10, p0, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J
    :try_end_0
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/net/NoRouteToHostException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/net/UnknownServiceException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v7

    .end local v7    # "n":I
    :catch_0
    move-exception v3

    .local v3, "e":Ljava/lang/Exception;
    const/4 v9, -0x1

    return v9

    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    const/4 v9, -0x1

    return v9

    .end local v2    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v6

    .local v6, "e":Ljava/net/UnknownServiceException;
    const-string v9, "MediaHTTPConnection"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "readAt "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-wide/from16 v0, p1

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " / "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " => "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v9, -0x3f2

    return v9

    .end local v6    # "e":Ljava/net/UnknownServiceException;
    :catch_3
    move-exception v4

    .local v4, "e":Ljava/net/NoRouteToHostException;
    const-string v9, "MediaHTTPConnection"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "readAt "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-wide/from16 v0, p1

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " / "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " => "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v9, -0x3f2

    return v9

    .end local v4    # "e":Ljava/net/NoRouteToHostException;
    :catch_4
    move-exception v5

    .local v5, "e":Ljava/net/ProtocolException;
    const-string v9, "MediaHTTPConnection"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "readAt "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-wide/from16 v0, p1

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " / "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " => "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v9, -0x3f2

    return v9
.end method

.method private seekTo(J)V
    .locals 23
    .param p1, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-direct/range {p0 .. p0}, Landroid/media/MediaHTTPConnection;->teardownConnection()V

    const/4 v13, 0x0

    .local v13, "redirectCount":I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    move-object/from16 v18, v0

    .local v18, "url":Ljava/net/URL;
    invoke-static/range {v18 .. v18}, Landroid/media/MediaHTTPConnection;->isLocalHost(Ljava/net/URL;)Z

    move-result v12

    .local v12, "noProxy":Z
    :cond_0
    :goto_0
    if-eqz v12, :cond_1

    sget-object v19, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-virtual/range {v18 .. v19}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v19

    check-cast v19, Ljava/net/HttpURLConnection;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    const/16 v20, 0x7530

    invoke-virtual/range {v19 .. v20}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mHeaders:Ljava/util/Map;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mHeaders:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "entry$iterator":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v21, v0

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "entry$iterator":Ljava/util/Iterator;
    .end local v12    # "noProxy":Z
    .end local v18    # "url":Ljava/net/URL;
    :catch_0
    move-exception v5

    .local v5, "e":Ljava/io/IOException;
    const-wide/16 v20, -0x1

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mTotalSize:J

    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mInputStream:Ljava/io/InputStream;

    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    const-wide/16 v20, -0x1

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J

    throw v5

    .end local v5    # "e":Ljava/io/IOException;
    .restart local v12    # "noProxy":Z
    .restart local v18    # "url":Ljava/net/URL;
    :cond_1
    :try_start_1
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v19

    check-cast v19, Ljava/net/HttpURLConnection;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    goto/16 :goto_1

    :cond_2
    const-wide/16 v20, 0x0

    cmp-long v19, p1, v20

    if-lez v19, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    const-string v20, "Range"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "bytes="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "-"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v19 .. v21}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    .local v14, "response":I
    const/16 v19, 0x12c

    move/from16 v0, v19

    if-eq v14, v0, :cond_6

    const/16 v19, 0x12d

    move/from16 v0, v19

    if-eq v14, v0, :cond_6

    const/16 v19, 0x12e

    move/from16 v0, v19

    if-eq v14, v0, :cond_6

    const/16 v19, 0x12f

    move/from16 v0, v19

    if-eq v14, v0, :cond_6

    const/16 v19, 0x133

    move/from16 v0, v19

    if-eq v14, v0, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    :cond_4
    const/16 v19, 0xce

    move/from16 v0, v19

    if-ne v14, v0, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    const-string v20, "Content-Range"

    invoke-virtual/range {v19 .. v20}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .local v4, "contentRange":Ljava/lang/String;
    const-wide/16 v20, -0x1

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mTotalSize:J

    if-eqz v4, :cond_5

    const/16 v19, 0x2f

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    .local v9, "lastSlashPos":I
    if-ltz v9, :cond_5

    add-int/lit8 v19, v9, 0x1

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v17

    .local v17, "total":Ljava/lang/String;
    :try_start_2
    invoke-static/range {v17 .. v17}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v20

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mTotalSize:J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .end local v4    # "contentRange":Ljava/lang/String;
    .end local v9    # "lastSlashPos":I
    .end local v17    # "total":Ljava/lang/String;
    :cond_5
    :goto_3
    const-wide/16 v20, 0x0

    cmp-long v19, p1, v20

    if-lez v19, :cond_13

    const/16 v19, 0xce

    move/from16 v0, v19

    if-eq v14, v0, :cond_13

    :try_start_3
    new-instance v19, Ljava/net/ProtocolException;

    invoke-direct/range {v19 .. v19}, Ljava/net/ProtocolException;-><init>()V

    throw v19

    :cond_6
    add-int/lit8 v13, v13, 0x1

    const/16 v19, 0x14

    move/from16 v0, v19

    if-le v13, v0, :cond_7

    new-instance v19, Ljava/net/NoRouteToHostException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Too many redirects: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v11

    .local v11, "method":Ljava/lang/String;
    const/16 v19, 0x133

    move/from16 v0, v19

    if-ne v14, v0, :cond_8

    const-string v19, "GET"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    const-string v20, "Location"

    invoke-virtual/range {v19 .. v20}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .local v10, "location":Ljava/lang/String;
    if-nez v10, :cond_a

    new-instance v19, Ljava/net/NoRouteToHostException;

    const-string v20, "Invalid redirect"

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    .end local v10    # "location":Ljava/lang/String;
    :cond_9
    const-string v19, "HEAD"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_8

    new-instance v19, Ljava/net/NoRouteToHostException;

    const-string v20, "Invalid redirect"

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    .restart local v10    # "location":Ljava/lang/String;
    :cond_a
    new-instance v18, Ljava/net/URL;

    .end local v18    # "url":Ljava/net/URL;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v10}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .restart local v18    # "url":Ljava/net/URL;
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v19

    const-string v20, "https"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_b

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v19

    const-string v20, "http"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_e

    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    .local v16, "sameProtocol":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/media/MediaHTTPConnection;->mAllowCrossProtocolRedirect:Z

    move/from16 v19, v0

    if-nez v19, :cond_c

    if-eqz v16, :cond_f

    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    .local v15, "sameHost":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    move/from16 v19, v0

    if-nez v19, :cond_d

    if-eqz v15, :cond_10

    :cond_d
    const/16 v19, 0x133

    move/from16 v0, v19

    if-eq v14, v0, :cond_0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    goto/16 :goto_0

    .end local v15    # "sameHost":Z
    .end local v16    # "sameProtocol":Z
    :cond_e
    new-instance v19, Ljava/net/NoRouteToHostException;

    const-string v20, "Unsupported protocol redirect"

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    .restart local v16    # "sameProtocol":Z
    :cond_f
    new-instance v19, Ljava/net/NoRouteToHostException;

    const-string v20, "Cross-protocol redirects are disallowed"

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    .restart local v15    # "sameHost":Z
    :cond_10
    new-instance v19, Ljava/net/NoRouteToHostException;

    const-string v20, "Cross-domain redirects are disallowed"

    invoke-direct/range {v19 .. v20}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v19

    .end local v10    # "location":Ljava/lang/String;
    .end local v11    # "method":Ljava/lang/String;
    .end local v15    # "sameHost":Z
    .end local v16    # "sameProtocol":Z
    :cond_11
    const/16 v19, 0xc8

    move/from16 v0, v19

    if-eq v14, v0, :cond_12

    new-instance v19, Ljava/io/IOException;

    invoke-direct/range {v19 .. v19}, Ljava/io/IOException;-><init>()V

    throw v19

    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mTotalSize:J

    goto/16 :goto_3

    :cond_13
    new-instance v19, Ljava/io/BufferedInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/media/MediaHTTPConnection;->mInputStream:Ljava/io/InputStream;

    move-wide/from16 v0, p1

    move-object/from16 v2, p0

    iput-wide v0, v2, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    .restart local v4    # "contentRange":Ljava/lang/String;
    .restart local v9    # "lastSlashPos":I
    .restart local v17    # "total":Ljava/lang/String;
    :catch_1
    move-exception v6

    .local v6, "e":Ljava/lang/NumberFormatException;
    goto/16 :goto_3
.end method

.method private teardownConnection()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    iget-object v0, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    iput-object v1, p0, Landroid/media/MediaHTTPConnection;->mInputStream:Ljava/io/InputStream;

    iget-object v0, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v1, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/media/MediaHTTPConnection;->mCurrentOffset:J

    :cond_0
    return-void
.end method


# virtual methods
.method public connect(Ljava/lang/String;Ljava/lang/String;)Landroid/os/IBinder;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "headers"    # Ljava/lang/String;

    .prologue
    :try_start_0
    invoke-virtual {p0}, Landroid/media/MediaHTTPConnection;->disconnect()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/media/MediaHTTPConnection;->mAllowCrossDomainRedirect:Z

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    invoke-direct {p0, p2}, Landroid/media/MediaHTTPConnection;->convertHeaderStringToMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Landroid/media/MediaHTTPConnection;->mHeaders:Ljava/util/Map;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {p0}, Landroid/media/MediaHTTPConnection;->native_getIMemory()Landroid/os/IBinder;

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/net/MalformedURLException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public disconnect()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/media/MediaHTTPConnection;->teardownConnection()V

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mHeaders:Ljava/util/Map;

    iput-object v0, p0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    return-void
.end method

.method protected finalize()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/media/MediaHTTPConnection;->native_finalize()V

    return-void
.end method

.method public getMIMEType()Ljava/lang/String;
    .locals 4

    .prologue
    iget-object v1, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    if-nez v1, :cond_0

    const-wide/16 v2, 0x0

    :try_start_0
    invoke-direct {p0, v2, v3}, Landroid/media/MediaHTTPConnection;->seekTo(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    iget-object v1, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v1, "application/octet-stream"

    return-object v1
.end method

.method public getSize()J
    .locals 4

    .prologue
    iget-object v1, p0, Landroid/media/MediaHTTPConnection;->mConnection:Ljava/net/HttpURLConnection;

    if-nez v1, :cond_0

    const-wide/16 v2, 0x0

    :try_start_0
    invoke-direct {p0, v2, v3}, Landroid/media/MediaHTTPConnection;->seekTo(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    iget-wide v2, p0, Landroid/media/MediaHTTPConnection;->mTotalSize:J

    return-wide v2

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-wide/16 v2, -0x1

    return-wide v2
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/media/MediaHTTPConnection;->mURL:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readAt(JI)I
    .locals 1
    .param p1, "offset"    # J
    .param p3, "size"    # I

    .prologue
    invoke-direct {p0, p1, p2, p3}, Landroid/media/MediaHTTPConnection;->native_readAt(JI)I

    move-result v0

    return v0
.end method
