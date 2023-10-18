
func void Player_Mob_Missing_Key_Or_Lockpick()
{
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		Print(PRINT_Picklock_or_KeyMissing);
		B_Say_Overlay(self,self,"$PICKLOCKORKEYMISSING");
	};
};

func void Player_Mob_Missing_Key()
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

func void Player_Mob_Missing_Lockpick()
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

func void Player_Mob_Never_Open()
{
	AI_PlayAni(self,"T_DONTKNOW");
	if(Npc_IsPlayer(self))
	{
		Print(PRINT_NeverOpen);
		B_Say_Overlay(self,self,"$NEVEROPEN");
	};
};

func void Player_Mob_Missing_Item()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_MissingItem);
	B_Say_Overlay(self,self,"$MISSINGITEM");
};

func void Player_Mob_Missing_Something()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_MissingSomething);
	B_Say_Overlay(self,self,"$DOESNTWORK");
};

func void Player_Mob_Another_Is_Using()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_AnotherUser);
};

func void Player_Mob_Too_Far_Away()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_Toofar_Away);
};

func void Player_Mob_Wrong_Side()
{
	AI_PlayAni(self,"T_DONTKNOW");
	Print(PRINT_WrongSide);
};

func void Player_Trade_Not_Enough_Gold()
{
	Print(PRINT_Trade_Not_Enough_Gold);
};

