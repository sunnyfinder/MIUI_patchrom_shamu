.class final Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;
.super Ljava/lang/Object;
.source "TouchExplorer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/accessibility/TouchExplorer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PerformLongPressDelayed"
.end annotation


# instance fields
.field private mEvent:Landroid/view/MotionEvent;

.field private mPolicyFlags:I

.field final synthetic this$0:Lcom/android/server/accessibility/TouchExplorer;


# direct methods
.method static synthetic -wrap0(Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;)Z
    .locals 1

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->isPending()Z

    move-result v0

    return v0
.end method

.method private constructor <init>(Lcom/android/server/accessibility/TouchExplorer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/accessibility/TouchExplorer;

    .prologue
    iput-object p1, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/accessibility/TouchExplorer;Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/accessibility/TouchExplorer;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;-><init>(Lcom/android/server/accessibility/TouchExplorer;)V

    return-void
.end method

.method private clear()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mPolicyFlags:I

    return-void
.end method

.method private isPending()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->-get3(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->-get3(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->clear()V

    :cond_0
    return-void
.end method

.method public post(Landroid/view/MotionEvent;I)V
    .locals 4
    .param p1, "prototype"    # Landroid/view/MotionEvent;
    .param p2, "policyFlags"    # I

    .prologue
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    iput p2, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mPolicyFlags:I

    iget-object v0, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v0}, Lcom/android/server/accessibility/TouchExplorer;->-get3(Lcom/android/server/accessibility/TouchExplorer;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public run()V
    .locals 7

    .prologue
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v4}, Lcom/android/server/accessibility/TouchExplorer;->-get5(Lcom/android/server/accessibility/TouchExplorer;)Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/server/accessibility/TouchExplorer$ReceivedPointerTracker;->getLastReceivedEvent()Landroid/view/MotionEvent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-nez v4, :cond_0

    return-void

    :cond_0
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    iget-object v5, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .local v1, "pointerId":I
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v4, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    .local v2, "pointerIndex":I
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v4}, Lcom/android/server/accessibility/TouchExplorer;->-get11(Lcom/android/server/accessibility/TouchExplorer;)Landroid/graphics/Point;

    move-result-object v0

    .local v0, "clickLocation":Landroid/graphics/Point;
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v4, v0}, Lcom/android/server/accessibility/TouchExplorer;->-wrap0(Lcom/android/server/accessibility/TouchExplorer;Landroid/graphics/Point;)I

    move-result v3

    .local v3, "result":I
    if-nez v3, :cond_1

    return-void

    :cond_1
    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    invoke-static {v4, v1}, Lcom/android/server/accessibility/TouchExplorer;->-set3(Lcom/android/server/accessibility/TouchExplorer;I)I

    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    iget-object v5, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v5, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    float-to-int v5, v5

    iget v6, v0, Landroid/graphics/Point;->x:I

    sub-int/2addr v5, v6

    invoke-static {v4, v5}, Lcom/android/server/accessibility/TouchExplorer;->-set1(Lcom/android/server/accessibility/TouchExplorer;I)I

    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    iget-object v5, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v5, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    float-to-int v5, v5

    iget v6, v0, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v6

    invoke-static {v4, v5}, Lcom/android/server/accessibility/TouchExplorer;->-set2(Lcom/android/server/accessibility/TouchExplorer;I)I

    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    iget v5, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mPolicyFlags:I

    invoke-static {v4, v5}, Lcom/android/server/accessibility/TouchExplorer;->-wrap4(Lcom/android/server/accessibility/TouchExplorer;I)V

    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    const/4 v5, 0x4

    invoke-static {v4, v5}, Lcom/android/server/accessibility/TouchExplorer;->-set0(Lcom/android/server/accessibility/TouchExplorer;I)I

    iget-object v4, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->this$0:Lcom/android/server/accessibility/TouchExplorer;

    iget-object v5, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mEvent:Landroid/view/MotionEvent;

    iget v6, p0, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->mPolicyFlags:I

    invoke-static {v4, v5, v6}, Lcom/android/server/accessibility/TouchExplorer;->-wrap3(Lcom/android/server/accessibility/TouchExplorer;Landroid/view/MotionEvent;I)V

    invoke-direct {p0}, Lcom/android/server/accessibility/TouchExplorer$PerformLongPressDelayed;->clear()V

    return-void
.end method
