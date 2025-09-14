#Requires AutoHotkey v2.0
; ───── Disable Alt‑alone menu activation ─────
~Alt::Send "{Blind}{vkE8}"      ; vkE8 = “dummy” key Windows ignores
SetCapsLockState "AlwaysOff"    ; Prevent accidental Caps Lock toggles.

; ── WASD layer while Caps Lock is held ──────────────
CapsLock & w::Send "{Blind}{Up}"
CapsLock & a::Send "{Blind}{Left}"
CapsLock & s::Send "{Blind}{Down}"
CapsLock & d::Send "{Blind}{Right}"

; ── Bracket layer ───────────────────────────────────
CapsLock & u::Send "{{}"   ; {
CapsLock & j::Send "{}}"   ; }
CapsLock & i::Send "{[}"   ; [
CapsLock & k::Send "{]}"   ; ]
CapsLock & o::Send "{(}"   ; (
CapsLock & l::Send "{)}"   ; )

; ── Smart Backspace on Caps+H (word if Alt held) ────
CapsLock & h::{
    if GetKeyState("Alt", "P")
        Send "{Blind}^{Backspace}"   ; Ctrl+Backspace
    else
        Send "{Blind}{Backspace}"    ; Backspace
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
