
func void ZS_Pick_Ore()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMw_2H_Axe_L_01) == 0)
	{
		CreateInvItem(self,ItMw_2H_Axe_L_01);
	};
	EquipItem(self,ItMw_2H_Axe_L_01);
};

func int ZS_Pick_Ore_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"ORE"))
	{
		AI_UseMob(self,"ORE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pick_Ore_End()
{
	AI_UseMob(self,"ORE",-1);
};

