
func void ZS_Preach_Vatras()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int ZS_Preach_Vatras_loop()
{
	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};
		B_Preach_Vatras(self.aivar[AIV_TAPOSITION]);
		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Preach_Vatras_end()
{
};

