
func void B_UseAvailableMob(var C_Npc npc,var string mob,var int mobBodyState)
{
	if(!C_BodyStateContains(npc,mobBodyState))
	{
		if(Wld_IsMobAvailable(npc,mob))
		{
			AI_UseMob(npc,mob,1);
		};
	};
};

