
func void evt_final_door_say_01()
{
	MOBNAME_DRAGONDOOR = "";
	B_Say(self,self,"$SCOPENSLASTDOOR");
	Snd_Play("LASTDOOREVENT");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
//	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
};

func int FinalDoor_Cond()
{
	if(Read_LastDoorToUndeadDrgDI_MIS == FALSE)
	{
		Player_Mob_Missing_Something();
		return FALSE;
	};
	if(!Npc_HasItems(hero,ItMi_PowerEye))
	{
		Player_Mob_Missing_Item();
		return FALSE;
	};
	return TRUE;
};

