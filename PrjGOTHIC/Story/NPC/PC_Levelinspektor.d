
instance PC_Levelinspektor(Npc_Default)
{
	name[0] = "Инспектор";
	npcType = NPCTYPE_MAIN;
	flags = NPC_FLAG_GHOST;
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_PAL_H);
	B_SetFightSkills(self,100);
	EquipItem(self,ItMw_ShortSword3);
	EquipItem(self,ItRw_Bow_L_01);
};

