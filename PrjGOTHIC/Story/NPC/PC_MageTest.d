
instance PC_MageTest(Npc_Default)
{
	name[0] = "Магический чувак";
	npcType = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	exp = B_GetCurrentLevelExp(self);
	exp_next = B_GetNextLevelExp(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_KDW_L_Addon);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	B_SetFightSkills(self,100);
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_GiveAllAddonRunes(self);
};

