
// Оригинальный вариант.
/*func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	var int random;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_IsOnFP(self,"CAMPFIRE") && Wld_IsFPAvailable(self,"CAMPFIRE"))
		{
			AI_GotoFP(self,"CAMPFIRE");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		}
		else if(!Npc_IsOnFP(self,"STAND") && Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP(self,"STAND");
			AI_AlignToFP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		else
		{
			AI_AlignToWP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !C_BodyStateContains(self,BS_SIT))
	{
		random = Hlp_Random(3);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};*/

// Новый вариант.
/*func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	// Режим "на позиции".
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		// Непись не сидит.
		if(!C_BodyStateContains(self,BS_SIT))
		{
			// Время ожидания истекло -> проигрывание анимации, установка нового значения таймера.
			if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				self.aivar[AIV_STATETIME] = Hlp_Random(100)%6 + 6; // от 6 до 11 секунд. Нужно подобрать приемлемые промежутки времени.
				Npc_SetStateTime(self,0);
			};
		};
		
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	};
	
	// Расстояние до точки выполнения распорядка превышает 5м -> путь к своему вейпоинту.
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		return LOOP_CONTINUE;
	};
	
	// Поблизости имеется фрипоинт "CAMPFIRE" -> занятие фрипоинта, проигрывание анимации усаживания на землю.
	if(Wld_IsFPAvailable(self,"CAMPFIRE"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"CAMPFIRE");
		//AI_AlignToFP(self); // Эта функция автоматически вызывается в конце выполнения функции AI_GotoFP. Но если не будут поворачиваться, раскомментируй эту строчку.
		AI_Wait(self,0.5);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		
		// Переход в режим "на позиции".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	
	// Первоначальная установка значения таймера выдержки времени между анимациями.
	self.aivar[AIV_STATETIME] = Hlp_Random(100)%4 + 4; // от 4 до 7 секунд.
	
	// Поблизости имеется фрипоинт "STAND" -> занятие фрипоинта, проигрывание анимации.
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"STAND");
		//AI_AlignToFP(self); // Эта функция автоматически вызывается в конце выполнения функции AI_GotoFP. Но если не будут поворачиваться, раскомментируй эту строчку.
		AI_SetWalkMode(self,NPC_RUN);
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		
		// Переход в режим "на позиции".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	
	// Поблизости нет свободных фрипоинтов "CAMPFIRE" или "STAND" -> выравнивание по вейпоинту, проигрывание анимации.
	AI_AlignToWP(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_Wait(self,0.5);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
	
	// Переход в режим "на позиции".
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	Npc_SetStateTime(self,0);
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_STATETIME] = 0;
};
*/

// Новый вариант 2.
func void ZS_Bandit()
{
	//PrintScreen("ZS_Bandit",5,5,FONT_Screen,3);
	
	Perception_Set_Normal();
	B_ResetAll(self);
	
	// Непись сидит.
	if(C_BodyStateContains(self,BS_SIT))
	{
		// Расстояние до точки выполнения распорядка превышает 5м -> вставание.
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_StandUp(self);
		}
		
		// Расстояние до точки выполнения распорядка не превышает 5м -> переход в режим "на позиции".
		else
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
			return;
		};
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	//PrintScreen("ZS_Bandit_Loop",5,10,FONT_Screen,1);
	
	// Режим "на позиции".
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		// Непись не сидит.
		if(!C_BodyStateContains(self,BS_SIT))
		{
			// Время ожидания истекло -> проигрывание анимации, установка нового значения таймера.
			if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				self.aivar[AIV_STATETIME] = Hlp_Random(100)%8 + 10; // от 10 до 17 секунд.
				Npc_SetStateTime(self,0);
			};
		};
		
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	};
	
	// Расстояние до точки выполнения распорядка превышает 5м -> путь к своему вейпоинту.
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_StandUp(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		return LOOP_CONTINUE;
	};
	
	// Поблизости имеется фрипоинт "CAMPFIRE" -> занятие фрипоинта, проигрывание анимации усаживания на землю.
	if(Wld_IsFPAvailable(self,"CAMPFIRE"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_Wait(self,0.5);
		AI_GotoFP(self,"CAMPFIRE");
		AI_Wait(self,0.5);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		
		// Переход в режим "на позиции".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		return LOOP_CONTINUE;
	};
	
	// Первоначальная установка значения таймера выдержки времени между анимациями.
	self.aivar[AIV_STATETIME] = Hlp_Random(100)%5 + 5; // от 5 до 9 секунд.
	Npc_SetStateTime(self,0);
	
	// Поблизости имеется фрипоинт "STAND" -> занятие фрипоинта, проигрывание анимации.
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_StandUp(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_Wait(self,0.5);
		AI_GotoFP(self,"STAND");
		AI_SetWalkMode(self,NPC_RUN);
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		
		// Переход в режим "на позиции".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		return LOOP_CONTINUE;
	};
	
	// Поблизости нет свободных фрипоинтов "CAMPFIRE" или "STAND" -> выравнивание по вейпоинту, проигрывание анимации.
	AI_StandUp(self);
	
	AI_AlignToWP(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_Wait(self,0.5);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
	
	// Переход в режим "на позиции".
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	//PrintScreen("ZS_Bandit_End",5,15,FONT_Screen,3);
	
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_STATETIME] = 0;
};

