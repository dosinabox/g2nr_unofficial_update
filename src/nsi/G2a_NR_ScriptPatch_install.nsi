###################################
##      Подключенные хидеры      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            Основное           ##
###################################

!define MOD_VERSION "23"
!define MOD_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}"
!define MOD_NAME_RU "Неофициальное обновление Г2НВ"
!define MOD_DETAILED_VERSION "1.${MOD_VERSION}.30.8"
!define MOD_AUTHOR "Fizzban, Efectivo, Dimus, D36, Kvincius"
!define INSTALLER_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}_install"
!define UNINSTALLER_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}_uninstall"

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

!define MUI_ICON "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
!define MUI_UNICON "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME_RU} (v${MOD_VERSION}) - установка"
!define MUI_TEXT_WELCOME_INFO_TITLE " "
!define MUI_TEXT_WELCOME_INFO_TEXT "Данное обновление исправляет множество различных ошибок и недоработок в игре «Готика 2: Ночь Ворона». Установка рекомендуется на русскую версию игры от Акеллы с установленным Player Kit. Старые сохренения любой другой версии не поддерживаются: начало новой игры обязательно!"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "Программа установит неофициальное обновление в указанную папку. \
$\n$\nЧтобы установить неофициальное обновление в другую папку, нажмите кнопку 'Обзор ...' и укажите ее."

!define MUI_TEXT_COMPONENTS_TITLE "Выбор компонентов для установки"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты обновления, которые вы хотите установить.$\nНажмите кнопку 'Установить' для продолжения."
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

!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты неофициального обновления, которые вы хотите удалить.$\nНажмите кнопку 'Удалить' для продолжения."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для удаления:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##            Макросы            ##
###################################

!macro GMF_Delete FILENAME
	IfFileExists "${FILENAME}" "" +2
	Delete "${FILENAME}"
!macroend

###################################
##          Инсталляция          ##
###################################

Section "Основные файлы" SecMain
	SectionIn RO
	CreateDirectory "$INSTDIR\saves_G2a_NR_ScriptPatch_v${MOD_VERSION}\current"

	IfFileExists "$INSTDIR\data\MENU_AutoScale_G2.vdf" menu_found menu_not_found
	menu_found:
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
	goto check_end
	menu_not_found:
	check_end:

	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}.mod"

	SetOutPath "$INSTDIR\system"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.ini"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.rtf"

	SetOutPath "$INSTDIR"
	File "Changelog_G2a_NR_ScriptPatch_v${MOD_VERSION}.txt"
	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"

	WriteRegStr HKCU "Software\${MOD_NAME}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayName" "${MOD_NAME_RU} (v${MOD_VERSION})" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayVersion" "${MOD_DETAILED_VERSION}" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "InstallLocation" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "HelpLink" "http://worldofplayers.ru/threads/36817"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayIcon" "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "EstimatedSize" "230000"
SectionEnd

Section /o "Увеличенное меню" SecAdditional_1
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
SectionEnd

Section /o "Исправление русской озвучки" SecAdditional_2
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_speech.mod"
	SetOutPath "$INSTDIR"
	File "Speech_Changelog.txt"
SectionEnd

Section /o "Расширенная Рудниковая долина" SecAdditional_3
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_wasteland.mod"
SectionEnd

###################################
##         Деинсталляция         ##
###################################

Section "Un.Удалить обновление" SecUninstall_Main
	SectionIn RO
	Call Un.GMF_Delete_Components
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"
SectionEnd

Section /o "Un.Удалить сохранения" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_G2a_NR_ScriptPatch_v${MOD_VERSION}"
SectionEnd

###################################
##     Описание компонентов      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "Основные компоненты обновления."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "Увеличенные окна дневника, характеристик и главного меню для больших разрешений."
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "Неофициальное исправление русской озвучки от Акеллы (версия 1.14)."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "Мод Wasteland, расширяющий и заполняющий карту Рудниковой долины до размеров Готики 1."

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
	StrCpy $INSTDIR "$PROGRAMFILES\Akella\Gothic II"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\GothicStarter.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd

Function Un.GMF_Delete_Components
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ini"
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.rtf"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_speech.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_wasteland.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_hotfix.mod"
	!insertmacro GMF_Delete "$INSTDIR\Changelog_G2a_NR_ScriptPatch_v${MOD_VERSION}.txt"
	!insertmacro GMF_Delete "$INSTDIR\Speech_Changelog.txt"
FunctionEnd
