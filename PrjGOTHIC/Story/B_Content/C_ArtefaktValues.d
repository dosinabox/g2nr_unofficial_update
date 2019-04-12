
func int C_HP_ArtefaktValue()
{
	var int HP_Artefakt_Value;
	HP_Artefakt_Value = 0;
	if(HP_Amulett_Equipped == TRUE)
	{
		if(HP_Ring_1_Equipped == TRUE)
		{
			if(HP_Ring_2_Equipped == TRUE)
			{
				if(HP_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					HP_Artefakt_Effekt = TRUE;
				};
				HP_Artefakt_Value = HP_Amulett_Artefakt_Bonus;
			}
			else
			{
				HP_Artefakt_Value = HP_Amulett_EinRing_Bonus;
			};
		}
		else if(HP_Ring_2_Equipped == TRUE)
		{
			HP_Artefakt_Value = HP_Amulett_EinRing_Bonus;
		}
		else
		{
			HP_Artefakt_Value = HP_Amulett_Solo_Bonus;
		};
	}
	else if(HP_Ring_1_Equipped == TRUE)
	{
		if(HP_Ring_2_Equipped == TRUE)
		{
			HP_Artefakt_Value = HP_Ring_Double_Bonus;
		}
		else
		{
			HP_Artefakt_Value = HP_Ring_Solo_Bonus;
		};
	}
	else if(HP_Ring_2_Equipped == TRUE)
	{
		HP_Artefakt_Value = HP_Ring_Solo_Bonus;
	};
	return HP_Artefakt_Value;
};

func int C_MA_ArtefaktValue()
{
	var int MA_Artefakt_Value;
	MA_Artefakt_Value = 0;
	if(MA_Amulett_Equipped == TRUE)
	{
		if(MA_Ring_1_Equipped == TRUE)
		{
			if(MA_Ring_2_Equipped == TRUE)
			{
				if(MA_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					MA_Artefakt_Effekt = TRUE;
				};
				MA_Artefakt_Value = MA_Amulett_Artefakt_Bonus;
			}
			else
			{
				MA_Artefakt_Value = MA_Amulett_EinRing_Bonus;
			};
		}
		else if(MA_Ring_2_Equipped == TRUE)
		{
			MA_Artefakt_Value = MA_Amulett_EinRing_Bonus;
		}
		else
		{
			MA_Artefakt_Value = MA_Amulett_Solo_Bonus;
		};
	}
	else if(MA_Ring_1_Equipped == TRUE)
	{
		if(MA_Ring_2_Equipped == TRUE)
		{
			MA_Artefakt_Value = MA_Ring_Double_Bonus;
		}
		else
		{
			MA_Artefakt_Value = MA_Ring_Solo_Bonus;
		};
	}
	else if(MA_Ring_2_Equipped == TRUE)
	{
		MA_Artefakt_Value = MA_Ring_Solo_Bonus;
	};
	return MA_Artefakt_Value;
};

func int C_STR_ArtefaktValue()
{
	var int STR_Artefakt_Value;
	STR_Artefakt_Value = 0;
	if(STR_Amulett_Equipped == TRUE)
	{
		if(STR_Ring_1_Equipped == TRUE)
		{
			if(STR_Ring_2_Equipped == TRUE)
			{
				if(STR_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
					Snd_Play("MFX_LIGHT_CAST");
					STR_Artefakt_Effekt = TRUE;
				};
				STR_Artefakt_Value = STR_Amulett_Artefakt_Bonus;
			}
			else
			{
				STR_Artefakt_Value = STR_Amulett_EinRing_Bonus;
			};
		}
		else if(STR_Ring_2_Equipped == TRUE)
		{
			STR_Artefakt_Value = STR_Amulett_EinRing_Bonus;
		}
		else
		{
			STR_Artefakt_Value = STR_Amulett_Solo_Bonus;
		};
	}
	else if(STR_Ring_1_Equipped == TRUE)
	{
		if(STR_Ring_2_Equipped == TRUE)
		{
			STR_Artefakt_Value = STR_Ring_Double_Bonus;
		}
		else
		{
			STR_Artefakt_Value = STR_Ring_Solo_Bonus;
		};
	}
	else if(STR_Ring_2_Equipped == TRUE)
	{
		STR_Artefakt_Value = STR_Ring_Solo_Bonus;
	};
	return STR_Artefakt_Value;
};

