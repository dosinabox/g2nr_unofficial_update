
func void B_SetFightSkills(var C_Npc slf,var int percent)
{
	B_RaiseFightTalent(slf,NPC_TALENT_1H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_2H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_BOW,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,percent);
};

func void B_SetTeacherFightSkills(var C_Npc slf,var int percent1H,var int percent2H,var int percentBow,var int percentCrossbow)
{
	B_RaiseFightTalent(slf,NPC_TALENT_1H,percent1H);
	B_RaiseFightTalent(slf,NPC_TALENT_2H,percent2H);
	B_RaiseFightTalent(slf,NPC_TALENT_BOW,percentBow);
	B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,percentCrossbow);
};

