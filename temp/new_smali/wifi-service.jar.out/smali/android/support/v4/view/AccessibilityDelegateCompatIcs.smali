.class Landroid/support/v4/view/AccessibilityDelegateCompatIcs;
.super Ljava/lang/Object;
.source "AccessibilityDelegateCompatIcs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/AccessibilityDelegateCompatIcs$AccessibilityDelegateBridge;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispatchPopulateAccessibilityEvent(Ljava/lang/Object;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method public static newAccessibilityDelegateBridge(Landroid/support/v4/view/AccessibilityDelegateCompatIcs$AccessibilityDelegateBridge;)Ljava/lang/Object;
    .locals 1
    .param p0, "bridge"    # Landroid/support/v4/view/AccessibilityDelegateCompatIcs$AccessibilityDelegateBridge;

    .prologue
    new-instance v0, Landroid/support/v4/view/AccessibilityDelegateCompatIcs$1;

    invoke-direct {v0, p0}, Landroid/support/v4/view/AccessibilityDelegateCompatIcs$1;-><init>(Landroid/support/v4/view/AccessibilityDelegateCompatIcs$AccessibilityDelegateBridge;)V

    return-object v0
.end method

.method public static newAccessibilityDelegateDefaultImpl()Ljava/lang/Object;
    .locals 1

    .prologue
    new-instance v0, Landroid/view/View$AccessibilityDelegate;

    invoke-direct {v0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    return-object v0
.end method

.method public static onInitializeAccessibilityEvent(Ljava/lang/Object;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public static onInitializeAccessibilityNodeInfo(Ljava/lang/Object;Landroid/view/View;Ljava/lang/Object;)V
    .locals 0
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "info"    # Ljava/lang/Object;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    check-cast p2, Landroid/view/accessibility/AccessibilityNodeInfo;

    .end local p2    # "info":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    return-void
.end method

.method public static onPopulateAccessibilityEvent(Ljava/lang/Object;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public static onRequestSendAccessibilityEvent(Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/ViewGroup;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method public static sendAccessibilityEvent(Ljava/lang/Object;Landroid/view/View;I)V
    .locals 0
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "eventType"    # I

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEvent(Landroid/view/View;I)V

    return-void
.end method

.method public static sendAccessibilityEventUnchecked(Ljava/lang/Object;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p0, "delegate"    # Ljava/lang/Object;
    .param p1, "host"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    check-cast p0, Landroid/view/View$AccessibilityDelegate;

    .end local p0    # "delegate":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method
