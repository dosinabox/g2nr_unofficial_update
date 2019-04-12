
func void B_DIA_Addon_Myxir_TeachRequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Ќаучи мен€ этому €зыку.
};

func void B_DIA_Addon_Myxir_TeachL1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Ќу, начнем с чего-нибудь простого. ¬ первую очередь займемс€ €зыком кресть€н.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	// ак правило, тексты, написанные на €зыке кресть€н, св€заны с нашим миром, с такими пон€ти€ми, как работа, любовь, добыча пищи.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Ёто - основной €зык города. “ы сможешь прочесть большинство текстов, которые найдешь здесь, если его освоишь.
};

func void B_DIA_Addon_Myxir_TeachL2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//“ы уже знаком с €зыком кресть€н. язык воинов немного более сложен.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//“ексты, написанные на €зыке воинов, в основном касаютс€ войн и оружи€. “ы узнаешь кое-что полезное.
};

func void B_DIA_Addon_Myxir_TeachL3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//¬ысокий штиль жрецов трудно пон€ть. Ќо € с радостью обучу теб€ ему.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//ѕомимо прочего, св€щенные книги, описывающие историю и магию создателей, написаны на €зыке жрецов.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	// аждый из этих текстов - насто€щее сокровище, если, конечно, ты сможешь его пон€ть.
};

func void B_DIA_Addon_Myxir_TeachNoMore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Ѕольше мне нечего тебе показать. “ы изучил €зык зодчих.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//ѕойди и опробуй свои новые знани€. “ы увидишь, что св€щенные книги зодчих больше не €вл€ютс€ дл€ теб€ тайной.
};

