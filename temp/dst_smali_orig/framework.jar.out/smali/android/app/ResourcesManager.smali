.class public Landroid/app/ResourcesManager;
.super Ljava/lang/Object;
.source "ResourcesManager.java"


# static fields
.field private static final DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "ResourcesManager"

.field private static sResourcesManager:Landroid/app/ResourcesManager;


# instance fields
.field private final mActiveResources:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/content/res/ResourcesKey;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/res/Resources;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mDisplays:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/view/DisplayAdjustments;",
            ">;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/Display;",
            ">;>;"
        }
    .end annotation
.end field

.field mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

.field mResConfiguration:Landroid/content/res/Configuration;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/app/ResourcesManager;->mDisplays:Landroid/util/ArrayMap;

    return-void
.end method

.method public static getInstance()Landroid/app/ResourcesManager;
    .locals 2

    .prologue
    const-class v1, Landroid/app/ResourcesManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;

    if-nez v0, :cond_0

    new-instance v0, Landroid/app/ResourcesManager;

    invoke-direct {v0}, Landroid/app/ResourcesManager;-><init>()V

    sput-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;

    :cond_0
    sget-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public applyCompatConfiguration(ILandroid/content/res/Configuration;)Z
    .locals 1
    .param p1, "displayDensity"    # I
    .param p2, "compatConfiguration"    # Landroid/content/res/Configuration;

    .prologue
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v0}, Landroid/content/res/CompatibilityInfo;->supportsScreen()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/CompatibilityInfo;->applyToConfiguration(ILandroid/content/res/Configuration;)V

    const/4 v0, 0x1

    return v0
.end method

