.class public Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoStubImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoIcsImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr1Impl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr2Impl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoKitKatImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi21Impl;,
        Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi22Impl;
    }
.end annotation


# static fields
.field public static final ACTION_ACCESSIBILITY_FOCUS:I = 0x40

.field public static final ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN:Ljava/lang/String; = "ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN"

.field public static final ACTION_ARGUMENT_HTML_ELEMENT_STRING:Ljava/lang/String; = "ACTION_ARGUMENT_HTML_ELEMENT_STRING"

.field public static final ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT:Ljava/lang/String; = "ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT"

.field public static final ACTION_ARGUMENT_SELECTION_END_INT:Ljava/lang/String; = "ACTION_ARGUMENT_SELECTION_END_INT"

.field public static final ACTION_ARGUMENT_SELECTION_START_INT:Ljava/lang/String; = "ACTION_ARGUMENT_SELECTION_START_INT"

.field public static final ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE:Ljava/lang/String; = "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

.field public static final ACTION_CLEAR_ACCESSIBILITY_FOCUS:I = 0x80

.field public static final ACTION_CLEAR_FOCUS:I = 0x2

.field public static final ACTION_CLEAR_SELECTION:I = 0x8

.field public static final ACTION_CLICK:I = 0x10

.field public static final ACTION_COLLAPSE:I = 0x80000

.field public static final ACTION_COPY:I = 0x4000

.field public static final ACTION_CUT:I = 0x10000

.field public static final ACTION_DISMISS:I = 0x100000

.field public static final ACTION_EXPAND:I = 0x40000

.field public static final ACTION_FOCUS:I = 0x1

.field public static final ACTION_LONG_CLICK:I = 0x20

.field public static final ACTION_NEXT_AT_MOVEMENT_GRANULARITY:I = 0x100

.field public static final ACTION_NEXT_HTML_ELEMENT:I = 0x400

.field public static final ACTION_PASTE:I = 0x8000

.field public static final ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY:I = 0x200

.field public static final ACTION_PREVIOUS_HTML_ELEMENT:I = 0x800

.field public static final ACTION_SCROLL_BACKWARD:I = 0x2000

.field public static final ACTION_SCROLL_FORWARD:I = 0x1000

.field public static final ACTION_SELECT:I = 0x4

.field public static final ACTION_SET_SELECTION:I = 0x20000

.field public static final ACTION_SET_TEXT:I = 0x200000

.field public static final FOCUS_ACCESSIBILITY:I = 0x2

.field public static final FOCUS_INPUT:I = 0x1

.field private static final IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

.field public static final MOVEMENT_GRANULARITY_CHARACTER:I = 0x1

.field public static final MOVEMENT_GRANULARITY_LINE:I = 0x4

.field public static final MOVEMENT_GRANULARITY_PAGE:I = 0x10

.field public static final MOVEMENT_GRANULARITY_PARAGRAPH:I = 0x8

.field public static final MOVEMENT_GRANULARITY_WORD:I = 0x2


# instance fields
.field private final mInfo:Ljava/lang/Object;


# direct methods
.method static synthetic -get0()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;
    .locals 1

    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .prologue
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi22Impl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi22Impl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    :goto_0
    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi21Impl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi21Impl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoKitKatImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoKitKatImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_3

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr2Impl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr2Impl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_4

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr1Impl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanMr1Impl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_5

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoJellybeanImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_6

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoIcsImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoIcsImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0

    :cond_6
    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoStubImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoStubImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    return-void
.end method

