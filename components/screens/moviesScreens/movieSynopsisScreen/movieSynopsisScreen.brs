sub Init()
  m.top.SetFocus(true)
  m.background = m.top.FindNode("background")
  m.title = m.top.FindNode("title")

  Setup()
end sub

sub SetContent(event as object)
  data = event.GetData()
  m.background.uri = data.bannerUrl
  m.title.text = data.title
end sub

sub Setup()
  m.top.color = "0x010314"
  m.top.width = 1280
  m.top.height = 720
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  if not press then return false

  if key = "back" then m.top.back = true

  return press
end function