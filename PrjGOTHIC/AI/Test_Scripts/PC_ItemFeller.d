
instance PC_Itemfeller(Npc_Default)
{
	name[0] = "Мистер Вещь";
	npcType = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	exp = B_GetCurrentLevelExp(self);
	exp_next = B_GetNextLevelExp(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_PAL_H);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	B_GiveAllClassicWeapons(self);
	B_GiveAllClassicArmor(self);
	B_GiveAllClassicRunes(self);
	B_GiveAllClassicScrolls(self);
	B_GiveAllClassicKeys(self);
	B_GiveAllClassicTrophies(self);
	B_GiveAllClassicFood(self);
	B_GiveAllClassicDocuments(self);
	B_GiveAllClassicPotions(self);
	B_GiveAllClassicAccessories(self);
	B_GiveAllClassicMiscItems(self);
	B_GiveAllClassicMissionItems(self);
};

