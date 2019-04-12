
func void ZS_Flee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	B_ValidateOther();
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		B_Say_Overlay(self,other,"$RUNAWAY");
	};
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
};

func int ZS_Flee_Loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(C_NpcIsDown(other))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void ZS_Flee_End()
{
	Mdl_RemoveOverlayMds(self,"HUMANS_FLEE.MDS");
	AI_Standup(self);
	AI_StartState(self,ZS_HealSelf,1,"");
};

