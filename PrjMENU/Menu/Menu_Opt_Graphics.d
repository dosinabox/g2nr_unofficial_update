
instance MENU_OPT_GRAPHICS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GRA_SKY_EFFECTS";
	items[1] = "MENUITEM_GRA_SKY_EFFECTS_CHOICE";
	items[2] = "MENUITEM_GRA_ITEMS_EFFECTS";
	items[3] = "MENUITEM_GRA_ITEMS_EFFECTS_CHOICE";
	items[4] = "MENUITEM_EXT_FFT";
	items[5] = "MENUITEM_EXT_FFT_CHOICE";
	items[6] = "MENUITEM_EXT_WATERFADE";
	items[7] = "MENUITEM_EXT_WATERFADE_CHOICE";
	items[8] = "MENUITEM_EXT_OBJWIND";
	items[9] = "MENUITEM_EXT_OBJWIND_CHOICE";
	items[10] = "MENUITEM_EXT_CLOUDSHADOW";
	items[11] = "MENUITEM_EXT_CLOUDSHADOW_CHOICE";
	items[12] = "MENUITEM_EXT_AMBIENTPFX";
	items[13] = "MENUITEM_EXT_AMBIENTPFX_CHOICE";
	items[14] = "MENUITEM_EXT_ENVMAP";
	items[15] = "MENUITEM_EXT_ENVMAP_CHOICE";
	items[16] = "MENUITEM_EXT_RADIALFOG";
	items[17] = "MENUITEM_EXT_RADIALFOG_CHOICE";
	items[18] = "MENUITEM_EXT_VIDS";
	items[19] = "MENUITEM_EXT_VIDS_CHOICE";
	items[20] = "MENUITEM_WEAPONTRAILS";
	items[21] = "MENUITEM_WEAPONTRAILS_CHOICE";
	items[22] = "MENUITEM_SKYDOME";
	items[23] = "MENUITEM_SKYDOME_CHOICE";
	items[24] = "MENUITEM_GRA_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GRA_SKY_EFFECTS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Эффекты погоды";
	text[1] = "Дождь, гроза и снег вкл/откл";
	posx = 1000;
	posy = MENU_START_Y - (MENU_SOUND_DY * 3);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SKY_EFFECTS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 3)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "skyEffects";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_ITEMS_EFFECTS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Эфф. предметов";
	text[1] = "Эффекты вокруг предметов вкл/откл";
	posx = 1000;
	posy = MENU_START_Y - (MENU_SOUND_DY * 2);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_ITEMS_EFFECTS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 2)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "itemEffects";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_FFT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Волны на воде";
	text[1] = "Движение воды на ветру вкл/откл";
	posx = 1000;
	posy = MENU_START_Y - (MENU_SOUND_DY * 1);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_FFT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 1)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWaterAniEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_WATERFADE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Плавный горизонт";
	text[1] = "Туман на горизонте вкл/откл";
	posx = 1000;
	posy = MENU_START_Y - (MENU_SOUND_DY * 0);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_WATERFADE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 0)) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zFarClipAlphaFade";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_OBJWIND(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Ветер";
	text[1] = "Движение объектов на ветру вкл/откл";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_OBJWIND_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zWindEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_CLOUDSHADOW(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Тени от облаков";
	text[1] = "Тени от облаков вкл/откл";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_CLOUDSHADOW_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zCloudShadowScale";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_AMBIENTPFX(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Фоновые эффекты";
	text[1] = "Фоновые эффекты частиц вкл/откл";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_AMBIENTPFX_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zAmbientPFXEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_ENVMAP(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Отражения";
	text[1] = "Отражения на стекле и металле вкл/откл";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_ENVMAP_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zEnvMappingEnabled";
	onchgsetoptionsection = "ENGINE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_RADIALFOG(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Радиальный туман";
	text[1] = "Туман высокого качества вкл/откл";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_RADIALFOG_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zFogRadial";
	onchgsetoptionsection = "RENDERER_D3D";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_EXT_VIDS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Полноэкр. видео";
	text[1] = "Отключите, если видео не воспроизводится";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_EXT_VIDS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "scaleVideos";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_WEAPONTRAILS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Следы от оружия";
	text[1] = NEEDS_RESTART;
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_WEAPONTRAILS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zShowWeaponTrails";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SKYDOME(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Трехмерное небо";
	text[1] = NEEDS_RESTART;
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 8);
	dimx = 4000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_SKYDOME_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "откл|вкл";
	fontname = MENU_FONT_SMALL;
	posx = MENU_BUTTONS;
	posy = MENU_START_Y + (MENU_SOUND_DY * 8) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zSkyDome";
	onchgsetoptionsection = "SKY_OUTDOOR";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Назад";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 9) + 100;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

