
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
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig))
		{
			if(Npc_HasItems(target,Holy_Hammer_MIS))
			{
				B_TransferAllInvItems(target,self,Holy_Hammer_MIS);
				B_Say(self,self,"$GETUPANDBEGONE");
				GarwigThiefOneTime = FALSE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod))
		{
			if(Npc_HasItems(target,ItMw_2h_Rod))
			{
				B_TransferAllInvItems(target,self,ItMw_2h_Rod);
				AI_EquipBestMeleeWeapon(self);
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orlan))
		{
			if(Orlan_RoomPaymentRefused == TRUE)
			{
				B_RemoveEveryInvItem(target,ItKe_Orlan_HotelZimmer);
			}
			else if((Orlan_RoomIsRented == TRUE) && (Orlan_RoomIsFree == FALSE))
			{
				if(C_DaysSinceEvent(Orlan_RoomPaymentDay,7))
				{
					Orlan_RoomPaymentDay = Wld_GetDay();
				};
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Francis))
		{
			if(GregIsBack == FALSE)
			{
				B_TransferAllInvItems(target,self,ItKe_Greg_Addon_MIS);
			};
		};
		if(Npc_HasItems(target,ItMi_Gold))
		{
			B_TransferAllInvItems(target,self,ItMi_Gold);
			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
			{
				B_Say(self,target,"$ITOOKYOURGOLD");
			};
		}
		else if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Garwig))
		{
			B_Say(self,target,"$SHITNOGOLD");
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
	var C_Npc target;
	Perception_Set_Minimal();
	AI_Standup(self);
	target = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	AI_GotoNpc(self,target);
	if(C_NpcIsDown(target))
	{
		AI_TurnToNPC(self,target);
		AI_PlayAni(self,"T_PLUNDER");
		B_TransferAllInvItems(target,self,ItFoMuttonRaw);
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

