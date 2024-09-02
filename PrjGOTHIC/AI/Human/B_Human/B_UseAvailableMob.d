
func void B_UseAvailableMob(var C_Npc npc,var string mob)
{
	if(!C_BodyStateContains(npc,BS_MOBINTERACT_INTERRUPT))
	{
		if(Wld_IsMobAvailable(npc,mob))
		{
			AI_UseMob(npc,mob,1);
		};
	};
};

