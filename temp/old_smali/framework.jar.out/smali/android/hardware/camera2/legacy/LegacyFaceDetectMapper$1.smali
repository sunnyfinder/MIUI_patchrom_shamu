.class Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper$1;
.super Ljava/lang/Object;
.source "LegacyFaceDetectMapper.java"

# interfaces
.implements Landroid/hardware/Camera$FaceDetectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;-><init>(Landroid/hardware/Camera;Landroid/hardware/camera2/CameraCharacteristics;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;)V
    .locals 0

    .prologue
    iput-object p1, p0, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper$1;->this$0:Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFaceDetection([Landroid/hardware/Camera$Face;Landroid/hardware/Camera;)V
    .locals 4
    .param p1, "faces"    # [Landroid/hardware/Camera$Face;
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    if-nez p1, :cond_1

    const/4 v0, 0x0

    .local v0, "lengthFaces":I
    :goto_0
    iget-object v1, p0, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper$1;->this$0:Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;

    # getter for: Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->mLock:Ljava/lang/Object;
    invoke-static {v1}, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->access$000(Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper$1;->this$0:Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;

    # getter for: Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->mFaceDetectEnabled:Z
    invoke-static {v1}, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->access$100(Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper$1;->this$0:Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;

    # setter for: Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->mFaces:[Landroid/hardware/Camera$Face;
    invoke-static {v1, p1}, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->access$202(Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;[Landroid/hardware/Camera$Face;)[Landroid/hardware/Camera$Face;

    :cond_0
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    .end local v0    # "lengthFaces":I
    :cond_1
    array-length v0, p1

    goto :goto_0

    .restart local v0    # "lengthFaces":I
    :cond_2
    if-lez v0, :cond_0

    :try_start_1
    # getter for: Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->TAG:Ljava/lang/String;
    invoke-static {}, Landroid/hardware/camera2/legacy/LegacyFaceDetectMapper;->access$300()Ljava/lang/String;

    move-result-object v1

    const-string v3, "onFaceDetection - Ignored some incoming faces sinceface detection was disabled"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
