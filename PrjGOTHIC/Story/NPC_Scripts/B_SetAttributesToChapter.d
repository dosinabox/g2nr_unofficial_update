
func void B_SetAttributesToChapter(var C_Npc slf,var int kap)
{
	Npc_SetTalentSkill(slf,NPC_TALENT_MAGE,6);
	if(kap == 0)
	{
		slf.level = 3;
		slf.attribute[ATR_STRENGTH] = 10;
		slf.attribute[ATR_DEXTERITY] = 10;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 40;
		slf.attribute[ATR_HITPOINTS] = 40;
	}
	else if(kap == 1)
	{
		slf.level = 10;
		slf.attribute[ATR_STRENGTH] = 50;
		slf.attribute[ATR_DEXTERITY] = 50;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 160;
		slf.attribute[ATR_HITPOINTS] = 160;
	}
	else if(kap == 2)
	{
		slf.level = 20;
		slf.attribute[ATR_STRENGTH] = 100;
		slf.attribute[ATR_DEXTERITY] = 100;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 280;
		slf.attribute[ATR_HITPOINTS] = 280;
	}
	else if(kap == 3)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 125;
		slf.attribute[ATR_DEXTERITY] = 125;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 400;
		slf.attribute[ATR_HITPOINTS] = 400;
	}
	else if(kap == 4)
	{
		slf.level = 40;
		slf.attribute[ATR_STRENGTH] = 150;
		slf.attribute[ATR_DEXTERITY] = 150;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 520;
		slf.attribute[ATR_HITPOINTS] = 520;
	}
	else if(kap == 5)
	{
		slf.level = 50;
		slf.attribute[ATR_STRENGTH] = 175;
		slf.attribute[ATR_DEXTERITY] = 175;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 640;
		slf.attribute[ATR_HITPOINTS] = 640;
	}
	else
	{
		slf.level = 60;
		slf.attribute[ATR_STRENGTH] = 200;
		slf.attribute[ATR_DEXTERITY] = 200;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 760;
		slf.attribute[ATR_HITPOINTS] = 760;
	};
	slf.exp = B_GetCurrentLevelExp(slf);
	slf.exp_next = B_GetNextLevelExp(slf);
};

