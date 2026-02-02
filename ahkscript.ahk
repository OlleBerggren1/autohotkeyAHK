#Requires AutoHotkey v2.0
; ───── Disable Alt‑alone menu activation ─────
~Alt::Send "{Blind}{vkE8}"      ; vkE8 = “dummy” key Windows ignores
SetCapsLockState "AlwaysOff"    ; Prevent accidental Caps Lock toggles.

; This prevents Space from typing a character if you use it with caps.
#HotIf GetKeyState("CapsLock", "P")
*Space::return 
#HotIf

; ── WASD layer while Caps Lock is held ──────────────
; If Space is held, move 5 times. Otherwise, move normally.


CapsLock & w::{
    if GetKeyState("Space", "P")
        Send "{Blind}{Up 5}"
    else
        Send "{Blind}{Up}"
}

CapsLock & a::{
    if GetKeyState("Space", "P")
        Send "{Blind}{Left 5}"
    else
        Send "{Blind}{Left}"
}

CapsLock & s::{
    if GetKeyState("Space", "P")
        Send "{Blind}{Down 5}"
    else
        Send "{Blind}{Down}"
}

CapsLock & d::{
    if GetKeyState("Space", "P")
        Send "{Blind}{Right 5}"
    else
        Send "{Blind}{Right}"
}

; ── Bracket layer ───────────────────────────────────
CapsLock & u::Send "{{}"    ; {
CapsLock & j::Send "{}}"    ; }
CapsLock & i::Send "{[}"    ; [
CapsLock & k::Send "{]}"    ; ]
CapsLock & o::Send "{(}"    ; (
CapsLock & l::Send "{)}"    ; )

; ── Smart Backspace on Caps+H (word if Alt held) ────
CapsLock & h::{
    if GetKeyState("Space", "P") {
        if GetKeyState("Alt", "P")
            Send "{Blind}^{Backspace 5}" ; Delete 5 words
        else
            Send "{Blind}{Backspace 5}"  ; Delete 5 characters
    } else {
        if GetKeyState("Alt", "P")
            Send "{Blind}^{Backspace}"   ; Delete 1 word
        else
            Send "{Blind}{Backspace}"    ; Delete 1 character
    }
}


; --- CapsLock+Q / CapsLock+E: Home / End
; Detect Shift explicitly so Shift+Q/E selects to start/end of line,
; without accidentally honoring Ctrl/Alt.
CapsLock & q::{
    if GetKeyState("Shift", "P")
        Send "+{Home}"
    else
        Send "{Home}"
}

CapsLock & e::{
    if GetKeyState("Shift", "P")
        Send "+{End}"
    else
        Send "{End}"
}

; --- CapsLock+X / CapsLock+C: move 10 lines up/down
; Keep {Blind} so your held modifiers (e.g. Shift) are respected if you want selection.
CapsLock & x::Send "{Blind}{Up 10}"
CapsLock & c::Send "{Blind}{Down 10}"