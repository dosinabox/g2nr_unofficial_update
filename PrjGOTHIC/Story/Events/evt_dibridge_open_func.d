
var int EVT_DIBRIDGE_OPENED;

func void evt_dibridge_open_func()
{
	EVT_DIBRIDGE_OPENED = TRUE;
};

func void evt_bigbridge_switch_01_func_s1()
{
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$PICKBROKE");
	};
};

func void evt_bigbridge_switch_02_func_s1()
{
	if(Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$PICKBROKE");
	};
};

