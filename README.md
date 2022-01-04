## Suppress-Manager
Blocks specific message &amp; outputs from showing.

AlliedModders Post: https://forums.alliedmods.net/showthread.php?p=2708931

### Latest Version: 0.7.1

## Requirements

Suppress-Manager include (To compile)

[Updater](https://github.com/Teamkiller324/Updater) (To compile with updater support)

## Cvars
```
sm_suppress_version - Suppress Manager Version
sm_suppress_teams - Allow/Block Player Joined Team Message. Default: 0 (Allow)
sm_suppress_connect - Allow/Block Player Connected Message. Default: 0 (Allow)
sm_suppress_disconnect - Allow/Block Player Disconnected Message. Default: 0 (Allow)
sm_suppress_killfeed - Allow/Block Player Killfeed. Default: 0 (Allow)
sm_suppress_namechange - Allow/Block Player Name Change Message. Default: 0 (Allow)
sm_suppress_achievement - Allow/Block Player Achievement Get Message [TF2]. Default: 0 (Allow)
sm_suppress_winpanel - Allow/Block Winpanel From Showing On Win [TF2]. Default: 0 (Allow)
sm_suppress_annotation - Allow/Block Annotation From Showing [TF2]. Default: 0 (Allow)
sm_suppress_voicesubtitles - Allow/Block Player Voice Subtitles [TF2]. Default: 0 (Allow)
sm_suppress_cvar - Allow/Block Cvar value has changed to Message. Default: 0 (Allow)
sm_suppress_chat - Allow/Block chat messages. Default: 0 (Allow)
```

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
