
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
		AI_UnequipWeapons(hero);
		if(LevelUpsDuringTransform > 0)
		{
			B_IncreaseHeroMaxHP(LevelUpsDuringTransform);
		};
		self.attribute[ATR_HITPOINTS] = 0;
		PlayerIsTransformed = FALSE;
	};
};

