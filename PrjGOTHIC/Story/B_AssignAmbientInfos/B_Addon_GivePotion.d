
instance DIA_Addon_GivePotion(C_Info)
{
	nr = 777;
	condition = DIA_Addon_GivePotion_Condition;
	information = DIA_Addon_GivePotion_Info;
	permanent = TRUE;
	description = "(дать лечебное зелье)";
};


func int DIA_Addon_GivePotion_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.flags != NPC_FLAG_IMMORTAL))
	{
		if((Npc_HasItems(other,ItPo_Health_01) >= 1) || (Npc_HasItems(other,ItPo_Health_02) >= 1) || (Npc_HasItems(other,ItPo_Health_03) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_GivePotion_Info()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
	Info_AddChoice(DIA_Addon_GivePotion,Dialog_Back,DIA_Addon_GivePotion_BACK);
	if(Npc_HasItems(other,ItPo_Health_03) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"(дать лечебный эликсир)",DIA_Addon_GivePotion_ItPo_Health_03);
	};
	if(Npc_HasItems(other,ItPo_Health_02) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"(дать лечебный экстракт)",DIA_Addon_GivePotion_ItPo_Health_02);
	};
	if(Npc_HasItems(other,ItPo_Health_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"(дать лечебную эссенцию)",DIA_Addon_GivePotion_ItPo_Health_01);
	};
};

func void B_Addon_DrinkPotion()
{
	AI_Output(other,self,"DIA_Addon_Brandon_GivePotion_15_00");	//Вот, возьми это лечебное зелье.
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		if(Npc_HasItems(self,ItPo_Health_03) > 0)
		{
			B_UseItem(self,ItPo_Health_03);
		}
		else if(Npc_HasItems(self,ItPo_Health_02) > 0)
		{
			B_UseItem(self,ItPo_Health_02);
		}
		else if(Npc_HasItems(self,ItPo_Health_01) > 0)
		{
			B_UseItem(self,ItPo_Health_01);
		};
	};
	Info_ClearChoices(DIA_Addon_GivePotion);
};

func void DIA_Addon_GivePotion_BACK()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
};

func void DIA_Addon_GivePotion_ItPo_Health_03()
{
	B_GiveInvItems(other,self,ItPo_Health_03,1);
	B_Addon_DrinkPotion();
};

func void DIA_Addon_GivePotion_ItPo_Health_02()
{
	B_GiveInvItems(other,self,ItPo_Health_02,1);
	B_Addon_DrinkPotion();
};

func void DIA_Addon_GivePotion_ItPo_Health_01()
{
	B_GiveInvItems(other,self,ItPo_Health_01,1);
	B_Addon_DrinkPotion();
};

func void B_Addon_GivePotion(var C_Npc slf)
{
	DIA_Addon_GivePotion.npc = Hlp_GetInstanceID(slf);
};

