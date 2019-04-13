
func void B_AddCityGuideChoices()
{
	Info_ClearChoices(dia_cityguide);
	if(!C_IsQuarterNearest(self,Q_UNTERSTADT))
	{
		Info_AddChoice(dia_cityguide,"В нижнюю часть города.",dia_cityguide_unterstadt);
	};
	if(!C_IsQuarterNearest(self,Q_OBERSTADT))
	{
		Info_AddChoice(dia_cityguide,"В верхний квартал.",dia_cityguide_oberstadt);
	};
	if(!C_IsQuarterNearest(self,Q_TEMPEL))
	{
		Info_AddChoice(dia_cityguide,"К храму Аданоса.",dia_cityguide_tempel);
	};
	if(!C_IsQuarterNearest(self,Q_MARKT))
	{
		Info_AddChoice(dia_cityguide,"На рыночную площадь.",dia_cityguide_markt);
	};
	if(!C_IsQuarterNearest(self,Q_GALGEN))
	{
		Info_AddChoice(dia_cityguide,"На площадь правосудия.",dia_cityguide_galgen);
	};
	if(!C_IsQuarterNearest(self,Q_KASERNE))
	{
		Info_AddChoice(dia_cityguide,"К казармам.",dia_cityguide_kaserne);
	};
	if(!C_IsQuarterNearest(self,Q_HAFEN))
	{
		Info_AddChoice(dia_cityguide,"В портовый квартал.",dia_cityguide_hafen);
	};
	Info_AddChoice(dia_cityguide,"Спасибо. Именно это я и хотел узнать!",dia_cityguide_back);
};


instance DIA_CITYGUIDE(C_Info)
{
	nr = 700;
	condition = DIA_CITYGUIDE_Condition;
	information = DIA_CITYGUIDE_Info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};


func int DIA_CITYGUIDE_Condition()
{
	return TRUE;
};

func void DIA_CITYGUIDE_Info()
{
	AI_Output(other,self,"DIA_CITYGUIDE_15_00");	//Что ты можешь рассказать мне об этом квартале?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN");
	};
	B_Say(self,other,"$WHERETO");
	B_AddCityGuideChoices();
};

func void dia_cityguide_back()
{
	AI_Output(other,self,"DIA_CITYGUIDE_BACK_15_00");	//Спасибо. Именно это я и хотел узнать!
	Info_ClearChoices(dia_cityguide);
};

func void dia_cityguide_unterstadt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_UNTERSTADT_15_00");	//Как мне попасть в нижнюю часть города?
	if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_oberstadt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_OBERSTADT_15_00");	//Как мне попасть в верхний квартал?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_OBERSTADT");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_tempel()
{
	AI_Output(other,self,"DIA_CITYGUIDE_TEMPEL_15_00");	//Я ищу храм.
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_MARKT");
		B_Say(self,other,"$MARKT_2_TEMPEL");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_markt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_MARKT_15_00");	//Где находится рыночная площадь?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_MARKT");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_MARKT");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_galgen()
{
	AI_Output(other,self,"DIA_CITYGUIDE_GALGEN_15_00");	//Как мне попасть на площадь Правосудия?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_GALGEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_kaserne()
{
	AI_Output(other,self,"DIA_CITYGUIDE_KASERNE_15_00");	//Где находятся казармы?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say(self,other,"$HAFEN_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_KASERNE");
	};
	B_AddCityGuideChoices();
};

func void dia_cityguide_hafen()
{
	AI_Output(other,self,"DIA_CITYGUIDE_HAFEN_15_00");	//Где находится портовый квартал?
	if(C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say(self,other,"$OBERSTADT_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say(self,other,"$MARKT_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say(self,other,"$KASERNE_2_GALGEN");
		B_Say(self,other,"$GALGEN_2_TEMPEL");
		B_Say(self,other,"$TEMPEL_2_UNTERSTADT");
		B_Say(self,other,"$UNTERSTADT_2_HAFEN");
	};
	B_AddCityGuideChoices();
};

func void B_AssignCityGuide(var C_Npc slf)
{
	dia_cityguide.npc = Hlp_GetInstanceID(slf);
};

