
func void ZS_Flee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	/*B_ValidateOther();
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		B_Say_FleeReason();
	};*/
	B_Say_FleeReason();
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_StartFaceAni(self,"S_FRIGHTENED",1,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Flee.mds");
};

func int ZS_Flee_Loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,hero) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(C_NpcIsDown(hero))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void ZS_Flee_End()
{
	B_ResetFaceExpression(self);
	Mdl_RemoveOverlayMDS(self,"Humans_Flee.mds");
	AI_Standup(self);
	AI_StartState(self,ZS_HealSelf,1,"");
};