.method final applyConfigurationToResourcesLocked(Landroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;)Z
    .locals 12
    .param p1, "config"    # Landroid/content/res/Configuration;
    .param p2, "compat"    # Landroid/content/res/CompatibilityInfo;

    .prologue
    const/4 v11, 0x0

    iget-object v10, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    if-nez v10, :cond_0

    new-instance v10, Landroid/content/res/Configuration;

    invoke-direct {v10}, Landroid/content/res/Configuration;-><init>()V

    iput-object v10, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    :cond_0
    iget-object v10, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v10, p1}, Landroid/content/res/Configuration;->isOtherSeqNewer(Landroid/content/res/Configuration;)Z

    move-result v10

    if-nez v10, :cond_1

    if-nez p2, :cond_1

    return v11

    :cond_1
    iget-object v10, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v10, p1}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    move-result v0

    .local v0, "changes":I
    iget-object v10, p0, Landroid/app/ResourcesManager;->mDisplays:Landroid/util/ArrayMap;

    invoke-virtual {v10}, Landroid/util/ArrayMap;->clear()V

    invoke-virtual {p0}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked()Landroid/util/DisplayMetrics;

    move-result-object v1

    .local v1, "defaultDisplayMetrics":Landroid/util/DisplayMetrics;
    if-eqz p2, :cond_2

    iget-object v10, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    if-eqz v10, :cond_8

    iget-object v10, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v10, p2}, Landroid/content/res/CompatibilityInfo;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    :cond_2
    :goto_0
    iget-object v10, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    if-eqz v10, :cond_3

    iget-object v10, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-static {v10}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    :cond_3
    invoke-static {p1, v1, p2}, Landroid/content/res/Resources;->updateSystemConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    invoke-static {}, Landroid/app/ApplicationPackageManager;->configurationChanged()V

    const/4 v9, 0x0

    .local v9, "tmpConfig":Landroid/content/res/Configuration;
    iget-object v10, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v10}, Landroid/util/ArrayMap;->size()I

    move-result v10

    add-int/lit8 v5, v10, -0x1

    .end local v9    # "tmpConfig":Landroid/content/res/Configuration;
    .local v5, "i":I
    :goto_1
    if-ltz v5, :cond_c

    iget-object v10, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v10, v5}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/res/ResourcesKey;

    .local v7, "key":Landroid/content/res/ResourcesKey;
    iget-object v10, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v10, v5}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/ref/WeakReference;

    invoke-virtual {v10}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/res/Resources;

    .local v8, "r":Landroid/content/res/Resources;
    if-eqz v8, :cond_b

    iget v2, v7, Landroid/content/res/ResourcesKey;->mDisplayId:I

    .local v2, "displayId":I
    if-nez v2, :cond_9

    const/4 v6, 0x1

    .local v6, "isDefaultDisplay":Z
    :goto_2
    move-object v3, v1

    .local v3, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v7}, Landroid/content/res/ResourcesKey;->hasOverrideConfiguration()Z

    move-result v4

    .local v4, "hasOverrideConfiguration":Z
    if-eqz v6, :cond_4

    if-eqz v4, :cond_a

    :cond_4
    if-nez v9, :cond_5

    new-instance v9, Landroid/content/res/Configuration;

    invoke-direct {v9}, Landroid/content/res/Configuration;-><init>()V

    :cond_5
    invoke-virtual {v9, p1}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    if-nez v6, :cond_6

    invoke-virtual {p0, v2}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-virtual {p0, v3, v9}, Landroid/app/ResourcesManager;->applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    :cond_6
    if-eqz v4, :cond_7

    iget-object v10, v7, Landroid/content/res/ResourcesKey;->mOverrideConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v9, v10}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    :cond_7
    invoke-virtual {v8, v9, v3, p2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    .end local v2    # "displayId":I
    .end local v3    # "dm":Landroid/util/DisplayMetrics;
    .end local v4    # "hasOverrideConfiguration":Z
    .end local v6    # "isDefaultDisplay":Z
    :goto_3
    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    .end local v5    # "i":I
    .end local v7    # "key":Landroid/content/res/ResourcesKey;
    .end local v8    # "r":Landroid/content/res/Resources;
    :cond_8
    iput-object p2, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    or-int/lit16 v0, v0, 0xd00

    goto :goto_0

    .restart local v2    # "displayId":I
    .restart local v5    # "i":I
    .restart local v7    # "key":Landroid/content/res/ResourcesKey;
    .restart local v8    # "r":Landroid/content/res/Resources;
    :cond_9
    const/4 v6, 0x0

    .restart local v6    # "isDefaultDisplay":Z
    goto :goto_2

    .restart local v3    # "dm":Landroid/util/DisplayMetrics;
    .restart local v4    # "hasOverrideConfiguration":Z
    :cond_a
    invoke-virtual {v8, p1, v3, p2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    goto :goto_3

    .end local v2    # "displayId":I
    .end local v3    # "dm":Landroid/util/DisplayMetrics;
    .end local v4    # "hasOverrideConfiguration":Z
    .end local v6    # "isDefaultDisplay":Z
    :cond_b
    iget-object v10, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v10, v5}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    goto :goto_3

    .end local v7    # "key":Landroid/content/res/ResourcesKey;
    .end local v8    # "r":Landroid/content/res/Resources;
    :cond_c
    if-eqz v0, :cond_d

    const/4 v10, 0x1

    :goto_4
    return v10

    :cond_d
    move v10, v11

    goto :goto_4
.end method

.method final applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "dm"    # Landroid/util/DisplayMetrics;
    .param p2, "config"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v3, 0x1

    iput v3, p2, Landroid/content/res/Configuration;->touchscreen:I

    iget v1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v1, p2, Landroid/content/res/Configuration;->densityDpi:I

    iget v1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    iget v2, p1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    iget v2, p1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    iget v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    invoke-static {v1}, Landroid/content/res/Configuration;->resetScreenLayout(I)I

    move-result v0

    .local v0, "sl":I
    iget v1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v1, v2, :cond_0

    const/4 v1, 0x2

    iput v1, p2, Landroid/content/res/Configuration;->orientation:I

    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v2, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-static {v0, v1, v2}, Landroid/content/res/Configuration;->reduceScreenLayout(III)I

    move-result v1

    iput v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    :goto_0
    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatScreenWidthDp:I

    iget v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatScreenHeightDp:I

    iget v1, p2, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatSmallestScreenWidthDp:I

    return-void

    :cond_0
    iput v3, p2, Landroid/content/res/Configuration;->orientation:I

    iget v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    iget v2, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    invoke-static {v0, v1, v2}, Landroid/content/res/Configuration;->reduceScreenLayout(III)I

    move-result v1

    iput v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    goto :goto_0
.end method

.method public getAdjustedDisplay(ILandroid/view/DisplayAdjustments;)Landroid/view/Display;
    .locals 7
    .param p1, "displayId"    # I
    .param p2, "displayAdjustments"    # Landroid/view/DisplayAdjustments;

    .prologue
    const/4 v6, 0x0

    if-eqz p2, :cond_0

    new-instance v1, Landroid/view/DisplayAdjustments;

    invoke-direct {v1, p2}, Landroid/view/DisplayAdjustments;-><init>(Landroid/view/DisplayAdjustments;)V

    .local v1, "displayAdjustmentsCopy":Landroid/view/DisplayAdjustments;
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v3

    .local v3, "key":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Landroid/view/DisplayAdjustments;>;"
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Landroid/app/ResourcesManager;->mDisplays:Landroid/util/ArrayMap;

    invoke-virtual {v5, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/WeakReference;

    .local v4, "wd":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/Display;>;"
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Display;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v0, "display":Landroid/view/Display;
    if-eqz v0, :cond_1

    monitor-exit p0

    return-object v0

    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "displayAdjustmentsCopy":Landroid/view/DisplayAdjustments;
    .end local v3    # "key":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Landroid/view/DisplayAdjustments;>;"
    .end local v4    # "wd":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/Display;>;"
    :cond_0
    new-instance v1, Landroid/view/DisplayAdjustments;

    invoke-direct {v1}, Landroid/view/DisplayAdjustments;-><init>()V

    goto :goto_0

    .restart local v1    # "displayAdjustmentsCopy":Landroid/view/DisplayAdjustments;
    .restart local v3    # "key":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Landroid/view/DisplayAdjustments;>;"
    .restart local v4    # "wd":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/Display;>;"
    :cond_1
    :try_start_1
    invoke-static {}, Landroid/hardware/display/DisplayManagerGlobal;->getInstance()Landroid/hardware/display/DisplayManagerGlobal;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .local v2, "dm":Landroid/hardware/display/DisplayManagerGlobal;
    if-nez v2, :cond_2

    monitor-exit p0

    return-object v6

    :cond_2
    :try_start_2
    iget-object v5, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Landroid/view/DisplayAdjustments;

    invoke-virtual {v2, p1, v5}, Landroid/hardware/display/DisplayManagerGlobal;->getCompatibleDisplay(ILandroid/view/DisplayAdjustments;)Landroid/view/Display;

    move-result-object v0

    .restart local v0    # "display":Landroid/view/Display;
    if-eqz v0, :cond_3

    iget-object v5, p0, Landroid/app/ResourcesManager;->mDisplays:Landroid/util/ArrayMap;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v3, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    monitor-exit p0

    return-object v0

    .end local v0    # "display":Landroid/view/Display;
    .end local v2    # "dm":Landroid/hardware/display/DisplayManagerGlobal;
    .end local v4    # "wd":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/Display;>;"
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public getConfiguration()Landroid/content/res/Configuration;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    return-object v0
.end method

.method getDisplayMetricsLocked()Landroid/util/DisplayMetrics;
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v0

    return-object v0
.end method

.method getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;
    .locals 3
    .param p1, "displayId"    # I

    .prologue
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .local v1, "dm":Landroid/util/DisplayMetrics;
    sget-object v2, Landroid/view/DisplayAdjustments;->DEFAULT_DISPLAY_ADJUSTMENTS:Landroid/view/DisplayAdjustments;

    invoke-virtual {p0, p1, v2}, Landroid/app/ResourcesManager;->getAdjustedDisplay(ILandroid/view/DisplayAdjustments;)Landroid/view/Display;

    move-result-object v0

    .local v0, "display":Landroid/view/Display;
    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v1}, Landroid/util/DisplayMetrics;->setToDefaults()V

    goto :goto_0
.end method

.method getTopLevelResources(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ILandroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;)Landroid/content/res/Resources;
    .locals 21
    .param p1, "resDir"    # Ljava/lang/String;
    .param p2, "splitResDirs"    # [Ljava/lang/String;
    .param p3, "overlayDirs"    # [Ljava/lang/String;
    .param p4, "libDirs"    # [Ljava/lang/String;
    .param p5, "displayId"    # I
    .param p6, "overrideConfiguration"    # Landroid/content/res/Configuration;
    .param p7, "compatInfo"    # Landroid/content/res/CompatibilityInfo;

    .prologue
    move-object/from16 v0, p7

    iget v13, v0, Landroid/content/res/CompatibilityInfo;->applicationScale:F

    .local v13, "scale":F
    if-eqz p6, :cond_0

    new-instance v11, Landroid/content/res/Configuration;

    move-object/from16 v0, p6

    invoke-direct {v11, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    :goto_0
    new-instance v9, Landroid/content/res/ResourcesKey;

    move-object/from16 v0, p1

    move/from16 v1, p5

    invoke-direct {v9, v0, v1, v11, v13}, Landroid/content/res/ResourcesKey;-><init>(Ljava/lang/String;ILandroid/content/res/Configuration;F)V

    .local v9, "key":Landroid/content/res/ResourcesKey;
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/ref/WeakReference;

    .local v15, "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    if-eqz v15, :cond_1

    invoke-virtual {v15}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/res/Resources;

    :goto_1
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetManager;->isUpToDate()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v16

    if-eqz v16, :cond_2

    monitor-exit p0

    return-object v12

    .end local v9    # "key":Landroid/content/res/ResourcesKey;
    .end local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :cond_0
    const/4 v11, 0x0

    .local v11, "overrideConfigCopy":Landroid/content/res/Configuration;
    goto :goto_0

    .end local v11    # "overrideConfigCopy":Landroid/content/res/Configuration;
    .restart local v9    # "key":Landroid/content/res/ResourcesKey;
    .restart local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :cond_1
    const/4 v12, 0x0

    .local v12, "r":Landroid/content/res/Resources;
    goto :goto_1

    .end local v12    # "r":Landroid/content/res/Resources;
    :cond_2
    monitor-exit p0

    new-instance v2, Landroid/content/res/AssetManager;

    invoke-direct {v2}, Landroid/content/res/AssetManager;-><init>()V

    .local v2, "assets":Landroid/content/res/AssetManager;
    if-eqz p1, :cond_3

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v16

    if-nez v16, :cond_3

    const/16 v16, 0x0

    return-object v16

    .end local v2    # "assets":Landroid/content/res/AssetManager;
    .end local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catchall_0
    move-exception v16

    monitor-exit p0

    throw v16

    .restart local v2    # "assets":Landroid/content/res/AssetManager;
    .restart local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :cond_3
    if-eqz p2, :cond_5

    const/16 v16, 0x0

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v17, v0

    :goto_2
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_5

    aget-object v14, p2, v16

    .local v14, "splitResDir":Ljava/lang/String;
    invoke-virtual {v2, v14}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v18

    if-nez v18, :cond_4

    const/16 v16, 0x0

    return-object v16

    :cond_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .end local v14    # "splitResDir":Ljava/lang/String;
    :cond_5
    if-eqz p3, :cond_6

    const/16 v16, 0x0

    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v17, v0

    :goto_3
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_6

    aget-object v7, p3, v16

    .local v7, "idmapPath":Ljava/lang/String;
    invoke-virtual {v2, v7}, Landroid/content/res/AssetManager;->addOverlayPath(Ljava/lang/String;)I

    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    .end local v7    # "idmapPath":Ljava/lang/String;
    :cond_6
    if-eqz p4, :cond_8

    const/16 v16, 0x0

    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v17, v0

    :goto_4
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_8

    aget-object v10, p4, v16

    .local v10, "libDir":Ljava/lang/String;
    const-string v18, ".apk"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_7

    invoke-virtual {v2, v10}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v18

    if-nez v18, :cond_7

    const-string v18, "ResourcesManager"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Asset path \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\' does not exist or contains no resources."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .end local v10    # "libDir":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v4

    .local v4, "dm":Landroid/util/DisplayMetrics;
    if-nez p5, :cond_c

    const/4 v8, 0x1

    .local v8, "isDefaultDisplay":Z
    :goto_5
    invoke-virtual {v9}, Landroid/content/res/ResourcesKey;->hasOverrideConfiguration()Z

    move-result v6

    .local v6, "hasOverrideConfig":Z
    if-eqz v8, :cond_9

    if-eqz v6, :cond_d

    :cond_9
    new-instance v3, Landroid/content/res/Configuration;

    invoke-virtual/range {p0 .. p0}, Landroid/app/ResourcesManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .local v3, "config":Landroid/content/res/Configuration;
    if-nez v8, :cond_a

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v3}, Landroid/app/ResourcesManager;->applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    :cond_a
    if-eqz v6, :cond_b

    iget-object v0, v9, Landroid/content/res/ResourcesKey;->mOverrideConfiguration:Landroid/content/res/Configuration;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    :cond_b
    :goto_6
    new-instance v12, Landroid/content/res/Resources;

    move-object/from16 v0, p7

    invoke-direct {v12, v2, v4, v3, v0}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;)V

    .local v12, "r":Landroid/content/res/Resources;
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    check-cast v15, Ljava/lang/ref/WeakReference;

    .restart local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    if-eqz v15, :cond_e

    invoke-virtual {v15}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/res/Resources;

    :goto_7
    if-eqz v5, :cond_f

    invoke-virtual {v5}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetManager;->isUpToDate()Z

    move-result v16

    if-eqz v16, :cond_f

    invoke-virtual {v12}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/AssetManager;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p0

    return-object v5

    .end local v3    # "config":Landroid/content/res/Configuration;
    .end local v6    # "hasOverrideConfig":Z
    .end local v8    # "isDefaultDisplay":Z
    .end local v12    # "r":Landroid/content/res/Resources;
    :cond_c
    const/4 v8, 0x0

    .restart local v8    # "isDefaultDisplay":Z
    goto :goto_5

    .restart local v6    # "hasOverrideConfig":Z
    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/app/ResourcesManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    .restart local v3    # "config":Landroid/content/res/Configuration;
    goto :goto_6

    .restart local v12    # "r":Landroid/content/res/Resources;
    :cond_e
    const/4 v5, 0x0

    .local v5, "existing":Landroid/content/res/Resources;
    goto :goto_7

    .end local v5    # "existing":Landroid/content/res/Resources;
    :cond_f
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/ref/WeakReference;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v9, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-object v12

    .end local v15    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catchall_1
    move-exception v16

    monitor-exit p0

    throw v16
.end method
