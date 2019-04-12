
func void B_AssignAmbientInfos(var C_Npc slf)
{
	if(slf.guild == GIL_VLK)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_VLK_1(slf);
			};
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_VLK_6(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_VLK_8(slf);
			};
			if(slf.voice == 16)
			{
				B_AssignAmbientInfos_VLK_16(slf);
			};
			if(slf.voice == 17)
			{
				B_AssignAmbientInfos_VLK_17(slf);
			};
		};
	};
	if(slf.guild == GIL_MIL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_MIL_6(slf);
			};
			if(slf.voice == 7)
			{
				B_AssignAmbientInfos_MIL_7(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_OCVLK_1(slf);
			};
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_OCVLK_6(slf);
			};
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 4)
			{
				B_AssignAmbientInfos_PAL_4(slf);
			};
			if(slf.voice == 9)
			{
				B_AssignAmbientInfos_PAL_9(slf);
			};
			if(slf.voice == 12)
			{
				B_AssignAmbientInfos_PAL_12(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 4)
			{
				B_AssignAmbientInfos_OCPAL_4(slf);
			};
			if(slf.voice == 9)
			{
				B_AssignAmbientInfos_OCPAL_9(slf);
			};
		};
	};
	if(slf.guild == GIL_BAU)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_BAU_1(slf);
			};
			if(slf.voice == 7)
			{
				B_AssignAmbientInfos_BAU_7(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_BAU_13(slf);
			};
			if(slf.voice == 16)
			{
				B_AssignAmbientInfos_BAU_16(slf);
			};
		};
	};
	if(slf.guild == GIL_SLD)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_SLD_6(slf);
			};
			if(slf.voice == 7)
			{
				B_AssignAmbientInfos_SLD_7(slf);
			};
		};
	};
	if(slf.guild == GIL_NOV)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 3)
			{
				B_AssignAmbientInfos_NOV_3(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_NOV_8(slf);
			};
		};
	};
	if(slf.guild == GIL_PIR)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_Addon_PIR_6(slf);
			};
			if(slf.voice == 7)
			{
				B_AssignAmbientInfos_Addon_PIR_7(slf);
			};
		};
	};
	if(slf.guild == GIL_OUT)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_OUT_1(slf);
			};
			if(slf.voice == 7)
			{
				B_AssignAmbientInfos_OUT_7(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_OUT_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 4)
			{
				B_AssignAmbientInfos_OWPAL_4(slf);
			};
		};
	};
	if(slf.guild == GIL_STRF)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_STRF_1(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_STRF_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_BL_AMBIENT)
		{
			B_AssignAmbientInfos_Addon_Sklaven_3(slf);
		};
	};
	if(slf.guild == GIL_BDT)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_BDT_1(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_BDT_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_BL_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_Addon_BL_BDT_1(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_Addon_BL_BDT_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_TAL_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_Addon_TAL_BDT_1(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_Addon_TAL_BDT_13(slf);
			};
		};
	};
	if(slf.guild == GIL_DMT)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 19)
			{
				B_AssignDementorTalk(slf);
			};
		};
	};
};

