
instance VLK_439_Vatras_DI(Npc_Default)
{
	name[0] = "Ватрас";
	guild = GIL_KDW;
	id = 4390;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,ITAR_KDW_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_4390;
};


func void Rtn_Start_4390()
{
	TA_Read_Bookstand(8,0,23,0,"SHIP_IN_22");
	TA_Sleep(23,0,8,0,"SHIP_IN_04");
};

