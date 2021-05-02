
var int NpcObsessedByDMT;
var int NpcObsessedByDMT_Brutus;
var int NpcObsessedByDMT_Engrom;
var int NpcObsessedByDMT_Vino;
var int NpcObsessedByDMT_Malak;
var int NpcObsessedByDMT_Fernando;
var int NpcObsessedByDMT_Bromor;
var int NpcObsessedByDMT_Sekob;
var int NpcObsessedByDMT_Randolph;

func void B_DMTWurm()
{
	AI_Output(self,other,"DIA_NoName_ObsessedByDMT_19_00");	//Мы видим тебя, червь. Тебе не скрыться от нас.
};

func void B_NpcClearObsessionByDMT(var C_Npc medium)
{
	AI_StopProcessInfos(medium);
	if(NpcObsessedByDMT == TRUE)
	{
		AI_EquipBestMeleeWeapon(medium);
		AI_EquipBestRangedWeapon(medium);
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Sekob))
		{
			AI_EquipArmor(medium,ITAR_Vlk_H);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Randolph))
		{
			AI_EquipArmor(medium,ITAR_Bau_L);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Vino))
		{
			AI_EquipArmor(medium,ITAR_Bau_L);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			AI_EquipArmor(medium,ITAR_Bau_M);
			if(!Npc_IsDead(BAU_962_Bauer))
			{
				Npc_SetTarget(BAU_962_Bauer,medium);
				AI_StartState(BAU_962_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_964_Bauer))
			{
				Npc_SetTarget(BAU_964_Bauer,medium);
				AI_StartState(BAU_964_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_965_Bauer))
			{
				Npc_SetTarget(BAU_965_Bauer,medium);
				AI_StartState(BAU_965_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_966_Bauer))
			{
				Npc_SetTarget(BAU_966_Bauer,medium);
				AI_StartState(BAU_966_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_967_Bauer))
			{
				Npc_SetTarget(BAU_967_Bauer,medium);
				AI_StartState(BAU_967_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_968_Bauer))
			{
				Npc_SetTarget(BAU_968_Bauer,medium);
				AI_StartState(BAU_968_Bauer,ZS_Flee,0,"");
			};
			if(!Npc_IsDead(BAU_969_Bauer))
			{
				Npc_SetTarget(BAU_969_Bauer,medium);
				AI_StartState(BAU_969_Bauer,ZS_Flee,0,"");
			};
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Fernando))
		{
			AI_EquipArmor(medium,ITAR_Governor);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Brutus))
		{
			AI_EquipArmor(medium,ITAR_MIL_L);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Engrom))
		{
			AI_EquipArmor(medium,ITAR_Leather_L);
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Bromor))
		{
			AI_EquipArmor(medium,ITAR_Vlk_H);
		};
		NpcObsessedByDMT = FALSE;
		medium.flags = 0;
		Npc_SetTempAttitude(medium,ATT_ANGRY);
		B_Attack(medium,other,AR_NONE,1);
		Wld_StopEffect("DEMENTOR_FX");
		Snd_Play("MFX_FEAR_CAST");
		B_SCIsObsessed(medium);
	};
};

func void B_NpcObsessedByDMT(var C_Npc medium)
{
	if(NpcObsessedByDMT == FALSE)
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		AI_UnequipWeapons(medium);
		medium.attribute[ATR_MANA_MAX] = CONDITION_ARMOR_DEMENTOR;
		CreateInvItems(medium,ITAR_Fake_Dementor,1);
		AI_EquipArmor(medium,ITAR_Fake_Dementor);
		AI_PlayAni(medium,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",medium,medium,0,0,0,FALSE);
		NpcObsessedByDMT = TRUE;
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Brutus))
		{
			if(MIS_OCGateOpen == TRUE)
			{
				AI_Output(self,other,"DIA_Brutus_ObsessedByDMT_19_00");	//Открыв ворота, ты оказал большую услугу нашему Хозяину, жалкий смертный. Мы возведем часовню в его честь на твоей могиле.
			}
			else
			{
				B_DMTWurm();
			};
			NpcObsessedByDMT_Brutus = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Engrom))
		{
			AI_Output(self,other,"DIA_Engrom_ObsessedByDMT_19_00");	//Поворачивай назад. Пока еще не слишком поздно.
			NpcObsessedByDMT_Engrom = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Vino))
		{
			AI_Output(self,other,"DIA_Vino_ObsessedByDMT_19_00");	//Скоро мы будем управлять всем. Ты и твоя жалкая магия не представляют опасности для нас.
			NpcObsessedByDMT_Vino = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			AI_Output(self,other,"DIA_Malak_ObsessedByDMT_19_00");	//Тебе не спасти эту душу, маг. Он никогда не станет прежним.
			NpcObsessedByDMT_Malak = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Sekob))
		{
			AI_Output(self,other,"DIA_Sekob_ObsessedByDMT_19_00");	//Брось, маг. Тебе не суждено победить.
			NpcObsessedByDMT_Sekob = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Randolph))
		{
			AI_Output(self,other,"DIA_Randolph_ObsessedByDMT_19_00");	//Не трать свои усилия на этого слабака. Мы поработим их всех.
			NpcObsessedByDMT_Randolph = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Bromor))
		{
			B_DMTWurm();
			NpcObsessedByDMT_Bromor = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Fernando))
		{
			B_DMTWurm();
			NpcObsessedByDMT_Fernando = TRUE;
		};
		B_GivePlayerXP(XP_SCFoundObsessedNpc);
	}
	else
	{
		B_NpcClearObsessionByDMT(medium);
	};
};

