
instance DIA_Union_GiveItem(C_Info)
{
	nr = 776;
	condition = DIA_Union_GiveItem_Condition;
	information = DIA_Union_GiveItem_Info;
	permanent = TRUE;
	description = "(дать оружие)";
};


func int DIA_Union_GiveItem_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (UnionActivated == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Union_GiveItem_Info()
{
	//todo
};

func void B_Union_GiveItem(var C_Npc slf)
{
	DIA_Union_GiveItem.npc = Hlp_GetInstanceID(slf);
};

