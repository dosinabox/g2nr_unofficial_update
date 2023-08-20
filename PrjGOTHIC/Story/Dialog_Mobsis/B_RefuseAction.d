
func void player_mob_missing_key_or_lockpick()
{
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		Print(PRINT_Picklock_or_KeyMissing);
		B_Say_Overlay(self,self,"$PICKLOCKORKEYMISSING");
	};
};

func void player_mob_missing_key()
{
	var int rnd;
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		rnd = Hlp_Random(2);
		if(rnd == 0)
		{
			Print(PRINT_KeyMissing);
			B_Say_Overlay(self,self,"$KEYMISSING");
		}
		else
		{
			Print("Здесь мне нужен ключ...");
			B_Say_Overlay(self,self,"$NEEDKEY");
		};
	};
};

func void player_mob_missing_lockpick()
{
	var int rnd;
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		if(!Npc_GetTalentSkill(self,NPC_TALENT_PICKLOCK))
		{
			Print(PRINT_NoPicklockTalent);
			B_Say_Overlay(self,self,"$NOPICKLOCKTALENT");
		}
		else
		{
			rnd = Hlp_Random(2);
			if(rnd == 0)
			{
				Print(PRINT_PicklockMissing);
				B_Say_Overlay(self,self,"$PICKLOCKMISSING");
			}
			else
			{
				Print("У меня больше нет отмычек!");
				B_Say_Overlay(self,self,"$NOMOREPICKS");
			};
		};
	};
};

func void player_mob_never_open()
{
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		Print(PRINT_NeverOpen);
		B_Say_Overlay(self,self,"$NEVEROPEN");
	};
};

func void player_mob_missing_item()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_MissingItem);
	B_Say_Overlay(self,self,"$MISSINGITEM");
};

func void player_mob_another_is_using()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_AnotherUser);
};

func void player_mob_too_far_away()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_Toofar_Away);
};

func void player_mob_wrong_side()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_WrongSide);
};

func void player_trade_not_enough_gold()
{
	Print(PRINT_Trade_Not_Enough_Gold);
};

