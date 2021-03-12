
const int Value_Shell_01 = 30;
const int Value_Shell_02 = 40;
var int Shell_Opener;

func void B_OpenShell()
{
	var int shellomizer;
	shellomizer = Hlp_Random(100);
	Snd_Play("CS_IHL_WO_WA");
	Shell_Opener += 1;
	if(Shell_Opener == 1)
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl,1);
	}
	else if(Shell_Opener == 25)
	{
		B_PlayerFindItem(ItMi_DarkPearl,1);
	}
	else if(shellomizer >= 80)
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl,1);
	}
	else if(shellomizer >= 55)
	{
		B_PlayerFindItem(ItFo_Addon_Shellflesh,1);
	}
	else if(shellomizer >= 50)
	{
		B_PlayerFindItem(ItMi_Aquamarine,1);
	}
	else if(shellomizer >= 40)
	{
		B_PlayerFindItem(ItMi_Quartz,1);
	}
	else if(shellomizer >= 35)
	{
		B_PlayerFindItem(ItMi_Rockcrystal,1);
	}
	else if(shellomizer >= 25)
	{
		B_PlayerFindItem(ItMi_Sulfur,1);
	}
	else
	{
		player_plunder_is_empty();
	};
};

instance ItMi_Addon_Shell_01(C_Item)
{
	name = "Створчатый моллюск";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shell_01;
	visual = "ItMi_Shell_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = B_OpenShell;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Addon_Shell_02(C_Item)
{
	name = "Спиральный моллюск";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shell_02;
	visual = "ItMi_Shell_02.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = B_OpenShell;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

