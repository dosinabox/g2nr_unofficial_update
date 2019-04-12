
const int BookLp2 = 2;
const int BookLp3 = 3;
const int BookLp5 = 5;
const int BookLp8 = 8;
const int BookXP250 = 250;
const int BookXP500 = 500;
const int BookXP1000 = 1000;
const int LPMultiplier = 1000;
const int XPMultiplier = 5;

func void UseLPBook(var int constanze)
{
	var int Wert;
	var string concatText;
	Wert = constanze;
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$VERSTEHE");
		Snd_Play("Levelup");
		self.lp = self.lp + constanze;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(constanze));
		Print(concatText);
	};
};

func void UseXPBook(var int constanze)
{
	var int Wert;
	var string concatText;
	Wert = constanze;
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$VERSTEHE");
		Snd_Play("Levelup");
		self.exp = self.exp + constanze;
		concatText = ConcatStrings(PRINT_XPGained,IntToString(constanze));
		Print(concatText);
	};
};


prototype ItWr_Addon_XPBook(C_Item)
{
	name = "ќпыт поколений";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = PRINT_XPGained;
	text[5] = NAME_Value;
};

instance ItWr_Addon_BookXP250(ItWr_Addon_XPBook)
{
	value = BookXP250 * XPMultiplier;
	count[0] = BookXP250;
	on_state[0] = UseBookXP250;
	count[5] = value;
};


func void UseBookXP250()
{
	UseXPBook(BookXP250);
};


instance ItWr_Addon_BookXP500(ItWr_Addon_XPBook)
{
	value = BookXP500 * XPMultiplier;
	count[0] = BookXP500;
	on_state[0] = UseBookXP500;
	count[5] = value;
};


func void UseBookXP500()
{
	UseXPBook(BookXP500);
};


instance ItWr_Addon_BookXP1000(ItWr_Addon_XPBook)
{
	value = BookXP1000 * XPMultiplier;
	count[0] = BookXP1000;
	on_state[0] = UseBookXP1000;
	count[5] = value;
};


func void UseBookXP1000()
{
	UseXPBook(BookXP1000);
};


prototype ItWr_Addon_LPBook(C_Item)
{
	name = " нига знаний";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = PRINT_LearnLP;
	text[5] = NAME_Value;
};

instance ItWr_Addon_BookLP2(ItWr_Addon_LPBook)
{
	value = BookLp2 * LPMultiplier;
	count[0] = BookLp2;
	on_state[0] = UseBookLp2;
	count[5] = value;
};


func void UseBookLp2()
{
	UseLPBook(BookLp2);
};


instance ItWr_Addon_BookLP3(ItWr_Addon_LPBook)
{
	value = BookLp3 * LPMultiplier;
	count[0] = BookLp3;
	on_state[0] = UseBookLp3;
	count[5] = value;
};


func void UseBookLp3()
{
	UseLPBook(BookLp3);
};


instance ItWr_Addon_BookLP5(ItWr_Addon_LPBook)
{
	value = BookLp5 * LPMultiplier;
	count[0] = BookLp5;
	on_state[0] = UseBookLp5;
	count[5] = value;
};


func void UseBookLp5()
{
	UseLPBook(BookLp5);
};


instance ItWr_Addon_BookLP8(ItWr_Addon_LPBook)
{
	value = BookLp8 * LPMultiplier;
	count[0] = BookLp8;
	on_state[0] = UseBookLp8;
	count[5] = value;
};


func void UseBookLp8()
{
	UseLPBook(BookLp8);
};

