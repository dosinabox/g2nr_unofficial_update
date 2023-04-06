
instance PIR_1320_Addon_Greg(Npc_Default)
{
	name[0] = "Грег";
	guild = GIL_PIR;
	id = 1320;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,111,ItMi_Gold,666);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Greg,BodyTex_N,ITAR_PIR_H_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1320;
};


func void Rtn_Start_1320()
{
	TA_Stand_WP(5,0,20,0,"ADW_PIRATECAMP_GREG");
	TA_Stand_WP(20,0,5,0,"ADW_PIRATECAMP_GREG");
};

func void Rtn_HOME_1320()
{
	TA_Sleep(23,0,7,0,"ADW_PIRATECAMP_HUT4_BED");
	TA_Stand_Eating(7,0,8,0,"WP_BLA_PIR_01");
	TA_Sit_Bench(8,0,22,0,"ADW_PIRATECAMP_HUT4_01");
	TA_Stand_Drinking(22,0,23,0,"WP_BLA_PIR_01");
};

