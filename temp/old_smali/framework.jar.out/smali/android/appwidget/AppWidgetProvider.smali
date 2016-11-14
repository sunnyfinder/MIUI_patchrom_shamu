.class public Landroid/appwidget/AppWidgetProvider;
.super Landroid/content/BroadcastReceiver;
.source "AppWidgetProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetId"    # I
    .param p4, "newOptions"    # Landroid/os/Bundle;

    .prologue
    return-void
.end method

.method public onDeleted(Landroid/content/Context;[I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetIds"    # [I

    .prologue
    return-void
.end method

.method public onDisabled(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    return-void
.end method

.method public onEnabled(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .local v0, "action":Ljava/lang/String;
    const-string v7, "android.appwidget.action.APPWIDGET_UPDATE"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .local v3, "extras":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    const-string v7, "appWidgetIds"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v2

    .local v2, "appWidgetIds":[I
    if-eqz v2, :cond_0

    array-length v7, v2

    if-lez v7, :cond_0

    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v7

    invoke-virtual {p0, p1, v7, v2}, Landroid/appwidget/AppWidgetProvider;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .end local v2    # "appWidgetIds":[I
    .end local v3    # "extras":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v7, "android.appwidget.action.APPWIDGET_DELETED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .restart local v3    # "extras":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    const-string v7, "appWidgetId"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "appWidgetId"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .local v1, "appWidgetId":I
    const/4 v7, 0x1

    new-array v7, v7, [I

    const/4 v8, 0x0

    aput v1, v7, v8

    invoke-virtual {p0, p1, v7}, Landroid/appwidget/AppWidgetProvider;->onDeleted(Landroid/content/Context;[I)V

    goto :goto_0

    .end local v1    # "appWidgetId":I
    .end local v3    # "extras":Landroid/os/Bundle;
    :cond_2
    const-string v7, "android.appwidget.action.APPWIDGET_UPDATE_OPTIONS"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .restart local v3    # "extras":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    const-string v7, "appWidgetId"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "appWidgetOptions"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "appWidgetId"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .restart local v1    # "appWidgetId":I
    const-string v7, "appWidgetOptions"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    .local v6, "widgetExtras":Landroid/os/Bundle;
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v7

    invoke-virtual {p0, p1, v7, v1, v6}, Landroid/appwidget/AppWidgetProvider;->onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V

    goto :goto_0

    .end local v1    # "appWidgetId":I
    .end local v3    # "extras":Landroid/os/Bundle;
    .end local v6    # "widgetExtras":Landroid/os/Bundle;
    :cond_3
    const-string v7, "android.appwidget.action.APPWIDGET_ENABLED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetProvider;->onEnabled(Landroid/content/Context;)V

    goto :goto_0

    :cond_4
    const-string v7, "android.appwidget.action.APPWIDGET_DISABLED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetProvider;->onDisabled(Landroid/content/Context;)V

    goto :goto_0

    :cond_5
    const-string v7, "android.appwidget.action.APPWIDGET_RESTORED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .restart local v3    # "extras":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    const-string v7, "appWidgetOldIds"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v5

    .local v5, "oldIds":[I
    const-string v7, "appWidgetIds"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v4

    .local v4, "newIds":[I
    if-eqz v5, :cond_0

    array-length v7, v5

    if-lez v7, :cond_0

    invoke-virtual {p0, p1, v5, v4}, Landroid/appwidget/AppWidgetProvider;->onRestored(Landroid/content/Context;[I[I)V

    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v7

    invoke-virtual {p0, p1, v7, v4}, Landroid/appwidget/AppWidgetProvider;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    goto/16 :goto_0
.end method

.method public onRestored(Landroid/content/Context;[I[I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "oldWidgetIds"    # [I
    .param p3, "newWidgetIds"    # [I

    .prologue
    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I

    .prologue
    return-void
.end method