.method private static getActionSymbolicName(I)Ljava/lang/String;
    .locals 1
    .param p0, "action"    # I

    .prologue
    sparse-switch p0, :sswitch_data_0

    const-string v0, "ACTION_UNKNOWN"

    return-object v0

    :sswitch_0
    const-string v0, "ACTION_FOCUS"

    return-object v0

    :sswitch_1
    const-string v0, "ACTION_CLEAR_FOCUS"

    return-object v0

    :sswitch_2
    const-string v0, "ACTION_SELECT"

    return-object v0

    :sswitch_3
    const-string v0, "ACTION_CLEAR_SELECTION"

    return-object v0

    :sswitch_4
    const-string v0, "ACTION_CLICK"

    return-object v0

    :sswitch_5
    const-string v0, "ACTION_LONG_CLICK"

    return-object v0

    :sswitch_6
    const-string v0, "ACTION_ACCESSIBILITY_FOCUS"

    return-object v0

    :sswitch_7
    const-string v0, "ACTION_CLEAR_ACCESSIBILITY_FOCUS"

    return-object v0

    :sswitch_8
    const-string v0, "ACTION_NEXT_AT_MOVEMENT_GRANULARITY"

    return-object v0

    :sswitch_9
    const-string v0, "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY"

    return-object v0

    :sswitch_a
    const-string v0, "ACTION_NEXT_HTML_ELEMENT"

    return-object v0

    :sswitch_b
    const-string v0, "ACTION_PREVIOUS_HTML_ELEMENT"

    return-object v0

    :sswitch_c
    const-string v0, "ACTION_SCROLL_FORWARD"

    return-object v0

    :sswitch_d
    const-string v0, "ACTION_SCROLL_BACKWARD"

    return-object v0

    :sswitch_e
    const-string v0, "ACTION_CUT"

    return-object v0

    :sswitch_f
    const-string v0, "ACTION_COPY"

    return-object v0

    :sswitch_10
    const-string v0, "ACTION_PASTE"

    return-object v0

    :sswitch_11
    const-string v0, "ACTION_SET_SELECTION"

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x4 -> :sswitch_2
        0x8 -> :sswitch_3
        0x10 -> :sswitch_4
        0x20 -> :sswitch_5
        0x40 -> :sswitch_6
        0x80 -> :sswitch_7
        0x100 -> :sswitch_8
        0x200 -> :sswitch_9
        0x400 -> :sswitch_a
        0x800 -> :sswitch_b
        0x1000 -> :sswitch_c
        0x2000 -> :sswitch_d
        0x4000 -> :sswitch_f
        0x8000 -> :sswitch_10
        0x10000 -> :sswitch_e
        0x20000 -> :sswitch_11
    .end sparse-switch
.end method

