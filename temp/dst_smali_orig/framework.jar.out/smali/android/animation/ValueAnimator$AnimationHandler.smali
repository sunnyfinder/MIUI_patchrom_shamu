.class public Landroid/animation/ValueAnimator$AnimationHandler;
.super Ljava/lang/Object;
.source "ValueAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "AnimationHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/animation/ValueAnimator$AnimationHandler$1;,
        Landroid/animation/ValueAnimator$AnimationHandler$2;
    }
.end annotation


# instance fields
.field final mAnimate:Ljava/lang/Runnable;

.field private mAnimationScheduled:Z

.field protected final mAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private final mChoreographer:Landroid/view/Choreographer;

.field final mCommit:Ljava/lang/Runnable;

.field protected final mDelayedAnims:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private final mEndingAnims:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private mLastFrameTime:J

.field protected final mPendingAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private final mReadyAnims:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private final mTmpAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Landroid/animation/ValueAnimator$AnimationHandler;)Landroid/view/Choreographer;
    .locals 1

    iget-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mChoreographer:Landroid/view/Choreographer;

    return-object v0
.end method

.method static synthetic -set0(Landroid/animation/ValueAnimator$AnimationHandler;Z)Z
    .locals 0

    iput-boolean p1, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimationScheduled:Z

    return p1
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mTmpAnimations:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mPendingAnimations:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mReadyAnims:Ljava/util/ArrayList;

    new-instance v0, Landroid/animation/ValueAnimator$AnimationHandler$1;

    invoke-direct {v0, p0}, Landroid/animation/ValueAnimator$AnimationHandler$1;-><init>(Landroid/animation/ValueAnimator$AnimationHandler;)V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimate:Ljava/lang/Runnable;

    new-instance v0, Landroid/animation/ValueAnimator$AnimationHandler$2;

    invoke-direct {v0, p0}, Landroid/animation/ValueAnimator$AnimationHandler$2;-><init>(Landroid/animation/ValueAnimator$AnimationHandler;)V

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mCommit:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mChoreographer:Landroid/view/Choreographer;

    return-void
.end method

.method synthetic constructor <init>(Landroid/animation/ValueAnimator$AnimationHandler;)V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/animation/ValueAnimator$AnimationHandler;-><init>()V

    return-void
.end method

.method private scheduleAnimation()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    iget-boolean v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimationScheduled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mChoreographer:Landroid/view/Choreographer;

    iget-object v1, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimate:Ljava/lang/Runnable;

    const/4 v2, 0x0

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    iput-boolean v3, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimationScheduled:Z

    :cond_0
    return-void
.end method


# virtual methods
.method commitAnimationFrame(J)V
    .locals 7
    .param p1, "frameTime"    # J

    .prologue
    iget-wide v4, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mLastFrameTime:J

    sub-long v0, p1, v4

    .local v0, "adjustment":J
    iget-object v4, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .local v3, "numAnims":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    iget-object v4, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v0, v1}, Landroid/animation/ValueAnimator;->commitAnimationFrame(J)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method doAnimationFrame(J)V
    .locals 13
    .param p1, "frameTime"    # J

    .prologue
    iput-wide p1, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mLastFrameTime:J

    :cond_0
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    .local v6, "pendingCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/ValueAnimator;>;"
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    .local v0, "anim":Landroid/animation/ValueAnimator;
    invoke-static {v0}, Landroid/animation/ValueAnimator;->-get0(Landroid/animation/ValueAnimator;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-nez v7, :cond_1

    invoke-static {v0, p0}, Landroid/animation/ValueAnimator;->-wrap1(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator$AnimationHandler;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .end local v0    # "anim":Landroid/animation/ValueAnimator;
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v6    # "pendingCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/ValueAnimator;>;"
    :cond_2
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, "numDelayedAnims":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    if-ge v2, v4, :cond_4

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    .restart local v0    # "anim":Landroid/animation/ValueAnimator;
    invoke-static {v0, p1, p2}, Landroid/animation/ValueAnimator;->-wrap0(Landroid/animation/ValueAnimator;J)Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mReadyAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v0    # "anim":Landroid/animation/ValueAnimator;
    :cond_4
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mReadyAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v5

    .local v5, "numReadyAnims":I
    if-lez v5, :cond_6

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v5, :cond_5

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mReadyAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    .restart local v0    # "anim":Landroid/animation/ValueAnimator;
    invoke-static {v0, p0}, Landroid/animation/ValueAnimator;->-wrap1(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator$AnimationHandler;)V

    const/4 v7, 0x1

    invoke-static {v0, v7}, Landroid/animation/ValueAnimator;->-set0(Landroid/animation/ValueAnimator;Z)Z

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .end local v0    # "anim":Landroid/animation/ValueAnimator;
    :cond_5
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mReadyAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    :cond_6
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    .local v3, "numAnims":I
    const/4 v2, 0x0

    :goto_4
    if-ge v2, v3, :cond_7

    iget-object v8, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mTmpAnimations:Ljava/util/ArrayList;

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/animation/ValueAnimator;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_7
    const/4 v2, 0x0

    :goto_5
    if-ge v2, v3, :cond_9

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mTmpAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ValueAnimator;

    .restart local v0    # "anim":Landroid/animation/ValueAnimator;
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->doAnimationFrame(J)Z

    move-result v7

    if-eqz v7, :cond_8

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .end local v0    # "anim":Landroid/animation/ValueAnimator;
    :cond_9
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mTmpAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_b

    const/4 v2, 0x0

    :goto_6
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v2, v7, :cond_a

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/animation/ValueAnimator;

    invoke-virtual {v7, p0}, Landroid/animation/ValueAnimator;->endAnimation(Landroid/animation/ValueAnimator$AnimationHandler;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_a
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mEndingAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    :cond_b
    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mChoreographer:Landroid/view/Choreographer;

    iget-object v8, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mCommit:Ljava/lang/Runnable;

    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v8, v10}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_c

    iget-object v7, p0, Landroid/animation/ValueAnimator$AnimationHandler;->mDelayedAnims:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_c

    :goto_7
    return-void

    :cond_c
    invoke-direct {p0}, Landroid/animation/ValueAnimator$AnimationHandler;->scheduleAnimation()V

    goto :goto_7
.end method

.method public start()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/animation/ValueAnimator$AnimationHandler;->scheduleAnimation()V

    return-void
.end method
