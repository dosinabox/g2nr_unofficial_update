
/*func void B_ReadySpell(var C_Npc slf,var int spell,var int mana)
{
	if(slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA_MAX,mana);
	};
	if(slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA,mana);
	};
	if(Npc_IsDrawingSpell(slf) == spell)
	{
		return;
	};
	if(Npc_GetActiveSpell(slf) == spell)
	{
		return;
	}
	else if(Npc_GetActiveSpell(slf) != -1)
	{
		AI_RemoveWeapon(slf);
	};
	AI_ReadySpell(slf,spell,mana);
};*/

//новый алгоритм от N1kX
func void B_ReadySpell(var C_Npc slf,var int spell,var int mana)
{
	//восстановление маны (хотя я не знаю зачем, если неписи и так при касте не тратят свою ману)
	if(slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA_MAX,mana);
	};
	if(slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA,mana);
	};
	//конец восстановления маны
	//если непись хочет использовать магию
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		//если используемое заклинание равно заклинанию
		if(Npc_IsDrawingSpell(slf) == spell)
		{
			//использовать
			return;
		};
		//если текущее заклинание равно выбранному заклинанию
		if(Npc_GetActiveSpell(slf) == spell)
		{
			//использовать
			return;
		}
		else
		{
			//убрать заклинание
			AI_UnreadySpell(slf);
		};
	}
	else
	{
		//если непись находится в режиме ближнего боя или кулачного боя
		if(Npc_IsInFightMode(slf,FMODE_MELEE) || Npc_IsInFightMode(slf,FMODE_FIST))
		{
			//убрать оружие
			AI_RemoveWeapon(slf);
		};
	};
	//использовать заклинание
	AI_ReadySpell(slf,spell,mana);
};

