
instance NONE_ADDON_112_Rhademes(Npc_Default)
{
	name[0] = "Радемес";
	guild = GIL_NONE;
	id = 112;
	voice = 3;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	protection[PROT_POINT] = 99999999;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Ske_Head",0,BodyTex_N,ITAR_Raven_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_112;
};


func void Rtn_Start_112()
{
	TA_GhostWusel(8,0,20,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
	TA_GhostWusel(20,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
};

func void Rtn_TOT_112()
{
	TA_Ghost(8,0,20,0,"TOT");
	TA_Ghost(20,0,8,0,"TOT");
};

