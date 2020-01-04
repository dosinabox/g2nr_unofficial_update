
func void ore_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		PrintScreen(PRINT_NothingToPick,-1,53,FONT_ScreenSmall,2);
		/*self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_ORE;
		//AI_ProcessInfos(her);
		AI_ProcessInfos(self);*/
	};
};

