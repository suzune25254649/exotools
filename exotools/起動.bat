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
echo ◆◆wavのあるディレクトリを、ここにドラッグインしてEnterを押してね♪
echo -----------------------------------------------------------------------
set /p DIR_WAV=">> "
echo.

echo -----------------------------------------------------------------------
echo ◆◆音声オブジェクトの間に、何フレームずつ隙間をあけたいのかな？（通常は"0"）
echo -----------------------------------------------------------------------
set /p SPACE=">> "
echo.
set /a SPACE=SPACE+0

echo -----------------------------------------------------------------------
echo ◆◆wavファイルを並べるね♪
echo -----------------------------------------------------------------------
tools\wav2exo %DIR_WAV% -o %filename%.exo -np

if %ERRORLEVEL% neq 0 (
	pause
	exit /b 1
)
echo.

if 0 neq %SPACE% (
	echo -----------------------------------------------------------------------
	echo ◆◆音声オブジェクトの間に隙間をあけるね♪
	echo -----------------------------------------------------------------------
	tools\spacer %filename%.exo -o %filename%.exo -f %SPACE% -np
	if %ERRORLEVEL% neq 0 (
		pause
		exit /b 2
	)
	echo.
)

echo -----------------------------------------------------------------------
echo ◆◆発言者ごとにレイヤーを分けるね♪
echo -----------------------------------------------------------------------
tools\ClassifyLayer %filename%.exo -o %filename%.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 2
)
echo.

echo -----------------------------------------------------------------------
echo ◆◆"口パク準備@PSDToolKit"を用意するね♪
echo -----------------------------------------------------------------------
tools\lipsyncer %filename%.exo -o %filename%.lipsyncer.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 3
)
echo.

echo -----------------------------------------------------------------------
echo ◆◆"字幕準備@PSDToolKit"を用意するね♪
echo -----------------------------------------------------------------------
tools\JimakuMaker %filename%.exo -o %filename%.JimakuMaker.exo -np
if %ERRORLEVEL% neq 0 (
	pause
	exit /b 4
)
echo.

echo -----------------------------------------------------------------------
echo ◆◆使われていないレイヤーを削除するね♪
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
echo ボクに感謝してよね、お兄ちゃん♪
echo -----------------------------------------------------------------------
echo.

pause