.method public static obtain()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 1

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    invoke-interface {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->obtain()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public static obtain(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2
    .param p0, "info"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->obtain(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public static obtain(Landroid/view/View;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 1
    .param p0, "source"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->obtain(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public static obtain(Landroid/view/View;I)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 1
    .param p0, "root"    # Landroid/view/View;
    .param p1, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->obtain(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method static wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    invoke-direct {v0, p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public addAction(I)V
    .locals 2
    .param p1, "action"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->addAction(Ljava/lang/Object;I)V

    return-void
.end method

.method public addAction(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)V
    .locals 3
    .param p1, "action"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->-get0(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->addAction(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public addChild(Landroid/view/View;)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->addChild(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public addChild(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->addChild(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public canOpenPopup()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->canOpenPopup(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    if-ne p0, p1, :cond_0

    return v4

    :cond_0
    if-nez p1, :cond_1

    return v3

    :cond_1
    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    return v3

    :cond_2
    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .local v0, "other":Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    if-nez v1, :cond_3

    iget-object v1, v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    if-eqz v1, :cond_4

    return v3

    :cond_3
    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    iget-object v2, v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v3

    :cond_4
    return v4
.end method

.method public findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;>;"
    sget-object v5, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v6, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v5, v6, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->findAccessibilityNodeInfosByText(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .local v3, "infos":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "infoCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .local v1, "info":Ljava/lang/Object;
    new-instance v5, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    invoke-direct {v5, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;-><init>(Ljava/lang/Object;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v1    # "info":Ljava/lang/Object;
    :cond_0
    return-object v4
.end method

.method public findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "viewId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;",
            ">;"
        }
    .end annotation

    .prologue
    sget-object v4, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v5, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v4, v5, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->findAccessibilityNodeInfosByViewId(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .local v2, "nodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-eqz v2, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "node$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .local v0, "node":Ljava/lang/Object;
    new-instance v4, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    invoke-direct {v4, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v0    # "node":Ljava/lang/Object;
    :cond_0
    return-object v3

    .end local v1    # "node$iterator":Ljava/util/Iterator;
    .end local v3    # "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;>;"
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    return-object v4
.end method

.method public findFocus(I)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2
    .param p1, "focus"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->findFocus(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public focusSearch(I)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2
    .param p1, "direction"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->focusSearch(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getActionList()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    sget-object v5, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v6, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v5, v6}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getActionList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .local v2, "actions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-eqz v2, :cond_1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "actionCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .local v0, "action":Ljava/lang/Object;
    new-instance v5, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    invoke-direct {v5, v0, v7}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;-><init>(Ljava/lang/Object;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v0    # "action":Ljava/lang/Object;
    :cond_0
    return-object v4

    .end local v1    # "actionCount":I
    .end local v3    # "i":I
    .end local v4    # "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;>;"
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    return-object v5
.end method

.method public getActions()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getActions(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getBoundsInParent(Landroid/graphics/Rect;)V
    .locals 2
    .param p1, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getBoundsInParent(Ljava/lang/Object;Landroid/graphics/Rect;)V

    return-void
.end method

.method public getBoundsInScreen(Landroid/graphics/Rect;)V
    .locals 2
    .param p1, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getBoundsInScreen(Ljava/lang/Object;Landroid/graphics/Rect;)V

    return-void
.end method

.method public getChild(I)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2
    .param p1, "index"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getChild(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getChildCount()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getChildCount(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getClassName()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getClassName(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getCollectionInfo()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;
    .locals 4

    .prologue
    const/4 v3, 0x0

    sget-object v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v2, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getCollectionInfo(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "info":Ljava/lang/Object;
    if-nez v0, :cond_0

    return-object v3

    :cond_0
    new-instance v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;

    invoke-direct {v1, v0, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;-><init>(Ljava/lang/Object;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;)V

    return-object v1
.end method

.method public getCollectionItemInfo()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;
    .locals 4

    .prologue
    const/4 v3, 0x0

    sget-object v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v2, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getCollectionItemInfo(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "info":Ljava/lang/Object;
    if-nez v0, :cond_0

    return-object v3

    :cond_0
    new-instance v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    invoke-direct {v1, v0, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;-><init>(Ljava/lang/Object;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;)V

    return-object v1
.end method

.method public getContentDescription()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getContentDescription(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getError(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getExtras(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getInfo()Ljava/lang/Object;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    return-object v0
.end method

.method public getInputType()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getInputType(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getLabelFor()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getLabelFor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getLabeledBy()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getLabeledBy(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getLiveRegion()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getLiveRegion(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getMaxTextLength()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getMaxTextLength(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getMovementGranularities()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getMovementGranularities(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getPackageName()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getPackageName(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getParent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getRangeInfo()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;
    .locals 4

    .prologue
    const/4 v3, 0x0

    sget-object v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v2, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getRangeInfo(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "info":Ljava/lang/Object;
    if-nez v0, :cond_0

    return-object v3

    :cond_0
    new-instance v1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;

    invoke-direct {v1, v0, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;-><init>(Ljava/lang/Object;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;)V

    return-object v1
.end method

.method public getText()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getText(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTextSelectionEnd()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getTextSelectionEnd(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getTextSelectionStart()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getTextSelectionStart(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getTraversalAfter()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getTraversalAfter(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getTraversalBefore()Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getTraversalBefore(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getViewIdResourceName()Ljava/lang/String;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getViewIdResourceName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindow()Landroid/support/v4/view/accessibility/AccessibilityWindowInfoCompat;
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getWindow(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityWindowInfoCompat;->wrapNonNullInstance(Ljava/lang/Object;)Landroid/support/v4/view/accessibility/AccessibilityWindowInfoCompat;

    move-result-object v0

    return-object v0
.end method

.method public getWindowId()I
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->getWindowId(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public isAccessibilityFocused()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isAccessibilityFocused(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isCheckable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isCheckable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isChecked()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isChecked(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isClickable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isClickable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isContentInvalid()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isContentInvalid(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isDismissable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isDismissable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEditable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isEditable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEnabled()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isEnabled(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFocusable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isFocusable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFocused()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isFocused(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isLongClickable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isLongClickable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isMultiLine()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isMultiLine(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isPassword()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isPassword(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isScrollable()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isScrollable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSelected()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isSelected(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isVisibleToUser()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->isVisibleToUser(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public performAction(I)Z
    .locals 2
    .param p1, "action"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->performAction(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method public performAction(ILandroid/os/Bundle;)Z
    .locals 2
    .param p1, "action"    # I
    .param p2, "arguments"    # Landroid/os/Bundle;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->performAction(Ljava/lang/Object;ILandroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method public recycle()V
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->recycle(Ljava/lang/Object;)V

    return-void
.end method

.method public refresh()Z
    .locals 2

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->refresh(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAction(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)Z
    .locals 3
    .param p1, "action"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->-get0(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->removeAction(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeChild(Landroid/view/View;)Z
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->removeChild(Ljava/lang/Object;Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public removeChild(Landroid/view/View;I)Z
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->removeChild(Ljava/lang/Object;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public setAccessibilityFocused(Z)V
    .locals 2
    .param p1, "focused"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setAccessibilityFocused(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setBoundsInParent(Landroid/graphics/Rect;)V
    .locals 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setBoundsInParent(Ljava/lang/Object;Landroid/graphics/Rect;)V

    return-void
.end method

.method public setBoundsInScreen(Landroid/graphics/Rect;)V
    .locals 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setBoundsInScreen(Ljava/lang/Object;Landroid/graphics/Rect;)V

    return-void
.end method

.method public setCanOpenPopup(Z)V
    .locals 2
    .param p1, "opensPopup"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setCanOpenPopup(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setCheckable(Z)V
    .locals 2
    .param p1, "checkable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setCheckable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setChecked(Z)V
    .locals 2
    .param p1, "checked"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setChecked(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setClassName(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/CharSequence;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setClassName(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setClickable(Z)V
    .locals 2
    .param p1, "clickable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setClickable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setCollectionInfo(Ljava/lang/Object;)V
    .locals 3
    .param p1, "collectionInfo"    # Ljava/lang/Object;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;

    .end local p1    # "collectionInfo":Ljava/lang/Object;
    iget-object v2, p1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setCollectionInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setCollectionItemInfo(Ljava/lang/Object;)V
    .locals 3
    .param p1, "collectionItemInfo"    # Ljava/lang/Object;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    .end local p1    # "collectionItemInfo":Ljava/lang/Object;
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->-get0(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setCollectionItemInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "contentDescription"    # Ljava/lang/CharSequence;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setContentDescription(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setContentInvalid(Z)V
    .locals 2
    .param p1, "contentInvalid"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setContentInvalid(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setDismissable(Z)V
    .locals 2
    .param p1, "dismissable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setDismissable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setEditable(Z)V
    .locals 2
    .param p1, "editable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setEditable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setEnabled(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setError(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setFocusable(Z)V
    .locals 2
    .param p1, "focusable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setFocusable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setFocused(Z)V
    .locals 2
    .param p1, "focused"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setFocused(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setInputType(I)V
    .locals 2
    .param p1, "inputType"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setInputType(Ljava/lang/Object;I)V

    return-void
.end method

.method public setLabelFor(Landroid/view/View;)V
    .locals 2
    .param p1, "labeled"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLabelFor(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setLabelFor(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLabelFor(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setLabeledBy(Landroid/view/View;)V
    .locals 2
    .param p1, "label"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLabeledBy(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setLabeledBy(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLabeledBy(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setLiveRegion(I)V
    .locals 2
    .param p1, "mode"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLiveRegion(Ljava/lang/Object;I)V

    return-void
.end method

.method public setLongClickable(Z)V
    .locals 2
    .param p1, "longClickable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setLongClickable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setMaxTextLength(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setMaxTextLength(Ljava/lang/Object;I)V

    return-void
.end method

.method public setMovementGranularities(I)V
    .locals 2
    .param p1, "granularities"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setMovementGranularities(Ljava/lang/Object;I)V

    return-void
.end method

.method public setMultiLine(Z)V
    .locals 2
    .param p1, "multiLine"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setMultiLine(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setPackageName(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/CharSequence;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setPackageName(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setParent(Landroid/view/View;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setParent(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setParent(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setParent(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setPassword(Z)V
    .locals 2
    .param p1, "password"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setPassword(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setRangeInfo(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;)V
    .locals 3
    .param p1, "rangeInfo"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;->-get0(Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setRangeInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setScrollable(Z)V
    .locals 2
    .param p1, "scrollable"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setScrollable(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setSelected(Z)V
    .locals 2
    .param p1, "selected"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setSelected(Ljava/lang/Object;Z)V

    return-void
.end method

.method public setSource(Landroid/view/View;)V
    .locals 2
    .param p1, "source"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setSource(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setSource(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setSource(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setText(Ljava/lang/Object;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTextSelection(II)V
    .locals 2
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setTextSelection(Ljava/lang/Object;II)V

    return-void
.end method

.method public setTraversalAfter(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setTraversalAfter(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setTraversalAfter(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setTraversalAfter(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setTraversalBefore(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setTraversalBefore(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public setTraversalBefore(Landroid/view/View;I)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "virtualDescendantId"    # I

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setTraversalBefore(Ljava/lang/Object;Landroid/view/View;I)V

    return-void
.end method

.method public setViewIdResourceName(Ljava/lang/String;)V
    .locals 2
    .param p1, "viewId"    # Ljava/lang/String;

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setViewIdResourceName(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public setVisibleToUser(Z)V
    .locals 2
    .param p1, "visibleToUser"    # Z

    .prologue
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;

    iget-object v1, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->mInfo:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;->setVisibleToUser(Ljava/lang/Object;Z)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .local v3, "builder":Ljava/lang/StringBuilder;
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .local v2, "bounds":Landroid/graphics/Rect;
    invoke-virtual {p0, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getBoundsInParent(Landroid/graphics/Rect;)V

    const-string v4, "; boundsInParent: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getBoundsInScreen(Landroid/graphics/Rect;)V

    const-string v4, "; boundsInScreen: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "; packageName: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v4, "; className: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getClassName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v4, "; text: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v4, "; contentDescription: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v4, "; viewId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "; checkable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isCheckable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; checked: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isChecked()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; focusable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isFocusable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; focused: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isFocused()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; selected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isSelected()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; clickable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isClickable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; longClickable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isLongClickable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; enabled: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; password: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isPassword()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; scrollable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->isScrollable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, "; ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getActions()I

    move-result v1

    .local v1, "actionBits":I
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v4

    const/4 v5, 0x1

    shl-int v0, v5, v4

    .local v0, "action":I
    not-int v4, v0

    and-int/2addr v1, v4

    invoke-static {v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->getActionSymbolicName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v1, :cond_0

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .end local v0    # "action":I
    :cond_1
    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
