
func void B_NpcSetJailed(var C_Npc slf)
{
	if(!Npc_IsDead(slf))
	{
		B_UnEquipAllWeapons(slf,FALSE);
		B_RemoveEveryInvItem(slf,ItMi_Joint);
		B_RemoveEveryInvItem(slf,ItPl_SwampHerb);
		B_RemoveEveryInvItem(slf,ItMi_Addon_Joint_01);
		slf.attribute[ATR_STRENGTH] = 1;
		slf.attribute[ATR_DEXTERITY] = 1;
		if(C_NpcIsMage(slf) || C_NpcIsPaladin(slf) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(Npc_IsDrawingSpell(slf))
			{
				AI_UnreadySpell(slf);
			};
			slf.attribute[ATR_MANA] = 1;
			slf.attribute[ATR_MANA_MAX] = 1;
		};
		slf.aivar[AIV_IGNORE_Murder] = TRUE;
		slf.aivar[AIV_IGNORE_Theft] = TRUE;
		slf.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
		slf.aivar[AIV_CommentedPlayerCrime] = FALSE;
	};
};

func void B_NpcSetReleased(var C_Npc slf)
{
	if(!Npc_IsDead(slf))
	{
		B_SetAttributesToChapter(slf,3);	//только Беннет и Кантар
		slf.aivar[AIV_IGNORE_Murder] = FALSE;
		slf.aivar[AIV_IGNORE_Theft] = FALSE;
		slf.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
		slf.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_EquipBestMeleeWeapon(slf);
		AI_EquipBestRangedWeapon(slf);
	};
};

