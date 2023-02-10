
var int PlayerIsTransformed;

func void B_StartMagicTransform()
{
	Wld_StopEffect("SLOW_MOTION");
	if(PlayerIsTransformed == FALSE)
	{
		LevelUpsDuringTransform = 0;
		PlayerIsTransformed = TRUE;
	};
};

func void B_StopMagicTransform()
{
	if(PlayerIsTransformed == TRUE)
	{
		if(UnionActivated == TRUE)
		{
			Npc_StopAni(hero,"S_RUN");
			AI_PlayAni(hero,"T_TRFSHOOT_2_STAND");
		}
		else
		{
			AI_UnequipWeapons(hero);
		};
		if(LevelUpsDuringTransform > 0)
		{
			B_IncreaseHeroMaxHP(LevelUpsDuringTransform);
		};
		self.attribute[ATR_HITPOINTS] = 0;
		PlayerIsTransformed = FALSE;
	};
};

