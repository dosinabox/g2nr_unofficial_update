
func void ZS_Stand_Drinking()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItFo_Booze) == 0)
	{
		CreateInvItem(self,ItFo_Booze);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Drinking_loop()
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
		AI_UseItemToState(self,ItFo_Booze,0);
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

func void ZS_Stand_Drinking_end()
{
	AI_UseItemToState(self,ItFo_Booze,-1);
};

