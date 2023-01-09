func targetClick($check, $position, $addition)
	local $savePos = MouseGetPos()

	if $check == 1 then
		BlockInput(1)
		WinActivate($win)
		click($position[0],  $position[1]+$addition)
		Send("{ALT DOWN}")
		Sleep(125)
		Send("{TAB}")
		Sleep(125)
		Send("{ALT UP}")
		MouseMove($savePos[0], $savePos[1], 1)
		BlockInput(0)
	endif
endfunc

func targetClickForMember()
	BlockInput(1)
	WinActivate($win)
	click(175, 315)
	click(375, 315)
	click(570, 315)
	click(765, 315)
	Send("{ALT DOWN}")
	Sleep(125)
	Send("{TAB}")
	Sleep(125)
	Send("{ALT UP}")
	BlockInput(0)
endfunc

func click($positionX, $positionY)
	BlockInput(1)
	MouseMove($positionX, $positionY, 1)
	Sleep(50)
	MouseClick("left")
	Sleep(125)
	BlockInput(0)
endfunc

func color($position, $color, $addition=0)
	FFSnapShot(0, 0, 0, 0, 1, $win)
	$colorCode = Hex(FFGetPixel($position, 1))
	$trimCode = StringTrimLeft($colorCode, 2)
	$targetCode =  "0x"&$trimCode

	if $targetCode == $color then
		if $addition == 'member' then
			targetClickForMember()
		else
			targetClick(1, $position, $addition)
		endif
	else
		return 0
	endif
endfunc

func onExit()
	MsgBox($MB_SYSTEMMODAL, "Alert", "Exit Macro.", 10)
	exit
endfunc