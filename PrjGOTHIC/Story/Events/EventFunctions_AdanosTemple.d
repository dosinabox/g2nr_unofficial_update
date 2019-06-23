
var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_01()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime == FALSE)
	{
		var C_NPC StoneGuardianAdanos_01;
		var C_NPC StoneGuardianAdanos_02;
		var C_NPC StoneGuardianAdanos_03;
		var C_NPC StoneGuardianAdanos_04;
		StoneGuardianAdanos_01 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_01);
		StoneGuardianAdanos_02 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_02);
		StoneGuardianAdanos_03 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_03);
		StoneGuardianAdanos_04 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_04);
		b_awake_stoneguardian(StoneGuardianAdanos_01);
		b_awake_stoneguardian(StoneGuardianAdanos_02);
		b_awake_stoneguardian(StoneGuardianAdanos_03);
		b_awake_stoneguardian(StoneGuardianAdanos_04);
		if(!Npc_IsDead(StoneGuardianAdanos_01) || !Npc_IsDead(StoneGuardianAdanos_02) || !Npc_IsDead(StoneGuardianAdanos_03) || !Npc_IsDead(StoneGuardianAdanos_04))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime = TRUE;
	};
};


var int OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime;

func void open_adanostempelchest_01_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime == FALSE)
	{
		var C_NPC StoneGuardianAdanos_05A;
		var C_NPC StoneGuardianAdanos_05C;
		var C_NPC StoneGuardianAdanos_05E;
		StoneGuardianAdanos_05A = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05A);
		StoneGuardianAdanos_05C = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05C);
		StoneGuardianAdanos_05E = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05E);
		b_awake_stoneguardian(StoneGuardianAdanos_05A);
		b_awake_stoneguardian(StoneGuardianAdanos_05C);
		b_awake_stoneguardian(StoneGuardianAdanos_05E);
		if(!Npc_IsDead(StoneGuardianAdanos_05A) || !Npc_IsDead(StoneGuardianAdanos_05C) || !Npc_IsDead(StoneGuardianAdanos_05E))
		{
			Snd_Play("THRILLJINGLE_03");
		};
		OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime = TRUE;
	};
};


var int OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime;

func void open_adanostempelchest_02_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime == FALSE)
	{
		var C_NPC StoneGuardianAdanos_09A;
		var C_NPC StoneGuardianAdanos_09C;
		var C_NPC StoneGuardianAdanos_09E;
		StoneGuardianAdanos_09A = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09A);
		StoneGuardianAdanos_09C = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09C);
		StoneGuardianAdanos_09E = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09E);
		b_awake_stoneguardian(StoneGuardianAdanos_09A);
		b_awake_stoneguardian(StoneGuardianAdanos_09C);
		b_awake_stoneguardian(StoneGuardianAdanos_09E);
		if(!Npc_IsDead(StoneGuardianAdanos_09A) || !Npc_IsDead(StoneGuardianAdanos_09C) || !Npc_IsDead(StoneGuardianAdanos_09E))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime = TRUE;
	};
};


var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_02()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime == FALSE)
	{
		var C_NPC StoneGuardianAdanos_14A;
		var C_NPC StoneGuardianAdanos_14B;
		var C_NPC StoneGuardianAdanos_14C;
		var C_NPC StoneGuardianAdanos_14D;
		var C_NPC StoneGuardianAdanos_14E;
		var C_NPC StoneGuardianAdanos_14F;
		StoneGuardianAdanos_14A = Hlp_GetNpc(Stoneguardian_RHADEMES_14A);
		StoneGuardianAdanos_14B = Hlp_GetNpc(Stoneguardian_RHADEMES_14B);
		StoneGuardianAdanos_14C = Hlp_GetNpc(Stoneguardian_RHADEMES_14C);
		StoneGuardianAdanos_14D = Hlp_GetNpc(Stoneguardian_RHADEMES_14D);
		StoneGuardianAdanos_14E = Hlp_GetNpc(Stoneguardian_RHADEMES_14E);
		StoneGuardianAdanos_14F = Hlp_GetNpc(Stoneguardian_RHADEMES_14F);
		b_awake_stoneguardian(StoneGuardianAdanos_14A);
		b_awake_stoneguardian(StoneGuardianAdanos_14B);
		b_awake_stoneguardian(StoneGuardianAdanos_14C);
		b_awake_stoneguardian(StoneGuardianAdanos_14D);
		b_awake_stoneguardian(StoneGuardianAdanos_14E);
		b_awake_stoneguardian(StoneGuardianAdanos_14F);
		SC_TookRhademesTrap = TRUE;
		if(!Npc_IsDead(StoneGuardianAdanos_14A) || !Npc_IsDead(StoneGuardianAdanos_14B) || !Npc_IsDead(StoneGuardianAdanos_14C) || !Npc_IsDead(StoneGuardianAdanos_14D) || !Npc_IsDead(StoneGuardianAdanos_14E) || !Npc_IsDead(StoneGuardianAdanos_14F))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime = TRUE;
	};
};


var int EVT_RAVEN_AWAKE_FUNC_OneTime;

func void evt_raven_awake_func()
{
};

