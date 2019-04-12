
func void B_SetFightSkills(var C_Npc slf,var int percent)
{
	B_RaiseFightTalent(slf,NPC_TALENT_1H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_2H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_BOW,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,percent);
};

