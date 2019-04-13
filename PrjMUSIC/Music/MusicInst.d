
instance MUSICSYSCONFIG(C_MUSICSYS_CFG)
{
	volume = 1;
	bitresolution = 16;
	globalreverbenabled = 1;
	samplerate = 44100;
	numchannels = 32;
	reverbbuffersize = 262144;
};

instance JINGLEFOUNDITEM(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 2";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

instance JINGLELEVELGAIN(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 1";
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance JINGLEKILLEDFOE(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 2";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

instance JINGLELEARNTALENT(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 1";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};


prototype C_MUSICTHEME_STANDARD(C_MUSICTHEME)
{
	file = "nw_dayfgt.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
	reverbmix = -8;
	reverbtime = 9000;
	vol = 1;
	loop = 1;
};

prototype C_MUSICTHEME_THREAT(C_MUSICTHEME)
{
	file = "nw_daythr.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
	reverbmix = -8;
	reverbtime = 9000;
	vol = 1;
	loop = 1;
};

prototype C_MUSICTHEME_FIGHT(C_MUSICTHEME)
{
	file = "nw_daystd.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
	reverbmix = -12;
	reverbtime = 9000;
	vol = 1;
	loop = 1;
};

instance SYS_MENU(C_MUSICTHEME_DEF)
{
	file = "gamestart.sgt";
	transtype = TRANSITION_TYPE_NONE;
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
	reverbmix = -12;
	reverbtime = 8500;
};

instance SYS_LOADING(C_MUSICTHEME_DEF)
{
	file = "gamestart.sgt";
	transtype = TRANSITION_TYPE_NONE;
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
	reverbmix = -12;
	reverbtime = 8500;
};

instance ADW_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "adw_day_std.sgt";
};

instance ADW_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance AWC_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "awc_day_std.sgt";
};

instance AWC_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance ADT_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "adt_day_std.sgt";
};

instance BDT_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bdt_day_std.sgt";
};

instance BDT_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance BIB_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance BIB_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance CAN_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "can_day_std.sgt";
};

instance CAN_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance CRY_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "awc_day_std.sgt";
};

instance CRY_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance GOL_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance GOL_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance GHO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance GHO_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance MI1_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance MI2_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance PO1_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bib_day_std.sgt";
};

instance PO1_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance PIR_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "pir_day_std.sgt";
};

instance PIR_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance RAV_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "bdt_day_std.sgt";
};

instance RAV_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance SHO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "sho_day_std.sgt";
};

instance SHO_DAY_FGT(C_MUSICTHEME_STANDARD)
{
	file = "sho_day_fgt.sgt";
};

instance SWP_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "swp_day_std.sgt";
};

instance SWP_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "adw_day_fgt.sgt";
};

instance STO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "sto_day_std.sgt";
};

instance DEF_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "nw_daystd_A0.sgt";
};

instance DEF_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "nw_daythr.sgt";
};

instance DEF_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "nw_dayfgt.sgt";
};

instance DEF_NGT_STD(C_MUSICTHEME_STANDARD)
{
	file = "nw_daystd_A0.sgt";
};

instance DEF_NGT_THR(C_MUSICTHEME_THREAT)
{
	file = "nw_daythr.sgt";
};

instance DEF_NGT_FGT(C_MUSICTHEME_FIGHT)
{
	file = "nw_dayfgt.sgt";
};

instance OWD_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "owd_daystd.sgt";
};

instance OWD_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "owd_daystd.sgt";
};

instance OWD_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "owp_dayfgt.sgt";
};

instance OWD_NGT_STD(C_MUSICTHEME_STANDARD)
{
	file = "owd_daystd.sgt";
};

instance OWD_NGT_THR(C_MUSICTHEME_THREAT)
{
	file = "owd_daystd.sgt";
};

instance OWD_NGT_FGT(C_MUSICTHEME_FIGHT)
{
	file = "owp_dayfgt.sgt";
};

instance INS_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "di_daystd.sgt";
};

instance INS_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "di_daystd.sgt";
};

instance INS_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "di_daystd.sgt";
};

instance BAN_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "ban_daystd.sgt";
};

instance BAN_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "ban_dayfgt.sgt";
};

instance FRI_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "fri_daystd.sgt";
};

instance DLC_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "dlc_daystd.sgt";
};

instance DLC_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "dlc_dayfgt.sgt";
};

instance KAS_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "kas_daystd.sgt";
};

instance KHO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "kh_daystd.sgt";
};

instance KHO_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "kh_dayfgt.sgt";
};

instance LEU_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "leu_daystd.sgt";
};

instance LOB_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "lob_daystd.sgt";
};

instance MAY_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "may_daystd.sgt";
};

instance MAY_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "may_dayfgt.sgt";
};

instance MOO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "mo_daystd.sgt";
};

instance MOI_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "mi_daystd.sgt";
};

instance MOD_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "ban_daystd.sgt";
};

instance MOD_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "ban_dayfgt.sgt";
};

instance OWP_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "owp_daystd.sgt";
};

instance OWP_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "owp_dayfgt.sgt";
};

instance PIE_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "pie_daystd.sgt";
};

instance TAL_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "woo_daystd.sgt";
};

instance TAL_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "woo_daythr.sgt";
};

instance TAL_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "woo_dayfgt.sgt";
};

instance WOO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "woo_daystd.sgt";
};

instance WOO_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "woo_daythr.sgt";
};

instance WOO_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "woo_dayfgt.sgt";
};

instance XAR_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "xt_daystd.sgt";
};

instance XAR_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "xt_daystd.sgt";
};

instance NCO_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "owd_daystd.sgt";
};

instance NCO_DAY_THR(C_MUSICTHEME_THREAT)
{
	file = "owd_daystd.sgt";
};

instance NCO_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "owp_dayfgt.sgt";
};

instance NCO_NGT_STD(C_MUSICTHEME_STANDARD)
{
	file = "owd_daystd.sgt";
};

instance NCO_NGT_THR(C_MUSICTHEME_THREAT)
{
	file = "owd_daystd.sgt";
};

instance NCO_NGT_FGT(C_MUSICTHEME_FIGHT)
{
	file = "owp_dayfgt.sgt";
};

instance NCI_DAY_STD(C_MUSICTHEME_STANDARD)
{
	file = "dlc_daystd.sgt";
};

instance NCI_DAY_FGT(C_MUSICTHEME_FIGHT)
{
	file = "dlc_dayfgt.sgt";
};

