#pragma		semicolon 1
#pragma		newdecls required

#define		PLUGIN_VERSION "0.6.1"

char		gamefolder[64];

ConVar		SuppressTeams,
			SuppressConnect,
			SuppressDisconnect,
			SuppressKillfeed,
			SuppressWinPanel,
			SuppressAchievement,
			SuppressAnnotation,
			SuppressNameChange,
			SuppressVoiceSubTitles,
			SuppressCvar,
			SuppressChat;

public	Plugin myinfo	=	{
	name		=	"[ANY] Suppress Manager",
	author		=	"Tk /id/Teamkiller324",
	description	=	"Blocks specific messages & outputs from showing.",
	version		=	PLUGIN_VERSION,
	url			=	"https://steamcommunity.com/id/Teamkiller324"
}

public void OnPluginStart()	{
	GetGameFolderName(gamefolder, sizeof(gamefolder));
	CreateConVar("sm_suppress_version",	PLUGIN_VERSION,	"Suppress Manager Version");
	SuppressTeams		=	CreateConVar("sm_suppress_teams",		"0",	"Block Player Joined Team Message? \n0 = Allow Player Joined Team Message \n1 = Block Player Joined Team Message",																		_, true, 0.0, true, 1.0);
	SuppressConnect		=	CreateConVar("sm_suppress_connect",		"0",	"Block Player Connected Message? \n0 = Allow Connect Message \n1 = Block Connect Message \n2 = Block Only Bot Connect Message \n3 = Block Only Player Connect Message",					_, true, 0.0, true, 3.0);
	SuppressDisconnect	=	CreateConVar("sm_suppress_disconnect",	"0",	"Block Player Disconnect Message? \n0 = Allow Disconnect Message \n1 = Block Disconnect Message \n2 = Block Only Bot Disconnect Message \n3 = Block Only Player Disconnect Message",	_, true, 0.0, true, 3.0);
	SuppressKillfeed	=	CreateConVar("sm_suppress_killfeed",	"0",	"Block Player Killfeed? \n0 = Allow Killfeed \n1 = Block Killfeed",																														_, true, 0.0, true, 1.0);
	SuppressNameChange	=	CreateConVar("sm_suppress_namechange",	"0",	"Block Player Name Change Message? \n0 = Allow Player Name Change Message \n1 = Block Player Name Change Message",																		_, true, 0.0, true, 1.0);
	SuppressAchievement	=	CreateConVar("sm_suppress_achievement",	"0",	"Block Player Achievement Get Message? \n0 = Allow Player Achievement Get Message \n1 = Block Player Achievement Get Message",															_, true, 0.0, true, 1.0);
	SuppressCvar		=	CreateConVar("sm_suppress_cvar",		"0",	"Block Cvar Has Changed To Message? \n0 = Allow Cvar Has Changed To Message \n1 = Block Cvar Has Changed To Message",																	_, true, 0.0, true, 1.0);
	SuppressChat		=	CreateConVar("sm_suppress_chat",		"0",	"Block Player Chat Messages? \0 = Allow Chat Messages \n1 = Disable Public Chat \n2 = Disable Team Chat \n3 = Disable Public and Team Chat",											_, true, 0.0, true, 3.0);
	HookUserMessage(GetUserMessageId("SayText2"), suppress_NameChange, true);
	HookEvent("player_team",				suppress_Teams,			EventHookMode_Pre);
	HookEvent("player_connect",				suppress_Connect,		EventHookMode_Pre);
	HookEvent("player_disconnect",			suppress_Disconnect,	EventHookMode_Pre);
	HookEvent("player_death",				suppress_Killfeed,		EventHookMode_Pre);
	HookEvent("achievement_earned",			suppress_Achievement,	EventHookMode_Pre);
	HookEvent("server_cvar",				suppress_Cvar,			EventHookMode_Pre);
	//Check game version
	switch(GetEngineVersion())	{
		case Engine_CSS:	{	//Counter-Strike: Source
			HookEvent("player_connect_client",		suppress_Connect,		EventHookMode_Pre);
			HookEvent("achievement_event",			suppress_Achievement,	EventHookMode_Pre);
		}
		case Engine_TF2:	{	//Team Fortress 2
			HookEvent("player_connect_client",	suppress_Connect,		EventHookMode_Pre);
			HookEvent("achievement_event",		suppress_Achievement,	EventHookMode_Pre);
			HookEvent("teamplay_win_panel",		suppress_WinPanel,		EventHookMode_Pre);
			HookEvent("show_annotation",		suppress_Annotation,	EventHookMode_Pre);
			
			//These events doesn't exist in TF2 Classic
			if(StrEqual(gamefolder, "tf", false))	{
				HookEvent("slap_notice",			suppress_Killfeed,		EventHookMode_Pre);
				HookEvent("fish_notice",			suppress_Killfeed,		EventHookMode_Pre);
				HookEvent("fish_notice__arm",		suppress_Killfeed,		EventHookMode_Pre);
			}
			
			HookUserMessage(GetUserMessageId("VoiceSubtitle"),	suppress_VoiceSubTitles,	true); 
		
			SuppressWinPanel		=	CreateConVar("sm_suppress_winpanel",		"0",	"Block Player Winpanel From Showing on Win?",		_, true, 0.0, true, 1.0);
			SuppressAnnotation		=	CreateConVar("sm_suppress_annotation",		"0",	"Block Player Annotation Message From Showing?",	_, true, 0.0, true, 1.0);
			SuppressVoiceSubTitles	=	CreateConVar("sm_suppress_voicesubtitles",	"0",	"Block Player Voice Subtitles?",					_, true, 0.0, true, 1.0);
		}
	}
	AddCommandListener(SuppressChatCallback,	"say");
	AddCommandListener(SuppressChatCallback,	"say_team");
	AutoExecConfig(true, "sm_suppress_manager");
}

