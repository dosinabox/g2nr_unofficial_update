
var int zsTalkBugfix;

func void ZS_Talk()
{
	var C_Npc target;
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	B_SetFaceExpression(self,other);
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	if(C_NpcIsHuman(self))
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			target = Npc_GetLookAtTarget(self);
			if(!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc(self,other);
			};
		}
		else
		{
			B_LookAtNpc(self,other);
		};
		AI_RemoveWeapon(self);
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		B_TurnToNpc(self,other);
	};
	if(!C_BodyStateContains(other,BS_SIT))
	{
		B_TurnToNpc(other,self);
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if(C_NpcIsHuman(self))
	{
		if(self.aivar[AIV_DexToSteal] > 0)
		{
			B_AssignPickpocket(self);
		};
		if(C_NpcIsAmbient(self))
		{
			B_AssignAmbientInfos(self);
			if(CurrentLevel == NEWWORLD_ZEN)
			{
				if(C_NpcBelongsToCity(self))
				{
					B_AssignCityGuide(self);
				};
			};
		};
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			if(!C_IsNpc(self,DJG_713_Biff) && !C_IsNpc(self,DJG_713_Biff_NW) && !C_IsNpc(self,DJG_713_Biff_DI))
			{
				B_Addon_GivePotion(self);
			};
		};
		if(C_NpcIsToughGuy(self) && (self.aivar[AIV_ToughGuyNewsOverride] == FALSE))
		{
			B_AssignToughGuyNEWS(self);
		};
		if(C_NpcHasAmbientNews(self))
		{
			B_AssignAmbientNEWS(self);
		};
		if(C_IsNpc(self,BDT_1091_Addon_Lucia))
		{
			if(MIS_LookingForLucia == FALSE)
			{
				MIS_LookingForLucia = LOG_SUCCESS;
			};
		}
		else if(C_IsNpc(self,KDW_1403_Addon_Myxir_NW))
		{
			B_AssignMyxirTeach(self);
		}
		else if(C_IsNpc(self,KDW_14030_Addon_Myxir_ADW))
		{
			B_AssignMyxirTeach(self);
		}
		else if(C_IsNpc(self,KDW_140300_Addon_Myxir_CITY))
		{
			B_AssignMyxirTeach(self);
		};
	}
	else if(self.guild == GIL_DRAGON)
	{
		AI_PlayAni(self,"T_STAND_2_TALK");
	};
	AI_ProcessInfos(self);
	zsTalkBugfix = FALSE;
};

func int ZS_Talk_Loop()
{
	if(InfoManager_HasFinished() && (zsTalkBugfix == TRUE))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		self.aivar[AIV_NpcStartedTalk] = FALSE;
		self.aivar[AIV_TalkedToPlayer] = TRUE;
		if(C_NpcIsHuman(self))
		{
			B_StopLookAt(self);
			B_ResetFaceExpression(self);
		}
		else if(self.guild == GIL_DRAGON)
		{
			AI_PlayAni(self,"T_TALK_2_STAND");
		};
		return LOOP_END;
	}
	else
	{
		zsTalkBugfix = TRUE;
	};
	return LOOP_CONTINUE;
};

func void ZS_Talk_End()
{
	Npc_SetRefuseTalk(other,20);
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || ((Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY)))
	{
		if(C_IsNpc(self,VLK_448_Joe))
		{
			return;
		};
		if(C_IsNpc(self,VLK_401_Cornelius))
		{
			return;
		};
		if(C_IsNpc(self,VLK_422_Salandril))
		{
			if(Salandril_SentToMonastery == TRUE)
			{
				return;
			};
		};
		AI_StartState(self,ZS_ObservePlayer,0,"");
	};
};

