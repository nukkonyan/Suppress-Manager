## Suppress-Manager
Blocks specific message &amp; outputs from showing.

AlliedModders Post: https://forums.alliedmods.net/showthread.php?p=2708931

## Requirements

Suppress-Manager include (To compile)

[Updater](https://github.com/Teamkiller324/Updater) (To compile with updater support)

## Natives

```
SuppressManager_IsTeamJoinMsgBlocked()
  - Returns in SuppressType if the 'player x joined team y' or 'player x has been auto-assigned to team y' are blocked.

SuppressManager_IsConnectMsgBlocked()
  - Returns in SuppressType if the connect messsages are blocked.

SuppressManager_IsConnectMsgBlocked()
  - Returns in SuppressType if the connect messsages are blocked.

SuppressManager_IsDisconnectMsgBlocked()
  - Returns in SuppressType if the disconnect messages are blocked.

SuppressManager_IsKillfeedBlocked()
  - Returns if the killfeed is blocked. 

SuppressManager_TF2_IsWinpanelBlocked()
  - Returns if the tf2 winpanel is blocked.

SuppressManager_IsAchievementsBlocked()
  - Returns if the 'player x earned achievement y' is blocked.

SuppressManager_TF2_IsAnnotationsBlocked()
  - Returns if the tf2 annotations is blocked.

SuppressManager_IsNameChangeBlocked()
  - Returns if the Name changes is blocked.

SuppressManager_TF2_IsVoiceSubTitlesBlocked()
  - Returns if the TF2 voice chat subtitles is blocked.

SuppressManager_IsServerCvarChangesBlocked()
  - Returns if the 'server cvar x has been changed' is blocked.

SuppressManager_IsChatMessagesBlocked()
  - Returns in SuppressChatType if the chat messages has been blocked.
```
