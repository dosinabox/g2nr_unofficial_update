
instance PC_Rockefeller(Npc_Default)
{
	name[0] = "Рокфеллер";
	npcType = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 100;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	exp = B_GetCurrentLevelExp(self);
	exp_next = B_GetNextLevelExp(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_PAL_H);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	B_GiveAllClassicWeapons(self);
	B_GiveAllClassicArmor(self);
	B_GiveAllClassicRunes(self);
	B_GiveAllClassicScrolls(self);
	B_GiveAllClassicTrophies(self);
	B_GiveAllClassicFood(self);
	B_GiveAllClassicPotions(self);
	B_GiveAllClassicAccessories(self);
	B_GiveAllClassicMiscItems(self);
};

