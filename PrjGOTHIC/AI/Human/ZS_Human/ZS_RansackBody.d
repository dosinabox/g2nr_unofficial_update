
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
	if(C_NpcIsDown(other))
	{
		AI_TurnToNpc(self,other);
		AI_PlayAni(self,"T_PLUNDER");
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig))
		{
			if(Npc_HasItems(other,Holy_Hammer_MIS))
			{
				B_TransferAllInvItems(other,self,Holy_Hammer_MIS);
				B_Say(self,self,"$GETUPANDBEGONE");
				GarwigThiefOneTime = FALSE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod))
		{
			if(Npc_HasItems(other,ItMw_2h_Rod))
			{
				B_TransferAllInvItems(other,self,ItMw_2h_Rod);
				AI_EquipBestMeleeWeapon(self);
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Francis))
		{
			if(GregIsBack == FALSE)
			{
				B_TransferAllInvItems(other,self,ItKe_Greg_Addon_MIS);
			};
		};
		if(Npc_HasItems(other,ItMi_Gold))
		{
			B_TransferAllInvItems(other,self,ItMi_Gold);
			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
			{
				B_Say(self,other,"$ITOOKYOURGOLD");
			};
		}
		else if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
		{
			B_Say(self,other,"$SHITNOGOLD");
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF))
	{
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) <= 500))
		{
			AI_TakeItem(self,item);
			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
			{
				B_Say(self,self,"$ITAKEYOURWEAPON");
				AI_EquipBestMeleeWeapon(self);
			};
		};
	};
	if(Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) <= 500))
		{
			AI_TakeItem(self,item);
			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
			{
				B_Say(self,self,"$ITAKEYOURWEAPON");
				AI_EquipBestRangedWeapon(self);
			};
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

func void ZS_GetMeat()
{
	var int count;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	if(C_NpcIsDown(other))
	{
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_PLUNDER");
		count = Npc_HasItems(other,ItFoMuttonRaw);
		if(count > 0)
		{
			CreateInvItems(self,ItFoMuttonRaw,count);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,count);
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

