
func void ZS_Potion_Alchemy()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Constantino))
	{
		if(Constantino_flag == FALSE)
		{
			Constantino_flasks = Npc_HasItems(self,ItMi_Flask);
			Constantino_flag = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Salandril))
	{
		if(Salandril_flag == FALSE)
		{
			Salandril_flasks = Npc_HasItems(self,ItMi_Flask);
			Salandril_flag = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sagitta))
	{
		if(Sagitta_flag == FALSE)
		{
			Sagitta_flasks = Npc_HasItems(self,ItMi_Flask);
			Sagitta_flag = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ignaz))
	{
		if(Ignaz_flag == FALSE)
		{
			Ignaz_flasks = Npc_HasItems(self,ItMi_Flask);
			Ignaz_flag = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lucia))
	{
		if(Lucia_flag == FALSE)
		{
			Lucia_flasks = Npc_HasItems(self,ItMi_Flask);
			Lucia_flag = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Samuel))
	{
		if(Samuel_flag == FALSE)
		{
			Samuel_flasks = Npc_HasItems(self,ItMi_Flask);
			Samuel_flag = TRUE;
		};
	};
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Potion_Alchemy_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"LAB"))
	{
		AI_UseMob(self,"LAB",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Potion_Alchemy_End()
{
	AI_UseMob(self,"LAB",-1);
};

