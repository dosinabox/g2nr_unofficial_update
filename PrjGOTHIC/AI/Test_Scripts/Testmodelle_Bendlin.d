
/*instance Aya_Testmodell(Npc_Default)
{
	name[0] = "Ёй€";
	guild = GIL_NONE;
	id = 55555;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = Rtn_Start_55555;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_RANSACKED] = TRUE;
	aivar[AIV_DeathInvGiven] = TRUE;
	aivar[AIV_VictoryXPGiven] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	B_SetAttributesToChapter(self,6);
	B_SetFightSkills(self,100);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_BeliarWeapon_Fire);
	CreateInvItems(self,ITAR_BauBabe_L,1);
	CreateInvItems(self,ITAR_BauBabe_M,1);
	CreateInvItems(self,ITAR_VlkBabe_L,1);
	CreateInvItems(self,ITAR_VlkBabe_M,1);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_S,ITAR_VlkBabe_H);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
};


func void Rtn_Start_55555()
{
	TA_Stand_ArmsCrossed(6,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,6,0,"XXX");
};

func void Rtn_Follow_55555()
{
	TA_Follow_Player(8,0,23,0,"XXX");
	TA_Follow_Player(23,0,8,0,"XXX");
};


instance DIA_Aya_KommMit(C_Info)
{
	npc = Aya_Testmodell;
	nr = 1;
	condition = DIA_Aya_KommMit_Condition;
	information = DIA_Aya_KommMit_Info;
	permanent = TRUE;
	description = "’орошо, пошли.";
};


func int DIA_Aya_KommMit_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Aya_KommMit_Info()
{
	var int AyaGoldAmount;
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//’орошо, пошли.
	AyaGoldAmount = Npc_HasItems(other,ItMi_Gold);
	if(AyaGoldAmount > 1000)
	{
		AyaGoldAmount = 1000;
	};
	if(AyaGoldAmount > 0)
	{
		B_Say(self,other,"$WHERETO");
		B_GiveInvItems(other,self,ItMi_Gold,AyaGoldAmount);
		Npc_RemoveInvItems(self,ItMi_Gold,AyaGoldAmount);
	}
	else
	{
		B_Say(self,other,"$SHITNOGOLD");
	};
	AI_StopProcessInfos(self);
	if(AyaGoldAmount > 0)
	{
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Aya_WarteHier(C_Info)
{
	npc = Aya_Testmodell;
	nr = 1;
	condition = DIA_Aya_WarteHier_Condition;
	information = DIA_Aya_WarteHier_Info;
	permanent = TRUE;
	description = "Ѕоюсь, дальше наши пути расход€тс€.";
};


func int DIA_Aya_WarteHier_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Aya_WarteHier_Info()
{
	DIA_Common_ImAfraidThatsTheEndForUs();
	B_Say(self,other,"$YESGOOUTOFHERE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Aya_EXIT(C_Info)
{
	npc = Aya_Testmodell;
	nr = 999;
	condition = DIA_Aya_EXIT_Condition;
	information = DIA_Aya_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Aya_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Aya_EXIT_Info()
{
	AI_StopProcessInfos(self);
};*/

