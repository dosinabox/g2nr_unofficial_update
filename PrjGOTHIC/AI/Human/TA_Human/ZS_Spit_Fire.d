
func void ZS_Spit_Fire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItLsTorchFirespit) == 0)
	{
		CreateInvItem(self,ItLsTorchFirespit);
	};
};

func int ZS_Spit_Fire_loop()
{
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	if(Npc_GetStateTime(self) > 10)
	{
		AI_UseItemToState(self,ItLsTorchFirespit,5);
		AI_UseItemToState(self,ItLsTorchFirespit,0);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Spit_Fire_end()
{
	AI_UseItemToState(self,ItLsTorchFirespit,-1);
};

