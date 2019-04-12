
var int zsTalkBugfix;

func void ZS_Talk()
{
	var C_Npc target;
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	if(self.guild < GIL_SEPERATOR_HUM)
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
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((Npc_GetAttitude(self,other) == ATT_ANGRY) || (Npc_GetAttitude(self,other) == ATT_HOSTILE))
		{
			if(!C_PlayerIsFakeBandit(self,other) || (self.guild != GIL_BDT))
			{
				Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
			};
		};
		if((self.npcType == NPCTYPE_AMBIENT) || (self.npcType == NPCTYPE_OCAMBIENT) || (self.npcType == NPCTYPE_BL_AMBIENT) || (self.npcType == NPCTYPE_TAL_AMBIENT))
		{
			B_AssignAmbientInfos(self);
			if(C_NpcBelongsToCity(self))
			{
				B_AssignCityGuide(self);
			};
		};
		if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff_NW)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff_DI)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Pardos)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Pardos_NW)))
		{
			B_Addon_GivePotion(self);
		};
		if(C_NpcIsToughGuy(self) && (self.aivar[AIV_ToughGuyNewsOverride] == FALSE))
		{
			B_AssignToughGuyNEWS(self);
		};
		if(C_NpcHasAmbientNews(self))
		{
			B_AssignAmbientNEWS(self);
		};
	};
	if(self.guild == GIL_DRAGON)
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
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			B_StopLookAt(self);
			Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		};
		if(self.guild == GIL_DRAGON)
		{
			AI_PlayAni(self,"T_TALK_2_STAND");
		};
		return LOOP_END;
	}
	else
	{
		zsTalkBugfix = TRUE;
		return LOOP_CONTINUE;
	};
};

func void ZS_Talk_End()
{
	Npc_SetRefuseTalk(other,20);
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || ((Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY)))
	{
		AI_StartState(self,ZS_ObservePlayer,0,"");
	}
	else
	{
	};
};

