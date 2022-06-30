
const int LOC_ANGAR = 1;
const int LOC_ICE = 2;
const int LOC_SWAMP = 4;
const int LOC_FIRE = 3;
const int LOC_LAKE = 5;
const int LOC_XARDAS = 6;
const int LOC_FAJETHMINE = 7;
const int LOC_SILVESTROMINE = 8;
const int LOC_GRIMESMINE = 9;
const int LOC_BURG = 10;
const int LOC_ORCBARRIER = 11;
const int LOC_ORCBARRIER_FAR = 12;
const int LOC_ROCK = 13;

func int C_DiegoTooFar(var int tolerance)
{
	if(CurrentLevel != OLDWORLD_ZEN)
	{
		return LOC_NONE;
	};
	if(Npc_GetDistToWP(hero,"SPAWN_OW_SHADOWBEAST_10_01") < (4000 + tolerance))
	{
		return LOC_ANGAR;
	};
	if(Npc_GetDistToWP(hero,"OW_ICEREGION_ENTRANCE_01") < (3000 + tolerance))
	{
		return LOC_ICE;
	};
	if(Npc_GetDistToWP(hero,"OW_PATH_046") < (1800 + tolerance))
	{
		return LOC_SWAMP;
	};
	if(Npc_GetDistToWP(hero,"CASTLE_5") < (1500 + tolerance))
	{
		return LOC_FIRE;
	};
	if((Npc_GetDistToWP(hero,"MT16") < (6500 + tolerance)) || (Npc_GetDistToWP(hero,"MT13") < (5500 + tolerance)))
	{
		return LOC_LAKE;
	};
	if((Npc_GetDistToWP(hero,"DT_E1_04") < (1500 + tolerance)) || (Wld_GetPlayerPortalGuild() == GIL_DMT))
	{
		return LOC_XARDAS;
	};
	if((Npc_GetDistToWP(hero,"OW_NEWMINE_03") < (2500 + tolerance)) || (Npc_GetDistToWP(hero,"OW_NEWMINE_03_B") < (2500 + tolerance)))
	{
		return LOC_FAJETHMINE;
	};
	if(Npc_GetDistToWP(hero,"OW_MINE3_OUT") < (1200 + tolerance))
	{
		return LOC_SILVESTROMINE;
	};
	if(Npc_GetDistToWP(hero,"OW_PATH_266") < (3000 + tolerance))
	{
		return LOC_GRIMESMINE;
	};
	if((Npc_GetDistToWP(hero,"OC_CENTER_02") < (12000 + tolerance)) || (Npc_GetDistToWP(hero,"OC_CENTER_05") < (12000 + tolerance)))
	{
		return LOC_BURG;
	};
	if((Npc_GetDistToWP(hero,"OW_ORCBARRIER_08") < (5000 + tolerance)) || (Npc_GetDistToWP(hero,"PATH_OC_PSI_01") < (5000 + tolerance)))
	{
		return LOC_ORCBARRIER;
	};
	if(Npc_GetDistToWP(hero,"OW_PATH_BLOODFLY01_SPAWN01") < (5000 + tolerance))
	{
		return LOC_ORCBARRIER_FAR;
	};
	if(Npc_GetDistToWP(hero,"PATH_TO_PLATEAU04_SMALLPATH") < (1000 + tolerance))
	{
		return LOC_ROCK;
	};
	return LOC_NONE;
};

