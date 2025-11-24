
func int C_NpcIsWeaponTrader(var C_Npc npc)
{
	if(C_IsNpc(npc,VLK_4303_Addon_Erol))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BDT_1097_Addon_Fisk))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,PIR_1357_Addon_Garett))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BDT_1099_Addon_Huno))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,MIL_350_Addon_Martin))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BDT_1086_Addon_Scatty))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,SLD_809_Bennet_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_468_Canthar))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,SLD_803_Cipher))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_407_Hakon))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BAU_908_Hodges))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_408_Jora))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,SLD_823_Khaled))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_416_Matteo))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BAU_970_Orlan))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,DJG_709_Rethon))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_470_Sarah))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,PAL_260_Tandor))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_413_Bosper))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_4108_Engor))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,BAU_936_Rosi))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_TraderCanEquipRangedWeapon(var C_Npc npc)
{
	if(C_IsNpc(npc,PIR_1357_Addon_Garett))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_4108_Engor))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_413_Bosper))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,PC_Thief_DI))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,PAL_260_Tandor))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,PAL_267_Sengrath))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,SLD_823_Khaled))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,SLD_803_Cipher))
	{
		return TRUE;
	};
	return FALSE;
};

