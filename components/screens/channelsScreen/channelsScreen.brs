sub Init()
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  if not press then return false

  if key = "left" then m.top.screenLimit = true

  return press
end function