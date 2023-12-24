
instance ItWr_Addon_Runemaking_KDW_CIRC1(C_Item)
{
	name = "Книга рун магов Воды";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDW.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC1_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

/*instance ItWr_Addon_Runemaking_KDW_CIRC2(C_Item)
{
	name = "Книга рун Воды II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (2-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC2_S1;
};

instance ItWr_Addon_Runemaking_KDW_CIRC3(C_Item)
{
	name = "Книга рун Воды III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (3-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC3_S1;
};

instance ItWr_Addon_Runemaking_KDW_CIRC4(C_Item)
{
	name = "Книга рун Воды IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (4-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC4_S1;
};

instance ItWr_Addon_Runemaking_KDW_CIRC5(C_Item)
{
	name = "Книга рун Воды V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (5-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC5_S1;
};

instance ItWr_Addon_Runemaking_KDW_CIRC6(C_Item)
{
	name = "Книга рун Воды VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (6-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC6_S1;
};*/

instance ItWr_Addon_Runemaking_KDF_CIRC1(C_Item)
{
	name = "Книга рун Огня I";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (1-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_01_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_Runemaking_KDF_CIRC2(C_Item)
{
	name = "Книга рун Огня II";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (2-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_02_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_Runemaking_KDF_CIRC3(C_Item)
{
	name = "Книга рун Огня III";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (3-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_03_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_Runemaking_KDF_CIRC4(C_Item)
{
	name = "Книга рун Огня IV";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (4-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_04_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_Runemaking_KDF_CIRC5(C_Item)
{
	name = "Книга рун Огня V";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (5-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_05_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_Runemaking_KDF_CIRC6(C_Item)
{
	name = "Книга рун Огня VI";
	mainflag = ITEM_KAT_DOCS;
//	flags = ITEM_MISSION;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Runemaking_KDF.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (6-й круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_06_S1;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

