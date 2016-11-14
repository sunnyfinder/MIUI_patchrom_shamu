.class Landroid/app/EnterTransitionCoordinator;
.super Landroid/app/ActivityTransitionCoordinator;
.source "EnterTransitionCoordinator.java"


# static fields
.field private static final MIN_ANIMATION_FRAMES:I = 0x2

.field private static final TAG:Ljava/lang/String; = "EnterTransitionCoordinator"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAreViewsReady:Z

.field private mBackgroundAnimator:Landroid/animation/ObjectAnimator;

.field private mEnterViewsTransition:Landroid/transition/Transition;

.field private mHasStopped:Z

.field private mIsCanceled:Z

.field private mIsExitTransitionComplete:Z

.field private mIsReadyForTransition:Z

.field private mIsViewsTransitionStarted:Z

.field private mSharedElementTransitionStarted:Z

.field private mSharedElementsBundle:Landroid/os/Bundle;

.field private mWasOpaque:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/os/ResultReceiver;Ljava/util/ArrayList;Z)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p4, "isReturning"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/os/ResultReceiver;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p3, "sharedElementNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-static {p1, p4}, Landroid/app/EnterTransitionCoordinator;->getListener(Landroid/app/Activity;Z)Landroid/app/SharedElementCallback;

    move-result-object v3

    invoke-direct {p0, v2, p3, v3, p4}, Landroid/app/ActivityTransitionCoordinator;-><init>(Landroid/view/Window;Ljava/util/ArrayList;Landroid/app/SharedElementCallback;Z)V

    iput-object p1, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, p2}, Landroid/app/EnterTransitionCoordinator;->setResultReceiver(Landroid/os/ResultReceiver;)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->prepareEnter()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .local v1, "resultReceiverBundle":Landroid/os/Bundle;
    const-string v2, "android:remoteReceiver"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mResultReceiver:Landroid/os/ResultReceiver;

    const/16 v3, 0x64

    invoke-virtual {v2, v3, v1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v0

    .local v0, "decorView":Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Landroid/app/EnterTransitionCoordinator$1;

    invoke-direct {v3, p0, v0}, Landroid/app/EnterTransitionCoordinator$1;-><init>(Landroid/app/EnterTransitionCoordinator;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_0
    return-void
.end method

.method static synthetic access$000(Landroid/app/EnterTransitionCoordinator;)Z
    .locals 1
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;

    .prologue
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsReadyForTransition:Z

    return v0
.end method

.method static synthetic access$100(Landroid/app/EnterTransitionCoordinator;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    invoke-direct {p0, p1}, Landroid/app/EnterTransitionCoordinator;->startSharedElementTransition(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/EnterTransitionCoordinator;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;

    .prologue
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->sharedElementTransitionStarted()V

    return-void
.end method

.method static synthetic access$302(Landroid/app/EnterTransitionCoordinator;Landroid/transition/Transition;)Landroid/transition/Transition;
    .locals 0
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;
    .param p1, "x1"    # Landroid/transition/Transition;

    .prologue
    iput-object p1, p0, Landroid/app/EnterTransitionCoordinator;->mEnterViewsTransition:Landroid/transition/Transition;

    return-object p1
.end method

.method static synthetic access$400(Landroid/app/EnterTransitionCoordinator;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;

    .prologue
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->makeOpaque()V

    return-void
.end method

.method static synthetic access$500(Landroid/app/EnterTransitionCoordinator;Landroid/view/ViewGroup;ZZ)Landroid/transition/Transition;
    .locals 1
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;
    .param p1, "x1"    # Landroid/view/ViewGroup;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    invoke-direct {p0, p1, p2, p3}, Landroid/app/EnterTransitionCoordinator;->beginTransition(Landroid/view/ViewGroup;ZZ)Landroid/transition/Transition;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Landroid/app/EnterTransitionCoordinator;Landroid/transition/Transition;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/EnterTransitionCoordinator;
    .param p1, "x1"    # Landroid/transition/Transition;

    .prologue
    invoke-direct {p0, p1}, Landroid/app/EnterTransitionCoordinator;->startEnterTransition(Landroid/transition/Transition;)V

    return-void
.end method

.method private allowOverlappingTransitions()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAllowReturnTransitionOverlap()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAllowEnterTransitionOverlap()Z

    move-result v0

    goto :goto_0
.end method

.method private beginTransition(Landroid/view/ViewGroup;ZZ)Landroid/transition/Transition;
    .locals 7
    .param p1, "decorView"    # Landroid/view/ViewGroup;
    .param p2, "startEnterTransition"    # Z
    .param p3, "startSharedElementTransition"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v0, 0x0

    .local v0, "sharedElementTransition":Landroid/transition/Transition;
    if-eqz p3, :cond_1

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getSharedElementTransition()Landroid/transition/Transition;

    move-result-object v4

    invoke-virtual {p0, v4, v5}, Landroid/app/EnterTransitionCoordinator;->configureTransition(Landroid/transition/Transition;Z)Landroid/transition/Transition;

    move-result-object v0

    :cond_0
    if-nez v0, :cond_5

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->sharedElementTransitionStarted()V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->sharedElementTransitionComplete()V

    :cond_1
    :goto_0
    const/4 v3, 0x0

    .local v3, "viewsTransition":Landroid/transition/Transition;
    if-eqz p2, :cond_3

    iput-boolean v6, p0, Landroid/app/EnterTransitionCoordinator;->mIsViewsTransitionStarted:Z

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    if-eqz v4, :cond_2

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getViewsTransition()Landroid/transition/Transition;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Landroid/app/EnterTransitionCoordinator;->configureTransition(Landroid/transition/Transition;Z)Landroid/transition/Transition;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-boolean v4, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-nez v4, :cond_2

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->stripOffscreenViews()V

    :cond_2
    if-nez v3, :cond_6

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->viewsTransitionComplete()V

    :cond_3
    :goto_1
    invoke-static {v0, v3}, Landroid/app/EnterTransitionCoordinator;->mergeTransitions(Landroid/transition/Transition;Landroid/transition/Transition;)Landroid/transition/Transition;

    move-result-object v1

    .local v1, "transition":Landroid/transition/Transition;
    if-eqz v1, :cond_8

    new-instance v4, Landroid/app/ActivityTransitionCoordinator$ContinueTransitionListener;

    invoke-direct {v4, p0}, Landroid/app/ActivityTransitionCoordinator$ContinueTransitionListener;-><init>(Landroid/app/ActivityTransitionCoordinator;)V

    invoke-virtual {v1, v4}, Landroid/transition/Transition;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/Transition;

    invoke-static {p1, v1}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/transition/Transition;)V

    if-eqz p3, :cond_7

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    :cond_4
    :goto_2
    return-object v1

    .end local v1    # "transition":Landroid/transition/Transition;
    .end local v3    # "viewsTransition":Landroid/transition/Transition;
    :cond_5
    new-instance v4, Landroid/app/EnterTransitionCoordinator$6;

    invoke-direct {v4, p0}, Landroid/app/EnterTransitionCoordinator$6;-><init>(Landroid/app/EnterTransitionCoordinator;)V

    invoke-virtual {v0, v4}, Landroid/transition/Transition;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/Transition;

    goto :goto_0

    .restart local v3    # "viewsTransition":Landroid/transition/Transition;
    :cond_6
    const/4 v4, 0x4

    invoke-virtual {v3, v4, v6}, Landroid/transition/Transition;->forceVisibility(IZ)V

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    .local v2, "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v4, Landroid/app/EnterTransitionCoordinator$7;

    invoke-direct {v4, p0, v2}, Landroid/app/EnterTransitionCoordinator$7;-><init>(Landroid/app/EnterTransitionCoordinator;Ljava/util/ArrayList;)V

    invoke-virtual {v3, v4}, Landroid/transition/Transition;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/Transition;

    goto :goto_1

    .end local v2    # "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v1    # "transition":Landroid/transition/Transition;
    :cond_7
    if-eqz p2, :cond_4

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    if-eqz v4, :cond_4

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->transitionStarted()V

    goto :goto_2
.end method

.method private cancel()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    if-nez v0, :cond_2

    iput-boolean v1, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getViewsTransition()Landroid/transition/Transition;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsViewsTransitionStarted:Z

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Landroid/app/EnterTransitionCoordinator;->showViews(Ljava/util/ArrayList;Z)V

    :cond_1
    :goto_0
    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mAllSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/app/EnterTransitionCoordinator;->startSharedElementTransition(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->onRemoteExitTransitionComplete()V

    :cond_2
    return-void

    :cond_3
    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method private static getListener(Landroid/app/Activity;Z)Landroid/app/SharedElementCallback;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "isReturning"    # Z

    .prologue
    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/app/Activity;->mExitTransitionListener:Landroid/app/SharedElementCallback;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/app/Activity;->mEnterTransitionListener:Landroid/app/SharedElementCallback;

    goto :goto_0
.end method

.method private makeOpaque()V
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mHasStopped:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mWasOpaque:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->convertFromTranslucent()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    :cond_1
    return-void
.end method

.method private mapNamedElements(Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/util/ArrayMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "accepted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "localNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    .local v4, "sharedElements":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v1

    .local v1, "decorView":Landroid/view/ViewGroup;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findNamedViews(Ljava/util/Map;)V

    :cond_0
    if-eqz p1, :cond_2

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .local v3, "localName":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .local v0, "acceptedName":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v4, v3}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .local v5, "view":Landroid/view/View;
    if-eqz v5, :cond_1

    invoke-virtual {v4, v0, v5}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v5    # "view":Landroid/view/View;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "acceptedName":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "localName":Ljava/lang/String;
    :cond_2
    return-object v4
.end method

.method private onTakeSharedElements()V
    .locals 5

    .prologue
    iget-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mIsReadyForTransition:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementsBundle:Landroid/os/Bundle;

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementsBundle:Landroid/os/Bundle;

    .local v1, "sharedElementState":Landroid/os/Bundle;
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementsBundle:Landroid/os/Bundle;

    new-instance v0, Landroid/app/EnterTransitionCoordinator$5;

    invoke-direct {v0, p0, v1}, Landroid/app/EnterTransitionCoordinator$5;-><init>(Landroid/app/EnterTransitionCoordinator;Landroid/os/Bundle;)V

    .local v0, "listener":Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mListener:Landroid/app/SharedElementCallback;

    if-nez v2, :cond_2

    invoke-interface {v0}, Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;->onSharedElementsReady()V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mListener:Landroid/app/SharedElementCallback;

    iget-object v3, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4, v0}, Landroid/app/SharedElementCallback;->onSharedElementsArrived(Ljava/util/List;Ljava/util/List;Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;)V

    goto :goto_0
.end method

.method private static removeNullViews(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private requestLayoutForSharedElements()V
    .locals 3

    .prologue
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "numSharedElements":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private sendSharedElementDestination()V
    .locals 6

    .prologue
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v1

    .local v1, "decorView":Landroid/view/View;
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->allowOverlappingTransitions()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getEnterViewsTransition()Landroid/transition/Transition;

    move-result-object v4

    if-eqz v4, :cond_3

    const/4 v0, 0x0

    .local v0, "allReady":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_7

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->captureSharedElementState()Landroid/os/Bundle;

    move-result-object v3

    .local v3, "state":Landroid/os/Bundle;
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->moveSharedElementsToOverlay()V

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mResultReceiver:Landroid/os/ResultReceiver;

    const/16 v5, 0x6b

    invoke-virtual {v4, v5, v3}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .end local v3    # "state":Landroid/os/Bundle;
    :cond_1
    :goto_1
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->allowOverlappingTransitions()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->startEnterTransitionOnly()V

    :cond_2
    return-void

    .end local v0    # "allReady":Z
    :cond_3
    if-nez v1, :cond_4

    const/4 v0, 0x1

    .restart local v0    # "allReady":Z
    goto :goto_0

    .end local v0    # "allReady":Z
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v4

    if-nez v4, :cond_5

    const/4 v0, 0x1

    .restart local v0    # "allReady":Z
    :goto_2
    if-eqz v0, :cond_0

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_0

    iget-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->isLayoutRequested()Z

    move-result v4

    if-eqz v4, :cond_6

    const/4 v0, 0x0

    goto :goto_0

    .end local v0    # "allReady":Z
    .end local v2    # "i":I
    :cond_5
    const/4 v0, 0x0

    goto :goto_2

    .restart local v0    # "allReady":Z
    .restart local v2    # "i":I
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .end local v2    # "i":I
    :cond_7
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    new-instance v5, Landroid/app/EnterTransitionCoordinator$3;

    invoke-direct {v5, p0, v1}, Landroid/app/EnterTransitionCoordinator$3;-><init>(Landroid/app/EnterTransitionCoordinator;Landroid/view/View;)V

    invoke-virtual {v4, v5}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_1
.end method

.method private sharedElementTransitionStarted()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementTransitionStarted:Z

    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsExitTransitionComplete:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x68

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/EnterTransitionCoordinator;->send(ILandroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method private startEnterTransition(Landroid/transition/Transition;)V
    .locals 6
    .param p1, "transition"    # Landroid/transition/Transition;

    .prologue
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v1

    .local v1, "decorView":Landroid/view/ViewGroup;
    iget-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-nez v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .local v0, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const-string v2, "alpha"

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const/16 v5, 0xff

    aput v5, v3, v4

    invoke-static {v0, v2, v3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getFadeDuration()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    new-instance v3, Landroid/app/EnterTransitionCoordinator$8;

    invoke-direct {v3, p0}, Landroid/app/EnterTransitionCoordinator$8;-><init>(Landroid/app/EnterTransitionCoordinator;)V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    return-void

    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_1
    if-eqz p1, :cond_2

    new-instance v2, Landroid/app/EnterTransitionCoordinator$9;

    invoke-direct {v2, p0}, Landroid/app/EnterTransitionCoordinator$9;-><init>(Landroid/app/EnterTransitionCoordinator;)V

    invoke-virtual {p1, v2}, Landroid/transition/Transition;->addListener(Landroid/transition/Transition$TransitionListener;)Landroid/transition/Transition;

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->makeOpaque()V

    goto :goto_0
.end method

.method private startEnterTransitionOnly()V
    .locals 1

    .prologue
    new-instance v0, Landroid/app/EnterTransitionCoordinator$11;

    invoke-direct {v0, p0}, Landroid/app/EnterTransitionCoordinator$11;-><init>(Landroid/app/EnterTransitionCoordinator;)V

    invoke-virtual {p0, v0}, Landroid/app/EnterTransitionCoordinator;->startTransition(Ljava/lang/Runnable;)V

    return-void
.end method

.method private startRejectedAnimations(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "rejectedSnapshots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v1

    .local v1, "decorView":Landroid/view/ViewGroup;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v4

    .local v4, "overlay":Landroid/view/ViewGroupOverlay;
    const/4 v0, 0x0

    .local v0, "animator":Landroid/animation/ObjectAnimator;
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .local v3, "numRejected":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .local v5, "snapshot":Landroid/view/View;
    invoke-virtual {v4, v5}, Landroid/view/ViewGroupOverlay;->add(Landroid/view/View;)V

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v7, 0x2

    new-array v7, v7, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v5    # "snapshot":Landroid/view/View;
    :cond_2
    new-instance v6, Landroid/app/EnterTransitionCoordinator$10;

    invoke-direct {v6, p0, v1, p1}, Landroid/app/EnterTransitionCoordinator$10;-><init>(Landroid/app/EnterTransitionCoordinator;Landroid/view/ViewGroup;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v6}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private startSharedElementTransition(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "sharedElementState"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x4

    const/4 v5, 0x1

    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v0

    .local v0, "decorView":Landroid/view/ViewGroup;
    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mAllSharedElementNames:Ljava/util/ArrayList;

    invoke-direct {v2, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .local v2, "rejectedNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {p0, p1, v2}, Landroid/app/EnterTransitionCoordinator;->createSnapshots(Landroid/os/Bundle;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v3

    .local v3, "rejectedSnapshots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mListener:Landroid/app/SharedElementCallback;

    if-eqz v9, :cond_2

    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mListener:Landroid/app/SharedElementCallback;

    invoke-virtual {v9, v3}, Landroid/app/SharedElementCallback;->onRejectSharedElements(Ljava/util/List;)V

    :cond_2
    invoke-static {v3}, Landroid/app/EnterTransitionCoordinator;->removeNullViews(Ljava/util/ArrayList;)V

    invoke-direct {p0, v3}, Landroid/app/EnterTransitionCoordinator;->startRejectedAnimations(Ljava/util/ArrayList;)V

    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementNames:Ljava/util/ArrayList;

    invoke-virtual {p0, p1, v9}, Landroid/app/EnterTransitionCoordinator;->createSnapshots(Landroid/os/Bundle;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v4

    .local v4, "sharedElementSnapshots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v9, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {p0, v9, v5}, Landroid/app/EnterTransitionCoordinator;->showViews(Ljava/util/ArrayList;Z)V

    invoke-virtual {p0, v4}, Landroid/app/EnterTransitionCoordinator;->scheduleSetSharedElementEnd(Ljava/util/ArrayList;)V

    invoke-virtual {p0, p1, v4}, Landroid/app/EnterTransitionCoordinator;->setSharedElementState(Landroid/os/Bundle;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .local v1, "originalImageViewState":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/ActivityTransitionCoordinator$SharedElementOriginalState;>;"
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->requestLayoutForSharedElements()V

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->allowOverlappingTransitions()Z

    move-result v9

    if-eqz v9, :cond_4

    iget-boolean v9, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-nez v9, :cond_4

    .local v5, "startEnterTransition":Z
    :goto_1
    const/4 v6, 0x1

    .local v6, "startSharedElementTransition":Z
    invoke-virtual {p0, v10}, Landroid/app/EnterTransitionCoordinator;->setGhostVisibility(I)V

    invoke-virtual {p0, v10}, Landroid/app/EnterTransitionCoordinator;->scheduleGhostVisibilityChange(I)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->pauseInput()V

    invoke-direct {p0, v0, v5, v6}, Landroid/app/EnterTransitionCoordinator;->beginTransition(Landroid/view/ViewGroup;ZZ)Landroid/transition/Transition;

    move-result-object v7

    .local v7, "transition":Landroid/transition/Transition;
    invoke-virtual {p0, v8}, Landroid/app/EnterTransitionCoordinator;->scheduleGhostVisibilityChange(I)V

    invoke-virtual {p0, v8}, Landroid/app/EnterTransitionCoordinator;->setGhostVisibility(I)V

    if-eqz v5, :cond_3

    invoke-direct {p0, v7}, Landroid/app/EnterTransitionCoordinator;->startEnterTransition(Landroid/transition/Transition;)V

    :cond_3
    iget-object v8, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-static {v8, v1}, Landroid/app/EnterTransitionCoordinator;->setOriginalSharedElementState(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iget-object v8, p0, Landroid/app/EnterTransitionCoordinator;->mResultReceiver:Landroid/os/ResultReceiver;

    if-eqz v8, :cond_0

    new-instance v8, Landroid/app/EnterTransitionCoordinator$4;

    invoke-direct {v8, p0}, Landroid/app/EnterTransitionCoordinator$4;-><init>(Landroid/app/EnterTransitionCoordinator;)V

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_0

    .end local v5    # "startEnterTransition":Z
    .end local v6    # "startSharedElementTransition":Z
    .end local v7    # "transition":Landroid/transition/Transition;
    :cond_4
    move v5, v8

    goto :goto_1
.end method

.method private triggerViewsReady(Landroid/util/ArrayMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "sharedElements":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    iget-boolean v1, p0, Landroid/app/EnterTransitionCoordinator;->mAreViewsReady:Z

    if-eqz v1, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/app/EnterTransitionCoordinator;->mAreViewsReady:Z

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v0

    .local v0, "decor":Landroid/view/ViewGroup;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    invoke-virtual {p0, p1}, Landroid/app/EnterTransitionCoordinator;->viewsReady(Landroid/util/ArrayMap;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Landroid/app/EnterTransitionCoordinator$2;

    invoke-direct {v2, p0, v0, p1}, Landroid/app/EnterTransitionCoordinator$2;-><init>(Landroid/app/EnterTransitionCoordinator;Landroid/view/ViewGroup;Landroid/util/ArrayMap;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method


# virtual methods
.method public cancelEnter()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/app/EnterTransitionCoordinator;->setGhostVisibility(I)V

    iput-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mHasStopped:Z

    iput-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    iput-object v1, p0, Landroid/app/EnterTransitionCoordinator;->mResultReceiver:Landroid/os/ResultReceiver;

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iput-object v1, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    :cond_0
    iput-object v1, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->clearState()V

    invoke-super {p0}, Landroid/app/ActivityTransitionCoordinator;->cancelPendingTransitions()Z

    move-result v0

    return v0
.end method

.method public getEnterViewsTransition()Landroid/transition/Transition;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mEnterViewsTransition:Landroid/transition/Transition;

    return-object v0
.end method

.method protected getSharedElementTransition()Landroid/transition/Transition;
    .locals 2

    .prologue
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v0

    .local v0, "window":Landroid/view/Window;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-boolean v1, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/Window;->getSharedElementReenterTransition()Landroid/transition/Transition;

    move-result-object v1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getSharedElementEnterTransition()Landroid/transition/Transition;

    move-result-object v1

    goto :goto_0
.end method

.method protected getViewsTransition()Landroid/transition/Transition;
    .locals 2

    .prologue
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v0

    .local v0, "window":Landroid/view/Window;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-boolean v1, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/Window;->getReenterTransition()Landroid/transition/Transition;

    move-result-object v1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getEnterTransition()Landroid/transition/Transition;

    move-result-object v1

    goto :goto_0
.end method

.method public isReturning()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    return v0
.end method

.method public namedViewsReady(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "accepted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "localNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2}, Landroid/app/EnterTransitionCoordinator;->mapNamedElements(Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/util/ArrayMap;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/EnterTransitionCoordinator;->triggerViewsReady(Landroid/util/ArrayMap;)V

    return-void
.end method

.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .prologue
    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    if-nez v0, :cond_0

    iput-object p2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementsBundle:Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->onTakeSharedElements()V

    goto :goto_0

    :pswitch_2
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsExitTransitionComplete:Z

    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementTransitionStarted:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->onRemoteExitTransitionComplete()V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->cancel()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x67
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method protected onRemoteExitTransitionComplete()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->allowOverlappingTransitions()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->startEnterTransitionOnly()V

    :cond_0
    return-void
.end method

.method protected onTransitionsComplete()V
    .locals 0

    .prologue
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->moveSharedElementsFromOverlay()V

    return-void
.end method

.method protected prepareEnter()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v1

    .local v1, "decorView":Landroid/view/ViewGroup;
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    if-eqz v2, :cond_0

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v4, v4}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v3, v3}, Landroid/app/Activity;->convertToTranslucent(Landroid/app/Activity$TranslucentConversionListener;Landroid/app/ActivityOptions;)Z

    move-result v2

    iput-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mWasOpaque:Z

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .local v0, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_2
    iput-object v3, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    goto :goto_0
.end method

.method public stop()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->end()V

    iput-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mBackgroundAnimator:Landroid/animation/ObjectAnimator;

    :cond_0
    :goto_0
    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->makeOpaque()V

    iput-boolean v3, p0, Landroid/app/EnterTransitionCoordinator;->mIsCanceled:Z

    iput-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mResultReceiver:Landroid/os/ResultReceiver;

    iput-object v4, p0, Landroid/app/EnterTransitionCoordinator;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->moveSharedElementsFromOverlay()V

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    invoke-virtual {p0, v2, v3}, Landroid/app/EnterTransitionCoordinator;->showViews(Ljava/util/ArrayList;Z)V

    :cond_1
    iget-object v2, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {p0, v2, v3}, Landroid/app/EnterTransitionCoordinator;->showViews(Ljava/util/ArrayList;Z)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->clearState()V

    return-void

    :cond_2
    iget-boolean v2, p0, Landroid/app/EnterTransitionCoordinator;->mWasOpaque:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getDecor()Landroid/view/ViewGroup;

    move-result-object v0

    .local v0, "decorView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0
.end method

.method public viewInstancesReady(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "accepted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "localNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "localViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v1, 0x0

    .local v1, "remap":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v4, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-nez v3, :cond_2

    :cond_0
    const/4 v1, 0x1

    .end local v2    # "view":Landroid/view/View;
    :cond_1
    if-eqz v1, :cond_3

    invoke-direct {p0, p1, p2}, Landroid/app/EnterTransitionCoordinator;->mapNamedElements(Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/util/ArrayMap;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/app/EnterTransitionCoordinator;->triggerViewsReady(Landroid/util/ArrayMap;)V

    :goto_1
    return-void

    .restart local v2    # "view":Landroid/view/View;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v2    # "view":Landroid/view/View;
    :cond_3
    invoke-virtual {p0, p1, p3}, Landroid/app/EnterTransitionCoordinator;->mapSharedElements(Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/util/ArrayMap;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/app/EnterTransitionCoordinator;->triggerViewsReady(Landroid/util/ArrayMap;)V

    goto :goto_1
.end method

.method protected viewsReady(Landroid/util/ArrayMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "sharedElements":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-super {p0, p1}, Landroid/app/ActivityTransitionCoordinator;->viewsReady(Landroid/util/ArrayMap;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsReadyForTransition:Z

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElements:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/app/EnterTransitionCoordinator;->hideViews(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->getViewsTransition()Landroid/transition/Transition;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mTransitioningViews:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/app/EnterTransitionCoordinator;->hideViews(Ljava/util/ArrayList;)V

    :cond_0
    iget-boolean v0, p0, Landroid/app/EnterTransitionCoordinator;->mIsReturning:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->sendSharedElementDestination()V

    :goto_0
    iget-object v0, p0, Landroid/app/EnterTransitionCoordinator;->mSharedElementsBundle:Landroid/os/Bundle;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Landroid/app/EnterTransitionCoordinator;->onTakeSharedElements()V

    :cond_1
    return-void

    :cond_2
    invoke-virtual {p0}, Landroid/app/EnterTransitionCoordinator;->moveSharedElementsToOverlay()V

    goto :goto_0
.end method
