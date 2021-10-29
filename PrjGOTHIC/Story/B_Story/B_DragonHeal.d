
func void B_DragonHeal(var C_Npc dragon)
{
	dragon.aivar[AIV_TAPOSITION] += 1;
	if((dragon.attribute[ATR_HITPOINTS] < dragon.attribute[ATR_HITPOINTS_MAX]) && (dragon.aivar[AIV_TAPOSITION] >= 2))
	{
		dragon.attribute[ATR_HITPOINTS] += 1;
		dragon.aivar[AIV_TAPOSITION] = 0;
	};
};

