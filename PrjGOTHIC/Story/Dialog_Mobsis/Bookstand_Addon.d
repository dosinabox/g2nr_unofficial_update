
func void Use_Bookstand_Addon_BL_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�����:");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�������: �������� � ������������ 79 ������� ����������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������: �������� ������� �� 250 �������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�����: �������� 6 ������� ����������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��� ���������: �������� 9 ������� ����������");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"������:");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ������: 25 �������");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����: 60 �������");
		Doc_PrintLines(nDocID,1,"������: 40 �������");
		Doc_PrintLines(nDocID,1,"������: 50 �������");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"���������: 20 �������");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����, ����, ����: ������� ������ � ������������ � ��������");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��������: �� ���������� ����������! ������ ������� 7 �������");
		Doc_Show(nDocID);
	};
};


var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"... ��� ��� ������ ������ ������� ����� �������� �������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�� ���������� - ������� ������ ��� ���. ��� ������ ������� ��� �������� ���������� ������ �� ����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��������� ���� �������� ������� ������ � ���������� ����. ������ ������� ������, ��� ��������� � ���� � ������� �� �� ������� ����� ����.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������ ���������� ������ �������. ������ ������-����� �������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ���������� ����� ������� � ��� ������� � ��������� ����������� � ����������� ������ �����-�� �������� ������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�� ��, ������, ����� ������� ������. �������� ��� � ����� ����������� � ���� �������.");
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������� ������� ������ � ����� �������, �� ��� �� ����� ����� ����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��� ������� ����� ������� ������. �������� �� ������ �� ����������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� ������� ������� ����� �����. ���� ��������� � �������� ��������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� �� ���������� ������ ����� � ����������, ������������ �� ��������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"� ��� ��������, ���� ������� ������ � ���� ����������, ������������ ���, ����� ������������ �����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��������� ����������.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������� ����������� �� �������� ��� ����������� ���� �����. � ����� �������� �� ����� ����� ����������� ���.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��� �������� ��� �������� ���� ���� � �������� ��� ���������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��������� ������ ��� ���������� ����� ����. ������ ����� ������ ������ ����� ����� ������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������ �� �������������� � ������ ����, � �� ����� ������� ��� ������ ��� ��� �������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����������� � �������� ����������� � ����� �����, ���������� ����� ����������� ��.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�� ������� ��� ������ ���� � �������, ��� ��� ������ ������� ��� ����� �� ������� �����, ��� �����-�� �� ���.");
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�� ������� ��� ����. ���� ���� ����� ���� ��� ��� � ������� ��� ����� �����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� �������� �� ������ ��������� ���� � ���������, ������� �� ������ ������ ������, ����������� �����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��� ������ �������, ��� ���� ����� ������� ����, ����� �������� ��� ������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������ ���� ����� ������� ��� ����� ������������� ���.");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�� ��� ��� ������� ������ ��� ���� ���� ������� �������, �� ����� ��� ������� ���������� �� ����� ���.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"� �����, ����� �� ����� �� ������ ������ �������, ���������� ������ ������������ ������ ������, �������� ����� ����� ������, ������� ������� ������� ����� ��������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�� ������ ��� �����, ����� �������� ����������� � ����, ����� ������� ������� ������������ ���� � ���� ������.");
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(nDocID,0,"� ���� ����� ����������, ��������� ���� �������� � � ��������� ������� ���������� �������� � ���.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���������� � �������� �������, ��� �������� ����� �������� � ���, ���� ���������� ��� ���������� ����. �� � ������� ������ ���� ���� ����� ����, � �������, ��� ��� ����������.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������� � ����������� ���� ����� ���� �� ������� ���������. � �����, ��� �������� ����� �������� � �������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"���������� ���������� ����� ������� ������. �� ����� � ���� ������� � ������ �� ����� �����.");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��������� ��� ���� ������� ����� �����, ��� ������� �������� � ���� � ����� ������, ����� ����� ������ ����.");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�� ����� ���� �����, ����� ���� ��� ������� ������.");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"���������� ������ �� ��� ��������� ����� ������ ����� � ������� �������� ������� ������ � ���� �������.");
	}
	else if(BookstandMayaArt == 6)
	{
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"...");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... ����������� � ����, ����� ������� ������� ...");
	};
};

func void InitUse_BookstandMaya()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		if(C_SCHasStPlSkill(LANGUAGE_1))
		{
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,FONT_Book);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
		}
		else
		{
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			B_CannotUse_Addon();
			B_Say(self,self,"$CANTREADTHIS");
		};
		Doc_Show(nDocID);
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_1_permanent == FALSE) && C_SCHasStPlSkill(LANGUAGE_1))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_02_S1()
{
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_2_permanent == FALSE) && C_SCHasStPlSkill(LANGUAGE_1))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_03_S1()
{
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_3_permanent == FALSE) && C_SCHasStPlSkill(LANGUAGE_1))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_04_S1()
{
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_4_permanent == FALSE) && C_SCHasStPlSkill(LANGUAGE_1))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_05_S1()
{
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_5_permanent == FALSE) && C_SCHasStPlSkill(LANGUAGE_1))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
	};
};

func void Use_BookstandMayaCommon_01_S1()
{
	BookstandMayaArt = 6;
	InitUse_BookstandMaya();
};

