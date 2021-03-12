
func void ZS_RansackBody()
{
	Perception_Set_Normal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
};

func int ZS_RansackBody_Loop()
{
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var int x;
	if(C_NpcIsDown(other))
	{
		AI_TurnToNpc(self,other);
		AI_PlayAni(self,"T_PLUNDER");
		if(Npc_HasItems(other,Holy_Hammer_MIS) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig)))
		{
			CreateInvItems(self,Holy_Hammer_MIS,1);
			Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
			B_Say(self,self,"$GETUPANDBEGONE");
			GarwigThiefOneTime = FALSE;
		};
		if(Npc_HasItems(other,ItMw_2h_Rod) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod)))
		{
			CreateInvItems(self,ItMw_2h_Rod,1);
			Npc_RemoveInvItems(other,ItMw_2h_Rod,1);
			AI_EquipBestMeleeWeapon(self);
		};
		if(Npc_HasItems(other,ItKe_Greg_Addon_MIS) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Francis)))
		{
			CreateInvItems(self,ItKe_Greg_Addon_MIS,1);
			Npc_RemoveInvItems(other,ItKe_Greg_Addon_MIS,1);
		};
		if(Npc_HasItems(other,ItMi_Gold))
		{
			x = Npc_HasItems(other,ItMi_Gold);
			CreateInvItems(self,ItMi_Gold,x);
			Npc_RemoveInvItems(other,ItMi_Gold,x);
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
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) < 500))
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
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) < 500))
		{
			AI_TakeItem(self,item);
			B_Say(self,self,"$ITAKEYOURWEAPON");
			AI_EquipBestRangedWeapon(self);
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
	var int x;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	if(C_NpcIsDown(other))
	{
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_PLUNDER");
		x = Npc_HasItems(other,ItFoMuttonRaw);
		CreateInvItems(self,ItFoMuttonRaw,x);
		Npc_RemoveInvItems(other,ItFoMuttonRaw,x);
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

