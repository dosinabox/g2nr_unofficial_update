###################################
##      Подключенные хидеры      ##
###################################

!include "MUI.nsh"

###################################
##            Основное           ##
###################################

!define MOD_VERSION "30"
!define MOD_DATE "9.2"
!define MOD_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}"
!define MOD_NAME_RU "Неофициальное обновление Г2НВ"
!define MOD_DETAILED_VERSION "1.${MOD_VERSION}.${MOD_DATE}"
!define MOD_AUTHOR "Fizzban, Efectivo, Dimus, D36, Kvincius, N1kX, Kor Angar"
!define INSTALLER_NAME "${MOD_NAME}_install"
!define UNINSTALLER_NAME "${MOD_NAME}_uninstall"
!define REGISTRY_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"

Name "${MOD_NAME}"
OutFile "${INSTALLER_NAME}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${INSTALLER_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME_RU}"
VIAddVersionKey "ProductVersion" "1.${MOD_VERSION}"

Unicode true
SetCompressor lzma

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "${MOD_NAME}.ico"
!define MUI_UNICON "${MOD_NAME}.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME_RU} (v${MOD_VERSION}) - установка"
!define MUI_TEXT_WELCOME_INFO_TITLE " "
!define MUI_TEXT_WELCOME_INFO_TEXT "Данное обновление исправляет множество различных ошибок и недоработок в игре «Готика 2: Ночь Ворона». Установка рекомендуется на русскую версию игры от Акеллы с установленным Player Kit. Старые сохранения любой другой версии не поддерживаются: начало новой игры обязательно!"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "Программа установит неофициальное обновление в указанную папку. \
$\n$\nЧтобы установить неофициальное обновление в другую папку, нажмите кнопку 'Обзор ...' и укажите ее. Если кнопка 'Далее' остается неактивной, то сначала установите Player Kit - официальный набор для запуска модов."

!define MUI_TEXT_COMPONENTS_TITLE "Выбор компонентов для установки"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты обновления, которые вы хотите установить. Нажмите кнопку 'Установить' для продолжения."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для установки:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_INSTALLING_TITLE "Копирование файлов..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tУстановка завершена!"
!define MUI_TEXT_FINISH_INFO_TEXT "Приятной игры! Нажмите кнопку 'Готово' для завершения."

UninstallCaption "${MOD_NAME_RU} (v${MOD_VERSION}) - удаление"

!define MUI_UNTEXT_COMPONENTS_TITLE "Выбор компонентов для удаления"
!define MUI_UNTEXT_COMPONENTS_SUBTITLE " "

!define MUI_UNTEXT_FINISH_INFO_TITLE " "
!define MUI_UNTEXT_FINISH_INFO_TEXT "Все выбранные компоненты неофициального обновления удалены из папки с игрой. Нажмите кнопку 'Готово' для завершения."

BrandingText " "

###################################
##     Страницы  инсталлятора    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##    Страницы  деинсталлятора   ##
###################################

!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты неофициального обновления, которые вы хотите удалить. Нажмите кнопку 'Удалить' для продолжения."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для удаления:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##          Инсталляция          ##
###################################

Section "Основные файлы" SecMain
	SectionIn RO
	CreateDirectory "$INSTDIR\saves_${MOD_NAME}\current"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "scriptpatch_v${MOD_VERSION}.mod"
	File "scriptpatch_v${MOD_VERSION}_ru.mod"

	SetOutPath "$INSTDIR\system"
	File "${MOD_NAME}.ico"
	File "${MOD_NAME}.ini"
	File "${MOD_NAME}.rtf"

	SetOutPath "$INSTDIR\_work\Data\Music\newworld"
	File "KAS_Loop_DayStd.sgt"

	SetOutPath $INSTDIR
	File "Changelog_${MOD_NAME}.txt"
	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"

	WriteRegStr HKCU "Software\${MOD_NAME}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayName" "${MOD_NAME_RU} (v${MOD_VERSION})" 
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayVersion" "${MOD_DETAILED_VERSION}" 
	WriteRegStr HKLM "${REGISTRY_PATH}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "${REGISTRY_PATH}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "${REGISTRY_PATH}" "HelpLink" "https://worldofplayers.ru/threads/36817"
	WriteRegStr HKLM "${REGISTRY_PATH}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayIcon" "$INSTDIR\system\${MOD_NAME}.ico"
	WriteRegDWORD HKLM "${REGISTRY_PATH}" "EstimatedSize" "227000"
SectionEnd

Section "Дополнительная русская озвучка" SecAdditional_1
	SetOutPath "$INSTDIR\Data\ModVDF"
	File "scriptpatch_v${MOD_VERSION}_speech_add_ru.mod"
SectionEnd

Section "Исправление русской озвучки" SecAdditional_2
	SetOutPath "$INSTDIR\Data\ModVDF"
	File "scriptpatch_v${MOD_VERSION}_speech_fix_ru.mod"
	SetOutPath $INSTDIR
	File "Changelog_Speech_v${MOD_VERSION}.txt"
SectionEnd

Section "Широкоформатный монитор" SecAdditional_3
	SetOutPath "$INSTDIR\Data\ModVDF"
	File "scriptpatch_v${MOD_VERSION}_widescreen.mod"
SectionEnd

###################################
##         Деинсталляция         ##
###################################

Section "Un.Удалить обновление" SecUninstall_Main
	SectionIn RO
	Delete "$INSTDIR\system\${MOD_NAME}.ico"
	Delete "$INSTDIR\system\${MOD_NAME}.ini"
	Delete "$INSTDIR\system\${MOD_NAME}.rtf"
	Delete "$INSTDIR\_work\Data\Music\newworld\KAS_Loop_DayStd.sgt"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}.mod"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}_ru.mod"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}_speech_add_ru.mod"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}_speech_fix_ru.mod"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}_widescreen.mod"
	Delete "$INSTDIR\Data\ModVDF\scriptpatch_v${MOD_VERSION}_hotfix.mod"
	Delete "$INSTDIR\Changelog_${MOD_NAME}.txt"
	Delete "$INSTDIR\Changelog_Speech_v${MOD_VERSION}.txt"
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "${REGISTRY_PATH}"
SectionEnd

Section /o "Un.Удалить сохранения" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_${MOD_NAME}"
SectionEnd

###################################
##     Описание компонентов      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "Основные компоненты обновления."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "Снимите галочку, если установка производится на версию игры без русской озвучки."
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "Неофициальное исправление русской озвучки от Акеллы (версия 1.14)."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "Установка фона главного меню и загрузочных экранов для широкоформатных мониторов."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_1} $(DESC_SecAdditional_1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_2} $(DESC_SecAdditional_2)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_3} $(DESC_SecAdditional_3)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

###################################
##            Функции            ##
###################################

Function .onInit
	SetSilent normal
	!insertmacro MUI_LANGDLL_DISPLAY
	ReadRegStr $INSTDIR HKCU "Software\${MOD_NAME}" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	StrCpy $INSTDIR "$PROGRAMFILES\Akella Games\Gothic II"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\GothicStarter.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd
