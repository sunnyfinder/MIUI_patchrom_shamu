.class public Lcom/android/server/policy/PolicyControl;
.super Ljava/lang/Object;
.source "PolicyControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/policy/PolicyControl$Filter;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final NAME_IMMERSIVE_FULL:Ljava/lang/String; = "immersive.full"

.field private static final NAME_IMMERSIVE_NAVIGATION:Ljava/lang/String; = "immersive.navigation"

.field private static final NAME_IMMERSIVE_PRECONFIRMATIONS:Ljava/lang/String; = "immersive.preconfirms"

.field private static final NAME_IMMERSIVE_STATUS:Ljava/lang/String; = "immersive.status"

.field private static TAG:Ljava/lang/String;

.field private static sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

.field private static sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

.field private static sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

.field private static sSettingValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "PolicyControl"

    sput-object v0, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/policy/PolicyControl;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustClearableFlags(Landroid/view/WindowManagerPolicy$WindowState;I)I
    .locals 2
    .param p0, "win"    # Landroid/view/WindowManagerPolicy$WindowState;
    .param p1, "clearableFlags"    # I

    .prologue
    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/view/WindowManagerPolicy$WindowState;->getAttrs()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .local v0, "attrs":Landroid/view/WindowManager$LayoutParams;
    :goto_0
    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v1, v0}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Landroid/view/WindowManager$LayoutParams;)Z

    move-result v1

    if-eqz v1, :cond_0

    and-int/lit8 p1, p1, -0x5

    :cond_0
    return p1

    .end local v0    # "attrs":Landroid/view/WindowManager$LayoutParams;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static disableImmersiveConfirmation(Ljava/lang/String;)Z
    .locals 1
    .param p0, "pkg"    # Ljava/lang/String;

    .prologue
    sget-object v0, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v0, p0}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-static {}, Landroid/app/ActivityManager;->isRunningInTestHarness()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static dump(Ljava/lang/String;Lcom/android/server/policy/PolicyControl$Filter;Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/android/server/policy/PolicyControl$Filter;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "pw"    # Ljava/io/PrintWriter;

    .prologue
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "PolicyControl."

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/16 v0, 0x3d

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(C)V

    if-nez p1, :cond_0

    const-string v0, "null"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1, p3}, Lcom/android/server/policy/PolicyControl$Filter;->dump(Ljava/io/PrintWriter;)V

    invoke-virtual {p3}, Ljava/io/PrintWriter;->println()V

    goto :goto_0
.end method

.method public static dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    const-string v0, "sImmersiveStatusFilter"

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-static {v0, v1, p0, p1}, Lcom/android/server/policy/PolicyControl;->dump(Ljava/lang/String;Lcom/android/server/policy/PolicyControl$Filter;Ljava/lang/String;Ljava/io/PrintWriter;)V

    const-string v0, "sImmersiveNavigationFilter"

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-static {v0, v1, p0, p1}, Lcom/android/server/policy/PolicyControl;->dump(Ljava/lang/String;Lcom/android/server/policy/PolicyControl$Filter;Ljava/lang/String;Ljava/io/PrintWriter;)V

    const-string v0, "sImmersivePreconfirmationsFilter"

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-static {v0, v1, p0, p1}, Lcom/android/server/policy/PolicyControl;->dump(Ljava/lang/String;Lcom/android/server/policy/PolicyControl$Filter;Ljava/lang/String;Ljava/io/PrintWriter;)V

    return-void
.end method

.method public static getSystemUiVisibility(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)I
    .locals 2
    .param p0, "win"    # Landroid/view/WindowManagerPolicy$WindowState;
    .param p1, "attrs"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    if-eqz p1, :cond_2

    :goto_0
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/view/WindowManagerPolicy$WindowState;->getSystemUiVisibility()I

    move-result v0

    .local v0, "vis":I
    :goto_1
    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v1, p1}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Landroid/view/WindowManager$LayoutParams;)Z

    move-result v1

    if-eqz v1, :cond_0

    or-int/lit16 v0, v0, 0x1404

    const v1, -0x40000101    # -1.9999694f

    and-int/2addr v0, v1

    :cond_0
    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v1, p1}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Landroid/view/WindowManager$LayoutParams;)Z

    move-result v1

    if-eqz v1, :cond_1

    or-int/lit16 v0, v0, 0x1202

    const v1, 0x7ffffeff

    and-int/2addr v0, v1

    :cond_1
    return v0

    .end local v0    # "vis":I
    :cond_2
    invoke-interface {p0}, Landroid/view/WindowManagerPolicy$WindowState;->getAttrs()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    goto :goto_0

    :cond_3
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->systemUiVisibility:I

    goto :goto_1
.end method

.method public static getWindowFlags(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)I
    .locals 2
    .param p0, "win"    # Landroid/view/WindowManagerPolicy$WindowState;
    .param p1, "attrs"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    if-eqz p1, :cond_2

    :goto_0
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .local v0, "flags":I
    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v1, p1}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Landroid/view/WindowManager$LayoutParams;)Z

    move-result v1

    if-eqz v1, :cond_0

    or-int/lit16 v0, v0, 0x400

    const v1, -0x4000801

    and-int/2addr v0, v1

    :cond_0
    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v1, p1}, Lcom/android/server/policy/PolicyControl$Filter;->matches(Landroid/view/WindowManager$LayoutParams;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, -0x8000001

    and-int/2addr v0, v1

    :cond_1
    return v0

    .end local v0    # "flags":I
    :cond_2
    invoke-interface {p0}, Landroid/view/WindowManagerPolicy$WindowState;->getAttrs()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    goto :goto_0
.end method

.method public static reloadFromSetting(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    sget-boolean v2, Lcom/android/server/policy/PolicyControl;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    const-string v3, "reloadFromSetting()"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v1, 0x0

    .local v1, "value":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "policy_control"

    const/4 v4, -0x2

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/android/server/policy/PolicyControl;->sSettingValue:Ljava/lang/String;

    if-eqz v2, :cond_1

    sget-object v2, Lcom/android/server/policy/PolicyControl;->sSettingValue:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :goto_0
    return-void

    :cond_1
    invoke-static {v1}, Lcom/android/server/policy/PolicyControl;->setFilters(Ljava/lang/String;)V

    sput-object v1, Lcom/android/server/policy/PolicyControl;->sSettingValue:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    sget-object v2, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading policy control, value="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static setFilters(Ljava/lang/String;)V
    .locals 13
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x0

    sget-boolean v9, Lcom/android/server/policy/PolicyControl;->DEBUG:Z

    if-eqz v9, :cond_0

    sget-object v9, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "setFilters: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sput-object v12, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    sput-object v12, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    sput-object v12, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-eqz p0, :cond_6

    const-string v9, ":"

    invoke-virtual {p0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .local v7, "nvps":[Ljava/lang/String;
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_6

    aget-object v6, v0, v3

    .local v6, "nvp":Ljava/lang/String;
    const/16 v9, 0x3d

    invoke-virtual {v6, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .local v2, "i":I
    const/4 v9, -0x1

    if-ne v2, v9, :cond_2

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v9, 0x0

    invoke-virtual {v6, v9, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .local v5, "n":Ljava/lang/String;
    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .local v8, "v":Ljava/lang/String;
    const-string v9, "immersive.full"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-static {v8}, Lcom/android/server/policy/PolicyControl$Filter;->parse(Ljava/lang/String;)Lcom/android/server/policy/PolicyControl$Filter;

    move-result-object v1

    .local v1, "f":Lcom/android/server/policy/PolicyControl$Filter;
    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    sget-object v9, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-nez v9, :cond_1

    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    goto :goto_1

    .end local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    :cond_3
    const-string v9, "immersive.status"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-static {v8}, Lcom/android/server/policy/PolicyControl$Filter;->parse(Ljava/lang/String;)Lcom/android/server/policy/PolicyControl$Filter;

    move-result-object v1

    .restart local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    goto :goto_1

    .end local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    :cond_4
    const-string v9, "immersive.navigation"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-static {v8}, Lcom/android/server/policy/PolicyControl$Filter;->parse(Ljava/lang/String;)Lcom/android/server/policy/PolicyControl$Filter;

    move-result-object v1

    .restart local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    sget-object v9, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    if-nez v9, :cond_1

    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    goto :goto_1

    .end local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    :cond_5
    const-string v9, "immersive.preconfirms"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-static {v8}, Lcom/android/server/policy/PolicyControl$Filter;->parse(Ljava/lang/String;)Lcom/android/server/policy/PolicyControl$Filter;

    move-result-object v1

    .restart local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    sput-object v1, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    goto :goto_1

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "f":Lcom/android/server/policy/PolicyControl$Filter;
    .end local v2    # "i":I
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "n":Ljava/lang/String;
    .end local v6    # "nvp":Ljava/lang/String;
    .end local v7    # "nvps":[Ljava/lang/String;
    .end local v8    # "v":Ljava/lang/String;
    :cond_6
    sget-boolean v9, Lcom/android/server/policy/PolicyControl;->DEBUG:Z

    if-eqz v9, :cond_7

    sget-object v9, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "immersiveStatusFilter: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/android/server/policy/PolicyControl;->sImmersiveStatusFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v9, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "immersiveNavigationFilter: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/android/server/policy/PolicyControl;->sImmersiveNavigationFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v9, Lcom/android/server/policy/PolicyControl;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "immersivePreconfirmationsFilter: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/android/server/policy/PolicyControl;->sImmersivePreconfirmationsFilter:Lcom/android/server/policy/PolicyControl$Filter;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return-void
.end method
