
func void ZS_RansackBody()
{
	var C_Npc target;
	Perception_Set_Normal();
	AI_Standup(self);
	target = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	AI_GotoNpc(self,target);
};

func int ZS_RansackBody_Loop()
{
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var C_Npc target;
	target = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(C_NpcIsDown(target))
	{
		AI_TurnToNpc(self,target);
		AI_PlayAni(self,"T_PLUNDER");
		B_RemoveStolenItems(self,target);
		if(Npc_HasItems(target,ItMi_Gold))
		{
			B_TransferAllInvItems(target,self,ItMi_Gold);
			if(!C_IsNpc(self,NOV_608_Garwig))
			{
				B_Say(self,target,"$ITOOKYOURGOLD");
			};
		}
		else if(!C_IsNpc(self,NOV_608_Garwig))
		{
			B_Say(self,target,"$SHITNOGOLD");
		};
	};
	if(B_DetectAndTakeItem(self,ITEM_KAT_NF))
	{
		if(!C_IsNpc(self,NOV_608_Garwig))
		{
			B_Say(self,self,"$ITAKEYOURWEAPON");
			AI_EquipBestMeleeWeapon(self);
		};
	};
	if(B_DetectAndTakeItem(self,ITEM_KAT_FF))
	{
		if(!C_IsNpc(self,NOV_608_Garwig))
		{
			B_Say(self,self,"$ITAKEYOURWEAPON");
			AI_EquipBestRangedWeapon(self);
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
	};
};

func void ZS_GetMeat()
{
	Perception_Set_Minimal();
	AI_Standup(self);
	if(!C_NpcIsHuman(other))
	{
		AI_GotoNpc(self,other);
		if(C_NpcIsDown(other))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_PLUNDER");
			B_TransferAllInvItems(other,self,ItFoMuttonRaw);
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
	};
};

