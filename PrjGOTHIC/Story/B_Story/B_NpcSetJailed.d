
func void B_NpcSetJailed(var C_Npc slf)
{
	if(!Npc_IsDead(slf))
	{
		B_UnEquipAllWeapons(slf,FALSE);
		Npc_RemoveInvItems(slf,ItMi_Joint,Npc_HasItems(slf,ItMi_Joint));
		slf.attribute[ATR_STRENGTH] = Condition_VLKDolch - 1;		//боец не может использовать даже кинжал
		slf.attribute[ATR_DEXTERITY] = Condition_Kurzbogen - 1;		//стрелок не может использовать даже короткий лук
		if((slf.guild == GIL_KDF) || (slf.guild == GIL_KDW) || (slf.guild == GIL_PAL) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(Npc_IsDrawingSpell(slf))
			{
				AI_UnreadySpell(slf);
			};
			slf.attribute[ATR_MANA] = Spl_Cost_Scroll - 1;		//маг не может использовать даже свиток
			slf.attribute[ATR_MANA_MAX] = Spl_Cost_Scroll - 1;
		};
		slf.aivar[AIV_IGNORE_Murder] = TRUE;	//игнорирование преступлений игрока
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
		slf.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_EquipBestMeleeWeapon(slf);
		AI_EquipBestRangedWeapon(slf);
	};
};