//Cvar has changed to Event
Action suppress_Cvar(Event event, const char[] name, bool dontBroadcast)	{
	if(SuppressCvar.BoolValue)
		event.BroadcastDisabled = true;
}
//Player has joined team Event
Action suppress_Teams(Event event, const char[] name, bool dontBroadcast)	{
	if(SuppressTeams.BoolValue)
		event.BroadcastDisabled = true;
}
//Connect Event
Action suppress_Connect(Event event, const char[] name, bool dontBroadcast)	{
	switch(SuppressConnect.IntValue)	{
		case	1,2,3:	event.BroadcastDisabled =true;
		default:	event.BroadcastDisabled = false;
	}
}
public void OnClientAuthorized(int client)	{
	if(!IsValidClient(client))
		return;
	
	switch(SuppressConnect.IntValue)	{
		case	2:	{
			if(!IsFakeClient(client))
				PrintToChatAll("%N has joined the game", client);
		}
		case	3:	{
			if(IsFakeClient(client))
				PrintToChatAll("%N has joined the game", client);
		}
	}
}
//Disconnect Event
Action suppress_Disconnect(Event event, const char[] name, bool dontBroadcast)	{
	int		client	=	GetClientOfUserId(event.GetInt("userid"));
	char	reason[1024];
	event.GetString("reason", reason, sizeof(reason));
	
	if(!IsValidClient(client))
		return	Plugin_Handled;	//Quits the process, thus saving some time for the dedicated server process.
	
	switch(SuppressDisconnect.IntValue)	{
		case	1:	event.BroadcastDisabled = true;
		case	2:	{
			if(!IsFakeClient(client))	{
				event.BroadcastDisabled = true;
				PrintToChatAll("%N has left the game (%s)", client, reason);
			}
		}
		case	3:	{
			if(IsFakeClient(client))	{
				event.BroadcastDisabled = true;
				PrintToChatAll("%N has left the game (%s)", client, reason);
			}
		}
		default:	event.BroadcastDisabled = false;
	}
	return Plugin_Handled;
}
//Killfeed Event
Action suppress_Killfeed(Event event, const char[] name, bool dontBroadcast)	{
	if(SuppressKillfeed.BoolValue)
		event.BroadcastDisabled = true;
}
//Winpanel Event
Action	suppress_WinPanel(Event event, const char[] name, bool dontBroadcast)	{
	if(SuppressWinPanel.BoolValue)
		event.BroadcastDisabled = true;
}
//Achievement get Event
Action suppress_Achievement(Event event, const char[] name, bool dontBroadcast)	{
	if(SuppressAchievement.BoolValue)
		event.BroadcastDisabled = true;
}
//Annotation Event
Action suppress_Annotation(Event event,	const char[] name,	bool dontBroadcast)	{
	if(SuppressAnnotation.BoolValue)
		event.BroadcastDisabled = true;
}
//Voice subtitles Event || Credits GORRageBoy
Action	suppress_NameChange(UserMsg msg_id, Handle bf, const players[], int playersNum, bool reliable, bool init)	{
	if(SuppressNameChange.BoolValue)	{
		if(!reliable)
			return Plugin_Continue;
		
		char buffer[25];
		switch(GetUserMessageType())	{
			case	UM_Protobuf:	{
				PbReadString(bf, "msg_name", buffer, sizeof(buffer));
				if(StrContains(buffer, "Name_Change", false) != -1)
					return Plugin_Handled;
			}
			case	UM_BitBuf:	{
				BfReadChar(bf);
				BfReadChar(bf);
				BfReadString(bf, buffer, sizeof(buffer));
	
				if(StrContains(buffer, "Name_Change", false) != -1)
					return Plugin_Handled;
			}
		}
	}
	return Plugin_Continue;
}
//Name change Event || Credits Bacardi
Action	suppress_VoiceSubTitles(UserMsg msg_id, BfRead bf, const players[], int playersNum, bool reliable, bool init)	{
	int		clientid	=	bf.ReadByte(),
			voicemenu1	=	bf.ReadByte(),
			voicemenu2	=	bf.ReadByte();
	if(SuppressVoiceSubTitles.BoolValue)	{
		if(IsValidClient(clientid, true))	{
			if(voicemenu1 == 0)	{
				switch(voicemenu2)	{
					case	0, 1, 2, 3, 4, 5, 6, 7: return Plugin_Handled;
				}
			}
			if(voicemenu1 == 1)	{
				switch(voicemenu2)	{
					case	0, 1, 2, 6: return Plugin_Handled;
				}
			}
			if(voicemenu1 == 2 && voicemenu2 == 0)
				return Plugin_Handled;
		}
	}
	return Plugin_Continue;
}

Action	SuppressChatCallback(int client,	const char[] command,	int args)	{
	if(StrEqual(command, "say", false))	{
		switch(SuppressChat.IntValue)	{
			case	0:	return	Plugin_Continue;
			case	1:	return	Plugin_Handled;
			case	2:	return	Plugin_Continue;
			case	3:	return	Plugin_Handled;
		}
	}
	if(StrEqual(command, "say_Team", false))	{
		switch(SuppressChat.IntValue)	{
			case	0:	return	Plugin_Continue;
			case	1:	return	Plugin_Continue;
			case	2:	return	Plugin_Handled;
			case	3:	return	Plugin_Handled;
		}
	}
	return	Plugin_Continue;
}

bool	IsValidClient(int client, bool CheckAlive=false)	{
	if(!IsClientInGame(client))
		return	false;
	if(client < 1 || client > MaxClients)
		return	false;
	if(IsClientReplay(client))
		return	false;
	if(IsClientSourceTV(client))
		return	false;
	if(CheckAlive)	{
		if(!IsPlayerAlive(client))
			return	false;
	}
	if(GetClientTeam(client) < 1)
		return	false;	//If the client has no team
	return true;
}