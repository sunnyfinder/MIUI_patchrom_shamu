.class Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;
.super Landroid/app/IActivityContainer$Stub;
.source "ActivityStackSupervisor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActivityStackSupervisor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ActivityContainer"
.end annotation


# static fields
.field static final CONTAINER_STATE_FINISHING:I = 0x2

.field static final CONTAINER_STATE_HAS_SURFACE:I = 0x0

.field static final CONTAINER_STATE_NO_SURFACE:I = 0x1

.field static final FORCE_NEW_TASK_FLAGS:I = 0x18010000


# instance fields
.field mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

.field mCallback:Landroid/app/IActivityContainerCallback;

.field mContainerState:I

.field mIdString:Ljava/lang/String;

.field mParentActivity:Lcom/android/server/am/ActivityRecord;

.field final mStack:Lcom/android/server/am/ActivityStack;

.field final mStackId:I

.field mVisible:Z

.field final synthetic this$0:Lcom/android/server/am/ActivityStackSupervisor;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityStackSupervisor;I)V
    .locals 3
    .param p2, "stackId"    # I

    .prologue
    const/4 v0, 0x0

    iput-object p1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-direct {p0}, Landroid/app/IActivityContainer$Stub;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mCallback:Landroid/app/IActivityContainerCallback;

    iput-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mParentActivity:Lcom/android/server/am/ActivityRecord;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mVisible:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mContainerState:I

    iget-object v1, p1, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    iput p2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStackId:I

    new-instance v0, Lcom/android/server/am/ActivityStack;

    # getter for: Lcom/android/server/am/ActivityStackSupervisor;->mRecentTasks:Lcom/android/server/am/RecentTasks;
    invoke-static {p1}, Lcom/android/server/am/ActivityStackSupervisor;->access$800(Lcom/android/server/am/ActivityStackSupervisor;)Lcom/android/server/am/RecentTasks;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/android/server/am/ActivityStack;-><init>(Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;Lcom/android/server/am/RecentTasks;)V

    iput-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ActivtyContainer{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStackId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mIdString:Ljava/lang/String;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private checkEmbeddedAllowedInner(ILandroid/content/Intent;Ljava/lang/String;)V
    .locals 7
    .param p1, "userId"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "resolvedType"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p2

    move-object v2, p3

    move v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/ActivityStackSupervisor;->resolveActivity(Landroid/content/Intent;Ljava/lang/String;ILandroid/app/ProfilerInfo;I)Landroid/content/pm/ActivityInfo;

    move-result-object v6

    .local v6, "aInfo":Landroid/content/pm/ActivityInfo;
    if-eqz v6, :cond_0

    iget v0, v6, Landroid/content/pm/ActivityInfo;->flags:I

    const/high16 v1, -0x80000000

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Attempt to embed activity that has not set allowEmbedded=\"true\""

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    return-object p0
.end method

.method public attachToDisplay(I)V
    .locals 3
    .param p1, "displayId"    # I

    .prologue
    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v2, v1, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    # getter for: Lcom/android/server/am/ActivityStackSupervisor;->mActivityDisplays:Landroid/util/SparseArray;
    invoke-static {v1}, Lcom/android/server/am/ActivityStackSupervisor;->access$900(Lcom/android/server/am/ActivityStackSupervisor;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    .local v0, "activityDisplay":Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;
    if-nez v0, :cond_0

    monitor-exit v2

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->attachToDisplayLocked(Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;)V

    monitor-exit v2

    goto :goto_0

    .end local v0    # "activityDisplay":Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method attachToDisplayLocked(Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;)V
    .locals 3
    .param p1, "activityDisplay"    # Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    .prologue
    iput-object p1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    iget v1, p1, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->mDisplayId:I

    iput v1, v0, Lcom/android/server/am/ActivityStack;->mDisplayId:I

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    iget-object v1, p1, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->mStacks:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/android/server/am/ActivityStack;->mStacks:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    invoke-virtual {p1, v0}, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->attachActivities(Lcom/android/server/am/ActivityStack;)V

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStackId:I

    iget v2, p1, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->mDisplayId:I

    invoke-virtual {v0, v1, v2}, Lcom/android/server/wm/WindowManagerService;->attachStack(II)V

    return-void
.end method

.method protected detachLocked()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    invoke-virtual {v0, v1}, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->detachActivitiesLocked(Lcom/android/server/am/ActivityStack;)V

    iput-object v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    const/4 v1, -0x1

    iput v1, v0, Lcom/android/server/am/ActivityStack;->mDisplayId:I

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    iput-object v2, v0, Lcom/android/server/am/ActivityStack;->mStacks:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStackId:I

    invoke-virtual {v0, v1}, Lcom/android/server/wm/WindowManagerService;->detachStack(I)V

    :cond_0
    return-void
.end method

.method getBounds(Landroid/graphics/Point;)V
    .locals 3
    .param p1, "outBounds"    # Landroid/graphics/Point;

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v1, v0, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->getBounds(Landroid/graphics/Point;)V

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Point;->set(II)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getDisplayId()I
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v1, v0, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    iget v0, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->mDisplayId:I

    monitor-exit v1

    :goto_0
    return v0

    :cond_0
    monitor-exit v1

    const/4 v0, -0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getOuter()Lcom/android/server/am/ActivityStackSupervisor;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    return-object v0
.end method

.method public getStackId()I
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v1, v0, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStackId:I

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public injectEvent(Landroid/view/InputEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/InputEvent;

    .prologue
    const/4 v2, 0x0

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .local v0, "origId":J
    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v3, v3, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v4, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-eqz v4, :cond_0

    iget-object v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v2, v2, Lcom/android/server/am/ActivityStackSupervisor;->mInputManagerInternal:Landroid/hardware/input/InputManagerInternal;

    iget-object v4, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    iget v4, v4, Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;->mDisplayId:I

    const/4 v5, 0x0

    invoke-virtual {v2, p1, v4, v5}, Landroid/hardware/input/InputManagerInternal;->injectInputEvent(Landroid/view/InputEvent;II)Z

    move-result v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    :goto_0
    return v2

    :cond_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
.end method

.method isAttachedLocked()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isEligibleForNewTasks()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method onTaskListEmptyLocked()V
    .locals 2

    .prologue
    invoke-virtual {p0}, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->detachLocked()V

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v0, p0}, Lcom/android/server/am/ActivityStackSupervisor;->deleteActivityContainer(Landroid/app/IActivityContainer;)V

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mHandler:Lcom/android/server/am/ActivityStackSupervisor$ActivityStackSupervisorHandler;

    const/16 v1, 0x6f

    invoke-virtual {v0, v1, p0}, Lcom/android/server/am/ActivityStackSupervisor$ActivityStackSupervisorHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public release()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    iget-object v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v3, v2, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v3

    :try_start_0
    iget v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mContainerState:I

    if-ne v2, v4, :cond_0

    monitor-exit v3

    :goto_0
    return-void

    :cond_0
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mContainerState:I

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .local v0, "origId":J
    :try_start_1
    iget-object v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/android/server/am/ActivityStack;->finishAllActivitiesLocked(Z)V

    iget-object v2, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v4, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mStack:Lcom/android/server/am/ActivityStack;

    invoke-virtual {v2, v4}, Lcom/android/server/am/ActivityStackSupervisor;->removePendingActivityLaunchesLocked(Lcom/android/server/am/ActivityStack;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    monitor-exit v3

    goto :goto_0

    .end local v0    # "origId":J
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .restart local v0    # "origId":J
    :catchall_1
    move-exception v2

    :try_start_3
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method setDrawn()V
    .locals 0

    .prologue
    return-void
.end method

.method public setSurface(Landroid/view/Surface;III)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "density"    # I

    .prologue
    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    const-string v1, "ActivityContainer.attachToSurface"

    invoke-virtual {v0, v1}, Lcom/android/server/am/ActivityManagerService;->enforceNotIsolatedCaller(Ljava/lang/String;)V

    return-void
.end method

.method setVisible(Z)V
    .locals 4
    .param p1, "visible"    # Z

    .prologue
    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mVisible:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mVisible:Z

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mCallback:Landroid/app/IActivityContainerCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v2, v0, Lcom/android/server/am/ActivityStackSupervisor;->mHandler:Lcom/android/server/am/ActivityStackSupervisor$ActivityStackSupervisorHandler;

    const/16 v3, 0x6c

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0, v1, p0}, Lcom/android/server/am/ActivityStackSupervisor$ActivityStackSupervisorHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public final startActivity(Landroid/content/Intent;)I
    .locals 24
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v3, v3, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    const-string v4, "ActivityContainer.startActivity"

    invoke-virtual {v3, v4}, Lcom/android/server/am/ActivityManagerService;->enforceNotIsolatedCaller(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v3, v3, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v4

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    # getter for: Lcom/android/server/am/ActivityStackSupervisor;->mCurrentUser:I
    invoke-static {v6}, Lcom/android/server/am/ActivityStackSupervisor;->access$1000(Lcom/android/server/am/ActivityStackSupervisor;)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x2

    const-string v9, "ActivityContainer"

    const/4 v10, 0x0

    invoke-virtual/range {v3 .. v10}, Lcom/android/server/am/ActivityManagerService;->handleIncomingUser(IIIZILjava/lang/String;Ljava/lang/String;)I

    move-result v20

    .local v20, "userId":I
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v8

    .local v8, "mimeType":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v23

    .local v23, "data":Landroid/net/Uri;
    if-nez v8, :cond_0

    if-eqz v23, :cond_0

    const-string v3, "content"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v3, v3, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    move-object/from16 v0, v23

    move/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Lcom/android/server/am/ActivityManagerService;->getProviderMimeType(Landroid/net/Uri;I)Ljava/lang/String;

    move-result-object v8

    :cond_0
    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v8}, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->checkEmbeddedAllowedInner(ILandroid/content/Intent;Ljava/lang/String;)V

    const/high16 v3, 0x18010000

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    move-object/from16 v7, p1

    move-object/from16 v21, p0

    invoke-virtual/range {v3 .. v22}, Lcom/android/server/am/ActivityStackSupervisor;->startActivityMayWait(Landroid/app/IApplicationThread;ILjava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/service/voice/IVoiceInteractionSession;Lcom/android/internal/app/IVoiceInteractor;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/app/IActivityManager$WaitResult;Landroid/content/res/Configuration;Landroid/os/Bundle;ZILandroid/app/IActivityContainer;Lcom/android/server/am/TaskRecord;)I

    move-result v3

    return v3
.end method

.method public final startActivityIntentSender(Landroid/content/IIntentSender;)I
    .locals 14
    .param p1, "intentSender"    # Landroid/content/IIntentSender;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/TransactionTooLargeException;
        }
    .end annotation

    .prologue
    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v1, v1, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    const-string v2, "ActivityContainer.startActivityIntentSender"

    invoke-virtual {v1, v2}, Lcom/android/server/am/ActivityManagerService;->enforceNotIsolatedCaller(Ljava/lang/String;)V

    instance-of v1, p1, Lcom/android/server/am/PendingIntentRecord;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Bad PendingIntent object"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v1, Lcom/android/server/am/ActivityStackSupervisor;->mService:Lcom/android/server/am/ActivityManagerService;

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    iget-object v3, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->this$0:Lcom/android/server/am/ActivityStackSupervisor;

    # getter for: Lcom/android/server/am/ActivityStackSupervisor;->mCurrentUser:I
    invoke-static {v3}, Lcom/android/server/am/ActivityStackSupervisor;->access$1000(Lcom/android/server/am/ActivityStackSupervisor;)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const-string v6, "ActivityContainer"

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/am/ActivityManagerService;->handleIncomingUser(IIIZILjava/lang/String;Ljava/lang/String;)I

    move-result v13

    .local v13, "userId":I
    move-object v0, p1

    check-cast v0, Lcom/android/server/am/PendingIntentRecord;

    .local v0, "pendingIntent":Lcom/android/server/am/PendingIntentRecord;
    iget-object v1, v0, Lcom/android/server/am/PendingIntentRecord;->key:Lcom/android/server/am/PendingIntentRecord$Key;

    iget-object v1, v1, Lcom/android/server/am/PendingIntentRecord$Key;->requestIntent:Landroid/content/Intent;

    iget-object v2, v0, Lcom/android/server/am/PendingIntentRecord;->key:Lcom/android/server/am/PendingIntentRecord$Key;

    iget-object v2, v2, Lcom/android/server/am/PendingIntentRecord$Key;->requestResolvedType:Ljava/lang/String;

    invoke-direct {p0, v13, v1, v2}, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->checkEmbeddedAllowedInner(ILandroid/content/Intent;Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/high16 v9, 0x18010000

    const/high16 v10, 0x18010000

    const/4 v11, 0x0

    move-object v12, p0

    invoke-virtual/range {v0 .. v12}, Lcom/android/server/am/PendingIntentRecord;->sendInner(ILandroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;Landroid/app/IActivityContainer;)I

    move-result v1

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mIdString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/android/server/am/ActivityStackSupervisor$ActivityContainer;->mActivityDisplay:Lcom/android/server/am/ActivityStackSupervisor$ActivityDisplay;

    if-nez v0, :cond_0

    const-string v0, "N"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "A"

    goto :goto_0
.end method
