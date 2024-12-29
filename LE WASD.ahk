#Requires AutoHotkey v2
InstallKeybdHook 1, 1
InstallMouseHook
;#UseHook 1
#InputLevel 1

CoordMode "Mouse", "Screen"
SendMode "InputThenPlay"
SetKeyDelay 0

global toRun := 0, prevWin := 0, bX := 0, bY := 0, bW := 0, bH := 0, cX := 0, cY := 0, mX := 0, mY := 0, toSpace := 0, walkWait := 0

;Mousemove 1920, 1080, 0

f9::exitapp

;var := monX
;MsgBox "The x: " var

;var := monY
;MsgBox "The y: " var

MsgBox "Script active! To stop the script press f9."

Space::
{
	if !GetKeyState("W") && !GetKeyState("S") && !GetKeyState("A") && !GetKeyState("D")
	{
		InputLevel := 0
		Send(" ")
		;walkWait := 1
		InputLevel := 1
	}
	else
	{
		move(2)
	}
}

Q::{
}
E::{
}
R::{
}
F::{
}

Loop
{
	move
}

move(toSpace := 0)
{
	if WinWaitActive("Last Epoch")
	{
		monX := A_ScreenWidth
		monY := A_ScreenHeight
		monMult := A_ScreenHeight / 2160
	
		Hotkey "Q", "Off"
		Hotkey "E", "Off"
		Hotkey "R", "Off"
		Hotkey "F", "Off"
		
		if (GetKeyState("Space", "P"))
		{
			toSpace := 2
		}
		
		if toRun == 0
		{
			mX := 0
			mY := 0
			
			if GetKeyState("W")
			{
				;1920
				;1080
				;830
				mX := monX/2
				mY := monY/2-(310*monMult) ;(250*monMult)
			}
			else if GetKeyState("S")
			{
				;1250
				mX := monX/2
				mY := monY/2+(215*monMult) ;+(172*monMult)
			}
			if GetKeyState("A")
			{
				;1790-170
				;964
				mX := monX/2-(325*monMult) ;-(300*monMult)
				mY := monY/2-(116*monMult)
				
				if GetKeyState("W")
				{
					mY -= 180*monMult
				}
				else if GetKeyState("S")
				{
					mY += 180*monMult
				}
			}
			else if GetKeyState("D")
			{
				;2050+170
				;964
				mX := monX/2+(325*monMult) ;+(300*monMult)
				mY := monY/2-(116*monMult)
				
				if GetKeyState("W")
				{
					mY -= 180*monMult
				}
				else if GetKeyState("S")
				{
					mY += 180*monMult
				}
			}
			
			if (mX != 0) && !GetKeyState("Q") && !GetKeyState("E") && !GetKeyState("R") && !GetKeyState("F") && !GetKeyState("RButton")
			{
				Send("{Q Up}")
				Hotkey "Q", "On"
				Send("{E Up}")
				Hotkey "E", "On"
				Send("{R Up}")
				Hotkey "R", "On"
				Send("{F Up}")
				Hotkey "F", "On"
				if (GetKeyState("Space", "P"))
				{
					toSpace := 2
				}
				
				BlockInput "MouseMove"
				MouseGetPos(&x, &y)
				Mousemove mX, mY, 1
				Mousemove mX, mY, 0
				Mousemove mX, mY, 2
				Mousemove mX, mY, 0
				Sleep 1
				Click
				
				if (toSpace == 2)
				{
					Sleep 1
					toSpace := 1
					InputLevel := 0
					Send(" ")
					InputLevel := 1
					Sleep 1
					Sleep 1
					Sleep 1
					Sleep 1
				}
				Sleep 1
				Sleep 1
				Mousemove x, y, 1
				Mousemove x, y, 2
				Mousemove x, y, 1
				Mousemove x, y, 2
				BlockInput "MouseMoveOff"
				Hotkey "Q", "Off"
				Hotkey "E", "Off"
				Hotkey "R", "Off"
				Hotkey "F", "Off"
			}
			
			;if (toSpace > 0)
			;{
			;	InputLevel := 0
			;	Send(" ")
			;	InputLevel := 1
			;	toSpace := 0
			;}
			
			toSpace := 0
			
			if (mX != 0)
			{
				Sleep 26
			}
		}
	}
}