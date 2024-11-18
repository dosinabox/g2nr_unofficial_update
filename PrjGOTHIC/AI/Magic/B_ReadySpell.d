
func void B_ReadySpell(var C_Npc slf,var int spell,var int mana)
{
	if(slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA_MAX,mana);
	};
	if(slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA,mana);
	};
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		if(Npc_IsDrawingSpell(slf) == spell)
		{
			return;
		};
		if(Npc_GetActiveSpell(slf) == spell)
		{
			return;
		};
		AI_UnreadySpell(slf);
	}
	else if(Npc_IsInFightMode(slf,FMODE_MELEE) || Npc_IsInFightMode(slf,FMODE_FIST))
	{
		AI_RemoveWeapon(slf);
	};
	AI_ReadySpell(slf,spell,mana);
};

