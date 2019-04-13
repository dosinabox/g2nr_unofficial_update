
instance PAL_250_Garond(Npc_Default)
{
	name[0] = "Гаронд";
	guild = GIL_PAL;
	id = 250;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ItAr_PAl_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_PreStart_250;
};


func void Rtn_PreStart_250()
{
	TA_Sit_Throne(8,0,21,0,"OC_EBR_HALL_THRONE");
	TA_Sit_Throne(21,0,8,0,"OC_EBR_HALL_THRONE");
};

func void Rtn_Start_250()
{
	TA_Sit_Throne(8,0,21,0,"OC_EBR_HALL_THRONE");
	TA_Sleep(21,0,8,0,"OC_EBR_ROOM_04_SLEEP");
};

