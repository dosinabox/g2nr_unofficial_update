
const int PD_TA_FRAME = 1;
const int PD_TA_LOOP = 2;
const int PD_TA_CHECK = 3;
const int PD_TA_DETAIL = 4;
const int PD_ZS_FRAME = 6;
const int PD_ZS_LOOP = 7;
const int PD_ZS_CHECK = 8;
const int PD_ZS_DETAIL = 9;
const int PD_MST_FRAME = 11;
const int PD_MST_LOOP = 12;
const int PD_MST_CHECK = 13;
const int PD_MST_DETAIL = 14;
const int PD_ORC_FRAME = 16;
const int PD_ORC_LOOP = 17;
const int PD_ORC_CHECK = 18;
const int PD_ORC_DETAIL = 19;
const int PD_MISSION = 21;
const int PD_CUTSCENE = 22;
const int PD_SPELL = 23;
const int PD_ITEM_MOBSI = 24;
const int PD_MAGIC = 25;

func void PrintDebugS(var string txt)
{
	PrintDebug(self.name);
	PrintDebug(txt);
};

func void PrintDebugNpc(var int type,var string text)
{
	var string pipe;
	var int instance_id;
	var string inst_id;
	instance_id = self.id;
	inst_id = IntToString(instance_id);
	pipe = ConcatStrings("### ",self.name);
	pipe = ConcatStrings(pipe,"(");
	pipe = ConcatStrings(pipe,inst_id);
	pipe = ConcatStrings(pipe,")");
	pipe = ConcatStrings(pipe," ### -> ");
	pipe = ConcatStrings(pipe,text);
	PrintDebugInstCh(type,pipe);
};

func void PrintGlobals(var int channel)
{
	var string pipe;
	PrintDebugNpc(channel,"PrintGlobals");
	if(Hlp_IsValidNpc(self))
	{
		pipe = ConcatStrings("...self:   ",self.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(other))
	{
		pipe = ConcatStrings("...other:  ",other.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(victim))
	{
		pipe = ConcatStrings("...victim: ",victim.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(hero))
	{
		pipe = ConcatStrings("...hero:   ",hero.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidItem(item))
	{
		pipe = ConcatStrings("...item:   ",item.name);
		PrintDebugNpc(channel,pipe);
	};
};

func void PrintGuild(var int channel,var int guild)
{
	PrintDebugNpc(channel,"PrintGuild");
};

func void PrintAttitudes(var int channel)
{
	var int temp_attitude;
	var int perm_attitude;
	PrintDebugNpc(channel,"PrintAttitudes");
	temp_attitude = Npc_GetAttitude(self,hero);
	perm_attitude = Npc_GetPermAttitude(self,hero);
	if(temp_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_HOSTILE");
	};
	if(temp_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_ANGRY");
	};
	if(temp_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_NEUTRAL");
	};
	if(temp_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_FRIENDLY");
	};
	if(perm_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_HOSTILE");
	};
	if(perm_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_ANGRY");
	};
	if(perm_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_NEUTRAL");
	};
	if(perm_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_FRIENDLY");
	};
};

func void PrintDebugInt(var int channel,var string preText,var int value)
{
	var string printText;
	printText = IntToString(value);
	printText = ConcatStrings(preText,printText);
	PrintDebugNpc(channel,printText);
};

func void PrintDebugString(var int channel,var string preText,var string text)
{
	PrintDebugNpc(channel,ConcatStrings(preText,text));
};

