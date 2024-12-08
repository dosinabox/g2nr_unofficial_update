
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
		if(C_IsNpc(self,NOV_608_Garwig))
		{
			if(Npc_HasItems(target,Holy_Hammer_MIS))
			{
				B_TransferAllInvItems(target,self,Holy_Hammer_MIS);
				B_Say(self,self,"$GETUPANDBEGONE");
				GarwigThiefOneTime = FALSE;
			};
		}
		else if(C_IsNpc(self,SLD_804_Rod))
		{
			if(Npc_HasItems(target,ItMw_2h_Rod))
			{
				B_TransferAllInvItems(target,self,ItMw_2h_Rod);
				AI_EquipBestMeleeWeapon(self);
			};
		}
		else if(C_IsNpc(self,BAU_970_Orlan))
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
		else if(C_IsNpc(self,VLK_438_Alrik))
		{
			if(Npc_HasItems(target,ItMw_AlriksSword_MIS))
			{
				B_TransferAllInvItems(target,self,ItMw_AlriksSword_MIS);
				AI_EquipBestMeleeWeapon(self);
				MIS_Alrik_Sword = LOG_SUCCESS;
				B_CheckLog();
			};
		}
		else if(C_IsNpc(self,PIR_1350_Addon_Francis))
		{
			if(GregIsBack == FALSE)
			{
				B_TransferAllInvItems(target,self,ItKe_Greg_Addon_MIS);
			};
		};
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
	if(other.guild > GIL_SEPERATOR_HUM)
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

