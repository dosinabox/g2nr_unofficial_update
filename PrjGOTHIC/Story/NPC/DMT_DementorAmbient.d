
prototype Default_AmbientDementor(C_Npc)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	voice = 19;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
};

instance DMT_DementorAmbient(Default_AmbientDementor)
{
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSpeaker(Default_AmbientDementor)
{
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientWalker1(Default_AmbientDementor)
{
	id = 1221;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1221;
};


func void Rtn_Start_1221()
{
	TA_Stand_Dementor(6,0,7,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(7,0,8,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(8,0,9,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(9,0,10,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(10,0,11,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(11,0,12,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(12,0,13,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(13,0,14,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(14,0,15,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(15,0,16,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(16,0,17,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(17,0,18,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(18,0,19,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(19,0,20,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(20,0,21,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(21,0,22,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(22,0,23,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(23,0,0,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(0,0,1,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(1,0,2,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(2,0,3,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(3,0,4,0,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor(4,0,5,0,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor(5,0,6,0,"NW_FARM1_CITYWALL_05");
};


instance DMT_DementorAmbientWalker2(Default_AmbientDementor)
{
	id = 1222;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1222;
};


func void Rtn_Start_1222()
{
	TA_Stand_Dementor(6,0,7,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(7,0,8,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(8,0,9,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(9,0,10,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(10,0,11,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(11,0,12,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(12,0,13,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(13,0,14,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(14,0,15,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(15,0,16,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(16,0,17,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(17,0,18,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(18,0,19,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(19,0,20,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(20,0,21,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(21,0,22,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(22,0,23,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(23,0,0,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(0,0,1,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(1,0,2,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(2,0,3,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(3,0,4,0,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor(4,0,5,0,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor(5,0,6,0,"NW_XARDAS_VALLEY_03");
};


instance DMT_DementorAmbientWalker3(Default_AmbientDementor)
{
	id = 1223;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1223;
};


func void Rtn_Start_1223()
{
	TA_Stand_Dementor(6,0,7,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(7,0,8,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(8,0,9,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(9,0,10,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(10,0,11,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(11,0,12,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(12,0,13,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(13,0,14,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(14,0,15,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(15,0,16,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(16,0,17,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(17,0,18,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(18,0,19,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(19,0,20,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(20,0,21,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(21,0,22,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(22,0,23,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(23,0,0,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(0,0,1,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(1,0,2,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(2,0,3,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(3,0,4,0,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor(4,0,5,0,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor(5,0,6,0,"NW_CITY_TO_FARM2_10");
};


instance DMT_DementorAmbientWalker4(Default_AmbientDementor)
{
	id = 1224;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1224;
};


func void Rtn_Start_1224()
{
	TA_Stand_Dementor(6,0,7,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(7,0,8,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(8,0,9,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(9,0,10,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(10,0,11,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(11,0,12,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(12,0,13,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(13,0,14,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(14,0,15,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(15,0,16,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(16,0,17,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(17,0,18,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(18,0,19,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(19,0,20,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(20,0,21,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(21,0,22,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(22,0,23,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(23,0,0,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(0,0,1,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(1,0,2,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(2,0,3,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(3,0,4,0,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor(4,0,5,0,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor(5,0,6,0,"NW_TAVERNE_BIGFARM_05");
};


instance DMT_DementorAmbientWalker5(Default_AmbientDementor)
{
	id = 1225;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1225;
};


func void Rtn_Start_1225()
{
	TA_Stand_Dementor(6,0,7,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(7,0,8,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(8,0,9,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(9,0,10,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(10,0,11,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(11,0,12,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(12,0,13,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(13,0,14,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(14,0,15,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(15,0,16,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(16,0,17,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(17,0,18,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(18,0,19,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(19,0,20,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(20,0,21,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(21,0,22,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(22,0,23,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(23,0,0,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(0,0,1,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(1,0,2,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(2,0,3,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(3,0,4,0,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor(4,0,5,0,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor(5,0,6,0,"NW_BIGMILL_FARM3_03");
};


instance DMT_DementorAmbientWalker6(Default_AmbientDementor)
{
	id = 1226;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1226;
};


func void Rtn_Start_1226()
{
	TA_Stand_Dementor(6,0,7,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(7,0,8,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(8,0,9,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(9,0,10,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(10,0,11,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(11,0,12,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(12,0,13,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(13,0,14,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(14,0,15,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(15,0,16,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(16,0,17,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(17,0,18,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(18,0,19,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(19,0,20,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(20,0,21,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(21,0,22,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(22,0,23,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(23,0,0,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(0,0,1,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(1,0,2,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(2,0,3,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(3,0,4,0,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor(4,0,5,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(5,0,6,0,"NW_BIGMILL_PATH_06");
};


instance DMT_DementorAmbientWalker7(Default_AmbientDementor)
{
	id = 1227;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1227;
};


func void Rtn_Start_1227()
{
	TA_Stand_Dementor(6,0,7,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(7,0,8,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(8,0,9,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(9,0,10,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(10,0,11,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(11,0,12,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(12,0,13,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(13,0,14,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(14,0,15,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(15,0,16,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(16,0,17,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(17,0,18,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(18,0,19,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(19,0,20,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(20,0,21,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(21,0,22,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(22,0,23,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(23,0,0,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(0,0,1,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(1,0,2,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(2,0,3,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(3,0,4,0,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor(4,0,5,0,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor(5,0,6,0,"NW_TROLLAREA_RIVERSIDE_10");
};


instance DMT_DementorAmbientWalker8(Default_AmbientDementor)
{
	id = 1228;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1228;
};


func void Rtn_Start_1228()
{
	TA_Stand_Dementor(6,0,7,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(7,0,8,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(8,0,9,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(9,0,10,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(10,0,11,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(11,0,12,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(12,0,13,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(13,0,14,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(14,0,15,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(15,0,16,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(16,0,17,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(17,0,18,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(18,0,19,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(19,0,20,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(20,0,21,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(21,0,22,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(22,0,23,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(23,0,0,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(0,0,1,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(1,0,2,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(2,0,3,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(3,0,4,0,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor(4,0,5,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor(5,0,6,0,"NW_TROLLAREA_PLANE_08");
};


instance DMT_DementorAmbientWalker9(Default_AmbientDementor)
{
	id = 1229;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1229;
};


func void Rtn_Start_1229()
{
	TA_Stand_Dementor(6,0,7,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(7,0,8,0,"BIGCROSS");
	TA_Stand_Dementor(8,0,9,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(9,0,10,0,"BIGCROSS");
	TA_Stand_Dementor(10,0,11,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(11,0,12,0,"BIGCROSS");
	TA_Stand_Dementor(12,0,13,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(13,0,14,0,"BIGCROSS");
	TA_Stand_Dementor(14,0,15,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(15,0,16,0,"BIGCROSS");
	TA_Stand_Dementor(16,0,17,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(17,0,18,0,"BIGCROSS");
	TA_Stand_Dementor(18,0,19,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(19,0,20,0,"BIGCROSS");
	TA_Stand_Dementor(20,0,21,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(21,0,22,0,"BIGCROSS");
	TA_Stand_Dementor(22,0,23,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(23,0,0,0,"BIGCROSS");
	TA_Stand_Dementor(0,0,1,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(1,0,2,0,"BIGCROSS");
	TA_Stand_Dementor(2,0,3,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(3,0,4,0,"BIGCROSS");
	TA_Stand_Dementor(4,0,5,0,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor(5,0,6,0,"BIGCROSS");
};


instance DMT_DementorAmbientWalker10(Default_AmbientDementor)
{
	id = 1230;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1230;
};


func void Rtn_Start_1230()
{
	TA_Stand_Dementor(6,0,7,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(7,0,8,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(8,0,9,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(9,0,10,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(10,0,11,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(11,0,12,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(12,0,13,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(13,0,14,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(14,0,15,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(15,0,16,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(16,0,17,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(17,0,18,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(18,0,19,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(19,0,20,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(20,0,21,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(21,0,22,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(22,0,23,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(23,0,0,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(0,0,1,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(1,0,2,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(2,0,3,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(3,0,4,0,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor(4,0,5,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor(5,0,6,0,"NW_TROLLAREA_RITUALFOREST_17");
};


instance DMT_DementorAmbientWalker11(Default_AmbientDementor)
{
	id = 1231;
	aivar[AIV_EnemyOverride] = TRUE;
	daily_routine = Rtn_Start_1231;
};


func void Rtn_Start_1231()
{
	TA_Stand_Dementor(6,0,7,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(7,0,8,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(8,0,9,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(9,0,10,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(10,0,11,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(11,0,12,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(12,0,13,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(13,0,14,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(14,0,15,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(15,0,16,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(16,0,17,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(17,0,18,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(18,0,19,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(19,0,20,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(20,0,21,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(21,0,22,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(22,0,23,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(23,0,0,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(0,0,1,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(1,0,2,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(2,0,3,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(3,0,4,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(4,0,5,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(5,0,6,0,"NW_FOREST_PATH_79");
};


instance DMT_DementorSpeakerVino1(Default_AmbientDementor)
{
	id = 1232;
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino2(Default_AmbientDementor)
{
	id = 1233;
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino3(Default_AmbientDementor)
{
	id = 1234;
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino4(Default_AmbientDementor)
{
	id = 1235;
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob1(Default_AmbientDementor)
{
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob2(Default_AmbientDementor)
{
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob3(Default_AmbientDementor)
{
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob4(Default_AmbientDementor)
{
	start_aistate = ZS_Stand_Dementor;
};

instance CastlemineDMT(Default_AmbientDementor)
{
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_Stand_Dementor;
};

instance DragonIsle_Keymaster(Default_AmbientDementor)
{
	name[0] = "Ключник";
	id = 1236;
	aivar[AIV_EnemyOverride] = TRUE;
	CreateInvItem(self,ItKe_EVT_UNDEAD_02);
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientWalker_DI_01(Default_AmbientDementor)
{
	id = 1237;
	daily_routine = Rtn_Start_1237;
};


func void Rtn_Start_1237()
{
	TA_Stand_Dementor(6,0,6,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(6,10,6,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(6,20,6,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(6,30,6,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(6,40,6,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(6,50,7,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(7,0,7,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(7,10,7,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(7,20,7,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(7,30,7,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(7,40,7,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(7,50,8,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(8,0,8,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(8,10,8,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(8,20,8,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(8,30,8,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(8,40,8,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(8,50,9,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(9,0,9,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(9,10,9,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(9,20,9,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(9,30,9,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(9,40,9,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(9,50,10,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(10,0,10,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(10,50,11,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(11,0,11,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(11,50,12,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(12,0,12,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(12,50,13,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(13,0,13,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(13,50,14,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(14,0,14,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(14,50,15,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(15,0,15,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(15,50,16,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(16,0,16,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(16,50,17,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(17,0,17,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(17,50,18,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(18,0,18,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(18,50,19,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(19,0,19,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(19,50,20,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(20,0,20,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(20,50,21,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(21,0,21,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(21,50,22,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(22,0,22,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(22,50,23,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(23,0,23,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(23,50,0,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(0,0,0,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(0,10,0,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(0,20,0,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(0,30,0,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(0,40,0,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(0,50,1,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(1,0,1,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(1,10,1,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(1,20,1,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(1,30,1,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(1,40,1,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(1,50,2,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(2,0,2,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(2,10,2,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(2,20,2,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(2,30,2,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(2,40,2,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(2,50,3,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(3,0,3,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(3,10,3,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(3,20,3,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(3,30,3,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(3,40,3,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(3,50,4,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(4,0,4,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(4,10,4,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(4,20,4,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(4,30,4,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(4,40,4,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(4,50,5,0,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(5,0,5,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(5,10,5,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(5,20,5,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor(5,30,5,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor(5,40,5,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor(5,50,6,0,"DI_UNDEADDRAGONTEMPEL_03");
};


instance DMT_DementorAmbientWalker_DI_02(Default_AmbientDementor)
{
	id = 1238;
	daily_routine = Rtn_Start_1238;
};


func void Rtn_Start_1238()
{
	TA_Stand_Dementor(6,0,6,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(6,10,6,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,20,6,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(6,30,6,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,40,6,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(6,50,7,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,0,7,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(7,10,7,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,20,7,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(7,30,7,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,40,7,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(7,50,8,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,0,8,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(8,10,8,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,20,8,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(8,30,8,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,40,8,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(8,50,9,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,0,9,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(9,10,9,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,20,9,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(9,30,9,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,40,9,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(9,50,10,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,0,10,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(10,50,11,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,0,11,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(11,50,12,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,0,12,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(12,50,13,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,0,13,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(13,50,14,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,0,14,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(14,50,15,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,0,15,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(15,50,16,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,0,16,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(16,50,17,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,0,17,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(17,50,18,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,0,18,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(18,50,19,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,0,19,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(19,50,20,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,0,20,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(20,50,21,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,0,21,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(21,50,22,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,0,22,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(22,50,23,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,0,23,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(23,50,0,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,0,0,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(0,10,0,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,20,0,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(0,30,0,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,40,0,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(0,50,1,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,0,1,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(1,10,1,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,20,1,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(1,30,1,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,40,1,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(1,50,2,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,0,2,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(2,10,2,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,20,2,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(2,30,2,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,40,2,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(2,50,3,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,0,3,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(3,10,3,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,20,3,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(3,30,3,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,40,3,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(3,50,4,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,0,4,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(4,10,4,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,20,4,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(4,30,4,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,40,4,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(4,50,5,0,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,0,5,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(5,10,5,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,20,5,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(5,30,5,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,40,5,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(5,50,6,0,"DI_UNDEADDRAGONTEMPEL_02");
};


instance DMT_DementorAmbientWalker_DI_03(Default_AmbientDementor)
{
	id = 1239;
	daily_routine = Rtn_Start_1239;
};


func void Rtn_Start_1239()
{
	TA_Stand_Dementor(6,0,6,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(6,10,6,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(6,20,6,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(6,30,6,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(6,40,6,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(6,50,7,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(7,0,7,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(7,10,7,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(7,20,7,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(7,30,7,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(7,40,7,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(7,50,8,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(8,0,8,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(8,10,8,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(8,20,8,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(8,30,8,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(8,40,8,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(8,50,9,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(9,0,9,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(9,10,9,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(9,20,9,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(9,30,9,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(9,40,9,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(9,50,10,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(10,0,10,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(10,50,11,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(11,0,11,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(11,50,12,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(12,0,12,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(12,50,13,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(13,0,13,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(13,50,14,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(14,0,14,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(14,50,15,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(15,0,15,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(15,50,16,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(16,0,16,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(16,50,17,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(17,0,17,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(17,50,18,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(18,0,18,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(18,50,19,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(19,0,19,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(19,50,20,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(20,0,20,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(20,50,21,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(21,0,21,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(21,50,22,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(22,0,22,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(22,50,23,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(23,0,23,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(23,50,0,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(0,0,0,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(0,10,0,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(0,20,0,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(0,30,0,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(0,40,0,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(0,50,1,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(1,0,1,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(1,10,1,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(1,20,1,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(1,30,1,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(1,40,1,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(1,50,2,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(2,0,2,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(2,10,2,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(2,20,2,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(2,30,2,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(2,40,2,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(2,50,3,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(3,0,3,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(3,10,3,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(3,20,3,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(3,30,3,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(3,40,3,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(3,50,4,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(4,0,4,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(4,10,4,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(4,20,4,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(4,30,4,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(4,40,4,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(4,50,5,0,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(5,0,5,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(5,10,5,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(5,20,5,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor(5,30,5,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor(5,40,5,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor(5,50,6,0,"DI_UNDEADDRAGONTEMPEL_12");
};


instance DMT_DementorAmbientWalker_DI_04(Default_AmbientDementor)
{
	id = 1240;
	daily_routine = Rtn_Start_1240;
};


func void Rtn_Start_1240()
{
	TA_Stand_Dementor(6,5,6,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(6,15,6,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(6,25,6,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(6,35,6,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(6,45,6,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,55,7,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(7,5,7,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(7,15,7,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(7,25,7,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(7,35,7,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(7,45,7,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,55,8,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(8,5,8,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(8,15,8,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(8,25,8,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(8,35,8,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(8,45,8,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,55,9,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(9,5,9,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(9,15,9,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(9,25,9,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(9,35,9,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(9,45,9,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,55,10,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(10,5,10,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,55,11,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(11,5,11,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,55,12,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(12,5,12,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,55,13,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(13,5,13,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,55,14,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(14,5,14,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,55,15,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(15,5,15,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,55,16,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(16,5,16,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,55,17,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(17,5,17,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,55,18,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(18,5,18,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,55,19,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(19,5,19,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,55,20,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(20,5,20,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,55,21,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(21,5,21,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,55,22,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(22,5,22,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,55,23,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(23,5,23,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,55,0,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(0,5,0,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(0,15,0,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(0,25,0,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(0,35,0,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(0,45,0,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,55,1,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(1,5,1,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(1,15,1,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(1,25,1,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(1,35,1,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(1,45,1,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,55,2,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(2,5,2,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(2,15,2,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(2,25,2,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(2,35,2,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(2,45,2,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,55,3,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(3,5,3,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(3,15,3,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(3,25,3,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(3,35,3,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(3,45,3,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,55,4,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(4,5,4,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(4,15,4,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(4,25,4,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(4,35,4,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(4,45,4,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,55,5,5,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(5,5,5,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(5,15,5,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(5,25,5,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor(5,35,5,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor(5,45,5,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,55,6,5,"DI_UNDEADDRAGONTEMPEL_01");
};


instance DMT_DementorAmbientWalker_DI_05(Default_AmbientDementor)
{
	id = 1242;
	daily_routine = Rtn_Start_1242;
};


func void Rtn_Start_1242()
{
	TA_Stand_Dementor(6,5,6,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,15,6,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(6,25,6,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,35,6,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(6,45,6,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(6,55,7,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,5,7,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,15,7,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,25,7,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,35,7,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,45,7,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(7,55,8,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,5,8,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,15,8,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,25,8,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,35,8,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,45,8,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(8,55,9,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,5,9,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,15,9,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,25,9,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,35,9,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,45,9,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(9,55,10,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,5,10,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(10,55,11,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,5,11,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(11,55,12,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,5,12,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(12,55,13,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,5,13,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(13,55,14,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,5,14,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(14,55,15,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,5,15,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(15,55,16,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,5,16,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(16,55,17,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,5,17,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(17,55,18,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,5,18,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(18,55,19,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,5,19,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(19,55,20,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,5,20,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(20,55,21,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,5,21,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(21,55,22,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,5,22,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(22,55,23,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,5,23,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(23,55,0,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,5,0,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,15,0,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,25,0,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,35,0,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,45,0,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(0,55,1,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,5,1,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,15,1,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,25,1,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,35,1,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,45,1,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(1,55,2,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,5,2,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,15,2,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,25,2,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,35,2,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,45,2,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(2,55,3,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,5,3,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,15,3,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,25,3,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,35,3,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,45,3,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(3,55,4,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,5,4,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,15,4,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,25,4,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,35,4,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,45,4,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(4,55,5,5,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,5,5,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,15,5,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,25,5,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,35,5,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,45,5,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor(5,55,6,5,"DI_UNDEADDRAGONTEMPEL_11");
};


instance DMT_DementorAmbientWalker_DI_06(Default_AmbientDementor)
{
	id = 1243;
	daily_routine = Rtn_Start_1243;
};


func void Rtn_Start_1243()
{
	TA_Stand_Dementor(6,5,6,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(6,15,6,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(6,25,6,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(6,35,6,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(6,45,6,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(6,55,7,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(7,5,7,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,15,7,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(7,25,7,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,35,7,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(7,45,7,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(7,55,8,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(8,5,8,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,15,8,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(8,25,8,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,35,8,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(8,45,8,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(8,55,9,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(9,5,9,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,15,9,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(9,25,9,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,35,9,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(9,45,9,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(9,55,10,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(10,5,10,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(10,55,11,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(11,5,11,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(11,55,12,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(12,5,12,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(12,55,13,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(13,5,13,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(13,55,14,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(14,5,14,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(14,55,15,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(15,5,15,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(15,55,16,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(16,5,16,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(16,55,17,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(17,5,17,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(17,55,18,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(18,5,18,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(18,55,19,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(19,5,19,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(19,55,20,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(20,5,20,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(20,55,21,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(21,5,21,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(21,55,22,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(22,5,22,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(22,55,23,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(23,5,23,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(23,55,0,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(0,5,0,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,15,0,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(0,25,0,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,35,0,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(0,45,0,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(0,55,1,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(1,5,1,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,15,1,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(1,25,1,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,35,1,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(1,45,1,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(1,55,2,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(2,5,2,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,15,2,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(2,25,2,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,35,2,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(2,45,2,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(2,55,3,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(3,5,3,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,15,3,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(3,25,3,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,35,3,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(3,45,3,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(3,55,4,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(4,5,4,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,15,4,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(4,25,4,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,35,4,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(4,45,4,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(4,55,5,5,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(5,5,5,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,15,5,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(5,25,5,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,35,5,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor(5,45,5,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor(5,55,6,5,"DI_UNDEADDRAGONTEMPEL_05");
};

