#NoEnv
#SingleInstance
#MaxHotkeysPerInterval 120

Process, Priority, , H
SendMode Input

#SingleInstance force


; Show scroll velocity as a tooltip while scrolling. 1 or 0.
tooltips := 0

; The length of a scrolling session.
; Keep scrolling within this time to accumulate boost.
; Default: 500. Recommended between 400 and 1000.
timeout := 500

; If you scroll a long distance in one session, apply additional boost factor.
; The higher the value, the longer it takes to activate, and the slower it accumulates.
; Set to zero to disable completely. Default: 30.
boost := 50

; Spamming applications with hundreds of individual scroll events can slow them down.
; This sets the maximum number of scrolls sent per click, i.e. max velocity. Default: 60.
limit := 60

; Runtime variables. Do not modify.
distance := 0
vmax := 1
boost_enabled := 0

; Key bindings
CapsLock & z::
	boost_enabled := !boost_enabled
	ToolTip, % (boost_enabled) ? "Scroll boost enabled" : "Scroll boost disabled"
	Sleep 1000
	ToolTip
return

WheelUp::
WheelDown::
	if boost_enabled {
		t := A_TimeSincePriorHotkey
		if (A_PriorHotkey = A_ThisHotkey && t < timeout)
		{
			; Remember how many times we've scrolled in the current direction
			distance++

			; Calculate acceleration factor using a 1/x curve
			v := (t < 80 && t > 1) ? (250.0 / t) - 1 : 1

			; Apply boost
			if (boost > 1 && distance > boost)
			{
				; Hold onto the highest speed we've achieved during this boost
				if (v > vmax)
					vmax := v
				else
					v := vmax

				v *= distance / boost
			}

			; Validate
			v := (v > 1) ? ((v > limit) ? limit : Floor(v)) : 1

			if (v > 1 && tooltips)
				QuickToolTip(" נ"v, timeout)



			MouseClick, %A_ThisHotkey%, , , v
		}
		else
		{
			; Combo broken, so reset session variables
			distance := 0
			vmax := 1

			MouseClick %A_ThisHotkey%
		}
		return
	} else {
		MouseClick %A_ThisHotkey%
	}
return

Quit:
	QuickToolTip("Exiting Accelerated Scrolling...", 1000)
	Sleep 1000
	ExitApp

QuickToolTip(text, delay)
{
	ToolTip, %text%
	SetTimer ToolTipOff, %delay%
	return

	ToolTipOff:
	SetTimer ToolTipOff, Off
	ToolTip
	return
}
