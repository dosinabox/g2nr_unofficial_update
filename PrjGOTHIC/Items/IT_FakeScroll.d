
instance Fakescroll(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
/*	hp = 5;
	hp_max = 5;
	weight = 1;	*/
	value = 0;
//	visual = "Fakescroll.3ds";
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
//	text[5] = NAME_Value;
//	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance Fakeheroface(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance Fakemap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance Openbook1(C_Item)
{
	name = "Открытая книга 1";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01_Open.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItMi_FakeBloodwynHead(C_Item)
{
	name = "Голова Бладвина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
};

