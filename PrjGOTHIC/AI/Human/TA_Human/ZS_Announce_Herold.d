
func void ZS_Announce_Herold()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Announce_Herold_loop()
{
	if((Npc_GetStateTime(self) >= 70) && (hero.aivar[AIV_INVINCIBLE] == FALSE))
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		B_Announce_Herold();
		Npc_SetStateTime(self,0);
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Announce_Herold_end()
{
};

