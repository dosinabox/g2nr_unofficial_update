
func void B_InspectMeleeWeapon(var C_Npc slf)
{
	AI_UnequipWeapons(slf);
	AI_EquipBestMeleeWeapon(slf);
	AI_ReadyMeleeWeapon(slf);
	AI_PlayAni(slf,"T_1HSINSPECT");
	AI_RemoveWeapon(slf);
};

