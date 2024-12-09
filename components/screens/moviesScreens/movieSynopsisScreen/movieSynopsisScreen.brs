sub Init()
  m.top.SetFocus(true)
  m.background = m.top.FindNode("background")
  m.title = m.top.FindNode("title")
  m.synopsis = m.top.FindNode("synopsis")

  Setup()
end sub

sub SetContent(event as object)
  data = event.GetData()
  m.background.uri = data.bannerUrl
  m.title.text = data.title
  m.synopsis.text = data.synopsis
end sub

sub Setup()
  m.top.color = "0x010314"
  m.top.width = 1280
  m.top.height = 720

  m.title.font = "font:LargeBoldSystemFont"
  m.title.font.size = 48

  m.synopsis.font = "font:SmallSystemFont"
  m.synopsis.size = 20
  m.synopsis.width = 720
  m.synopsis.numLines = 4
  m.synopsis.wrap = true
  m.synopsis.ellipsizeOnBoundary	= true
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  if not press then return false

  if key = "back" then m.top.back = true

  return press
end function