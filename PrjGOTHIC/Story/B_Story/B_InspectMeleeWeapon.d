
func void B_InspectMeleeWeapon(var C_Npc slf)
{
	if(C_BodyStateContains(slf,BS_SIT))
	{
		AI_Standup(slf);
		B_TurnToNpc(slf,other);
	};
	AI_UnequipWeapons(slf);
	AI_EquipBestMeleeWeapon(slf);
	AI_ReadyMeleeWeapon(slf);
	AI_StopLookAt(slf);
	AI_PlayAni(slf,"T_1HSINSPECT");
	AI_RemoveWeapon(slf);
};

