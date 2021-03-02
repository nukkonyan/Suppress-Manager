#if defined _suppress_manager_included
  #endinput
#endif
#define _suppress_manager_included

#define	suppress_manager_include_version	"0.7.0"

/**
 *	SuppressManager Suppresion types.
 */
enum	SuppressType
{
	Suppress_Disabled = 0,
	Suppress_Enabled = 1,
	Suppress_BlockOnlyBots = 2,
	Suppress_BlockOnlyPlayers = 3
}

/**
 *	SuppressManager Chat Suppression types.
 */
enum	Suppress_ChatType
{
	Suppress_Chat_Disabled = 0,
	Suppress_Chat_Enabled = 1,
	Suppress_Chat_DisablePublicChat = 2,
	Suppress_Chat_DisableTeamChat = 3
}

/**
 *	Returns in SuppressType if the 'player x joined team y' or 'player x has been auto-assigned to team y' are blocked.
 *
 *	@return	Suppress_Disabled			Disabled.
 *	@return	Suppress_Enabled			Enabled.
 *	@return	Suppress_BlockOnlyBots		Block only bots team join messages. (Unused atm)
 *	@return	Suppress_BlockOnlyPlayers		Block only players team join messages. (Unused atm)
 */
native SuppressType SuppressManager_IsTeamJoinMsgBlocked();

/**
 *	Returns in SuppressType if the connect messsages are blocked.
 *
 *	@return	Suppress_Disabled			Disabled.
 *	@return	Suppress_Enabled			Enabled.
 *	@return	Suppress_BlockOnlyBots		Block only bots connect messages.
 *	@return	Suppress_BlockOnlyPlayers		Block only players connect messsages.
 */
native SuppressType SuppressManager_IsConnectMsgBlocked();

/**
 *	Returns in SuppressType if the disconnect messages are blocked.
 *
 *	@return	Suppress_Disabled			Disabled.
 *	@return	Suppress_Enabled			Enabled
 *	@return	Suppress_BlockOnlyBots		Block only bots disconnect messages.
 *	@return	Suppress_BlockOnlyPlayers		Block only players disconnect messages.
 */
native SuppressType SuppressManager_IsDisconnectMsgBlocked();

/**
 *	Returns if the killfeed is blocked.
 */
native bool SuppressManager_IsKillfeedBlocked();

/**
 *	Returns if the tf2 winpanel is blocked.
 */
native bool SuppressManager_TF2_IsWinpanelBlocked();

/**
 *	Returns if the 'player x earned achievement y' is blocked.
 */
native bool SuppressManager_IsAchievementsBlocked();

/**
 *	Returns if the tf2 annotations is blocked.
 */
native bool SuppressManager_TF2_IsAnnotationsBlocked();

/**
 *	Returns if the Name changes is blocked.
 */
native bool SuppressManager_IsNameChangeBlocked();

/**
 *	Returns if the TF2 voice chat subtitles is blocked.
 */
native bool SuppressManager_TF2_IsVoiceSubTitlesBlocked();

/**
 *	Returns if the 'server cvar x has been changed' is blocked.
 */
native bool SuppressManager_IsServerCvarChangesBlocked();

/**
 *	Returns in SuppressChatType if the chat messages has been blocked.
 *
 *	@return	Suppress_Chat_Disabled		= Disabled.
 *	@return	Suppress_Chat_Enabled			= Enabled.
 *	@return	Suppress_Chat_DisablePublicChat	= Blocks public chat.
 *	@return	Suppress_Chat_DisableTeamChat		= Blocks team chat.
 */
native Suppress_ChatType SuppressManager_IsChatMessagesBlocked();

//public	SharedPlugin	__pl_suppress_manager	=	{
//	name	=	"[ANY] Suppress Manager",
//	file	=	"sm_suppress.smx",
//#if defined REQUIRE_PLUGIN
//	required = 1,
//#else
//	required = 0,
//#endif
//};
//Disabled due to always returning false, thinking the plugin is nonexistant.

//Temporary
#define	REQUIRE_PLUGIN

#if !defined REQUIRE_PLUGIN
public	void	__pl_suppress_manager_SetNTVOptional()	{
	MarkNativeAsOptional("SuppressManager_IsTeamJoinMsgBlocked");
	MarkNativeAsOptional("SuppressManager_IsConnectMsgBlocked");
	MarkNativeAsOptional("SuppressManager_IsDisconnectMsgBlocked");
	MarkNativeAsOptional("SuppressManager_IsKillfeedBlocked");
	MarkNativeAsOptional("SuppressManager_TF2_IsWinpanelBlocked");
	MarkNativeAsOptional("SuppressManager_IsAchievementsBlocked");
	MarkNativeAsOptional("SuppressManager_TF2_IsAnnotationsBlocked");
	MarkNativeAsOptional("SuppressManager_IsNameChangeBlocked");
	MarkNativeAsOptional("SuppressManager_TF2_IsVoiceSubTitlesBlocked");
	MarkNativeAsOptional("SuppressManager_IsServerCvarChangesBlocked");
	MarkNativeAsOptional("SuppressManager_IsChatMessagesBlocked");
}
#endif