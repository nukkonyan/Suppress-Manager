#include	<suppress_manager>

#pragma		semicolon	1
#pragma		newdecls	required

public void OnPluginStart()	{
	PrintToServer("SuppressManager_IsTeamJoinMsgBlocked Returned : %d",			SuppressManager_IsTeamJoinMsgBlocked());
	PrintToServer("SuppressManager_IsConnectMsgBlocked Returned : %d",			SuppressManager_IsConnectMsgBlocked());
	PrintToServer("SuppressManager_IsDisconnectMsgBlocked Returned : %d",		SuppressManager_IsDisconnectMsgBlocked());
	PrintToServer("SuppressManager_IsKillfeedBlocked Returned : %d",			SuppressManager_IsKillfeedBlocked());
	PrintToServer("SuppressManager_TF2_IsWinpanelBlocked Returned : %d",		SuppressManager_TF2_IsWinpanelBlocked());
	PrintToServer("SuppressManager_IsAchievementsBlocked Returned : %d",		SuppressManager_IsAchievementsBlocked());
	PrintToServer("SuppressManager_TF2_IsAnnotationsBlocked Returned : %d",		SuppressManager_TF2_IsAnnotationsBlocked());
	PrintToServer("SuppressManager_IsNameChangeBlocked Returned : %d",			SuppressManager_IsNameChangeBlocked());
	PrintToServer("SuppressManager_TF2_IsVoiceSubTitlesBlocked Returned : %d",	SuppressManager_TF2_IsVoiceSubTitlesBlocked());
	PrintToServer("SuppressManager_IsServerCvarChangesBlocked Returned : %d",	SuppressManager_IsServerCvarChangesBlocked());
	PrintToServer("SuppressManager_IsChatMessagesBlocked Returned : %d",		SuppressManager_IsChatMessagesBlocked());
}