sub Init()
  m.top.SetFocus(true)

  m.container = m.top.FindNode("container")
  m.global.ObserveField("screen", "HandleChangeScreen")

  screen = CreateObject("RoSGNode", m.global.screen)
  m.container.AppendChild(screen)
end sub

sub HandleChangeScreen(event as object)
  while m.container.GetChildCount() > 0
    m.container.RemoveChild(m.container.GetChild(0))
  end while

  screenName = event.GetData()
  screen = CreateObject("RoSGNode", screenName)
  m.container.AppendChild(screen)
end sub