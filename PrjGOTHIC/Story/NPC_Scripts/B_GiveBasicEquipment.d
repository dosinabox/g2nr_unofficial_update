
func void B_GiveBasicEquipment(var C_Npc npc)
{
	B_RefreshInvItemToAmount(npc,ItRw_Arrow,100);
	B_RefreshInvItemToAmount(npc,ItRw_Bolt,100);
	B_RefreshInvItemToAmount(npc,ItLsTorch,10);
	B_RefreshInvItemToAmount(npc,ItMi_Gold,500);
	B_RefreshInvItemToAmount(npc,ItPo_Health_03,10);
	B_RefreshInvItemToAmount(npc,ItPo_Mana_03,10);
	B_RefreshInvItemToAmount(npc,ItPo_Speed,5);
	B_RefreshInvItemToAmount(npc,ItKe_Lockpick,30);
};

