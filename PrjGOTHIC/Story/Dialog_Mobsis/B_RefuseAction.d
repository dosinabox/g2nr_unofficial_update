
func void player_mob_missing_key_or_lockpick()
{
	Print(PRINT_Picklock_or_KeyMissing);
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$PICKLOCKORKEYMISSING");
};

func void player_mob_missing_key()
{
	var int rnd;
	rnd = Hlp_Random(2);
	AI_PlayAni(self,"T_DONTKNOW");
	if(rnd == 0)
	{
		Print(PRINT_KeyMissing);
		B_Say_Overlay(self,self,"$KEYMISSING");
	};
	if(rnd == 1)
	{
		Print("Здесь мне нужен ключ...");
		B_Say_Overlay(self,self,"$NEEDKEY");
	};
};

func void player_mob_missing_lockpick()
{
	var int rnd;
	rnd = Hlp_Random(2);
	if(!Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK))
	{
		Print(PRINT_NoPicklockTalent);
		AI_PlayAni(self,"T_DONTKNOW");
		B_Say_Overlay(self,self,"$NOPICKLOCKTALENT");
	}
	else
	{
		AI_PlayAni(self,"T_DONTKNOW");
		if(rnd == 0)
		{
			Print(PRINT_PicklockMissing);
			B_Say_Overlay(self,self,"$PICKLOCKMISSING");
		};
		if(rnd == 1)
		{
			Print("У меня больше нет отмычек!");
			B_Say_Overlay(self,self,"$NOMOREPICKS");
		};
	};
};

func void player_mob_never_open()
{
	Print(PRINT_NeverOpen);
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$NEVEROPEN");
};

func void player_mob_missing_item()
{
	Print(PRINT_MissingItem);
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$MISSINGITEM");
};

func void player_mob_another_is_using()
{
	Print(PRINT_AnotherUser);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_too_far_away()
{
	Print(PRINT_Toofar_Away);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_wrong_side()
{
	Print(PRINT_WrongSide);
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_trade_not_enough_gold()
{
	Print(PRINT_Trade_Not_Enough_Gold);
};

