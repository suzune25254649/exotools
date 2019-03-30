echo off
setlocal enabledelayedexpansion

set d=%date%
set yyyy=%d:~-10,4%
set mm=%d:~-5,2%
set dd=%d:~-2,2%
set t=%time: =0%
set hh=%t:~0,2%
set mn=%t:~3,2%
set ss=%t:~6,2%
set filename=exo_%yyyy%-%mm%-%dd%_%hh%-%mn%-%ss%

echo -----------------------------------------------------------------------
echo ����wav�̂���f�B���N�g�����A�����Ƀh���b�O�C������Enter�������Ăˁ�
echo -----------------------------------------------------------------------
set /p DIR_WAV=">> "
echo.

echo -----------------------------------------------------------------------
echo ���������I�u�W�F�N�g�̊ԂɁA���t���[�������Ԃ����������̂��ȁH�i�ʏ��"0"�j
echo -----------------------------------------------------------------------
set /p SPACE=">> "
echo.
set /a SPACE=SPACE+0

echo -----------------------------------------------------------------------
echo ����wav�t�@�C������ׂ�ˁ�
echo -----------------------------------------------------------------------
tools\wav2exo %DIR_WAV% -o %filename%.exo -np

if %ERRORLEVEL% neq 0 (
	pause
	exit /b 1
)
echo.

if 0 neq %SPACE% (
	echo -----------------------------------------------------------------------
	echo ���������I�u�W�F�N�g�̊ԂɌ��Ԃ�������ˁ�
	echo -----------------------------------------------------------------------
	tools\spacer %filename%.exo -o %filename%.exo -f %SPACE% -np
	if %ERRORLEVEL% neq 0 (
		pause
		exit /b 2
	)
	echo.
)

echo -----------------------------------------------------------------------
echo ���������҂��ƂɃ��C���[�𕪂���ˁ�
echo -----------------------------------------------------------------------
tools\ClassifyLayer %filename%.exo -o %filename%.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 2
)
echo.

echo -----------------------------------------------------------------------
echo ����"���p�N����@PSDToolKit"��p�ӂ���ˁ�
echo -----------------------------------------------------------------------
tools\lipsyncer %filename%.exo -o %filename%.lipsyncer.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 3
)
echo.

echo -----------------------------------------------------------------------
echo ����"��������@PSDToolKit"��p�ӂ���ˁ�
echo -----------------------------------------------------------------------
tools\JimakuMaker %filename%.exo -o %filename%.JimakuMaker.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 4
)
echo.

echo -----------------------------------------------------------------------
echo �����g���Ă��Ȃ����C���[���폜����ˁ�
echo -----------------------------------------------------------------------
tools\PackLayer %filename%.exo -o %filename%.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 5
)
tools\PackLayer %filename%.lipsyncer.exo -o %filename%.lipsyncer.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 5
)
tools\PackLayer %filename%.JimakuMaker.exo -o %filename%.JimakuMaker.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 5
)
echo.

echo -----------------------------------------------------------------------
echo �{�N�Ɋ��ӂ��Ă�ˁA���Z������
echo -----------------------------------------------------------------------
echo.

pause
