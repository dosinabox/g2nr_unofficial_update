
func void ZS_Stand_Drinking()
{
	var int random;
	Perception_Set_Normal();
	B_ResetAll(self);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Joe))
	{
		AI_SetWalkMode(self,NPC_RUN);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	if(self.aivar[AIV_Gender] == FEMALE)
	{
		random = Hlp_Random(2);
		if(random == DRINK_Wine)
		{
			if(!Npc_HasItems(self,ItFo_Wine))
			{
				CreateInvItem(self,ItFo_Wine);
			};
			self.aivar[AIV_Food] = DRINK_Wine;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Water))
			{
				CreateInvItem(self,ItFo_Water);
			};
			self.aivar[AIV_Food] = DRINK_Water;
		};
	}
	else if(self.guild == GIL_PIR)
	{
		random = Hlp_Random(2) + DRINK_Booze;
		if(random == DRINK_Rum)
		{
			if(!Npc_HasItems(self,ItFo_Addon_Rum))
			{
				CreateInvItem(self,ItFo_Addon_Rum);
			};
			self.aivar[AIV_Food] = DRINK_Rum;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Booze))
			{
				CreateInvItem(self,ItFo_Booze);
			};
			self.aivar[AIV_Food] = DRINK_Booze;
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rukhar)))
	{
		if(!Npc_HasItems(self,ItFo_Beer))
		{
			CreateInvItem(self,ItFo_Beer);
		};
		self.aivar[AIV_Food] = DRINK_Beer;
	}
	else
	{
		random = Hlp_Random(2) + DRINK_Beer;
		if(random == DRINK_Booze)
		{
			if(!Npc_HasItems(self,ItFo_Booze))
			{
				CreateInvItem(self,ItFo_Booze);
			};
			self.aivar[AIV_Food] = DRINK_Booze;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Beer))
			{
				CreateInvItem(self,ItFo_Beer);
			};
			self.aivar[AIV_Food] = DRINK_Beer;
		};
	};
};

func int ZS_Stand_Drinking_Loop()
{
	var int random;
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(self.aivar[AIV_Food] == DRINK_Water)
		{
			AI_UseItemToState(self,ItFo_Water,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Wine)
		{
			AI_UseItemToState(self,ItFo_Wine,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Beer)
		{
			AI_UseItemToState(self,ItFo_Beer,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Booze)
		{
			AI_UseItemToState(self,ItFo_Booze,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Rum)
		{
			AI_UseItemToState(self,ItFo_Addon_Rum,0);
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 7) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(10);
		if(random == 0)
		{
			AI_PlayAniBS(self,"T_POTION_RANDOM_3",BS_ITEMINTERACT);
			AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
		}
		else if(random == 1)
		{
			AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
			AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
		}
		else
		{
			AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_Drinking_End()
{
	if(self.aivar[AIV_Food] == DRINK_Water)
	{
		AI_UseItemToState(self,ItFo_Water,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Wine)
	{
		AI_UseItemToState(self,ItFo_Wine,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Beer)
	{
		AI_UseItemToState(self,ItFo_Beer,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Booze)
	{
		AI_UseItemToState(self,ItFo_Booze,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Rum)
	{
		AI_UseItemToState(self,ItFo_Addon_Rum,-1);
	};
};

