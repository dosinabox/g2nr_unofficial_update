
var int EVT_DIBridge_Opened;

func void EVT_DIBridge_Open_Func()
{
	EVT_DIBridge_Opened = TRUE;
};

func void EVT_BigBridge_Switch_01_Func_s1()
{
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$PICKBROKE");
	};
};

func void EVT_BigBridge_Switch_02_Func_s1()
{
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$PICKBROKE");
	};
};

