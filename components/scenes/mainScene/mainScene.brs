sub Init()
  m.top.SetFocus(true)
  m.container = m.top.FindNode("container")
  m.sideBar = m.top.FindNode("sideBar")
  m.sideBar.ObserveField("back", "OnScreenFocus")
  m.sideBar.ObserveField("screenSelected", "HandleChangeScreen")
  m.global.ObserveField("screenStack", "ToStackScreens")

  m.screen = CreateObject("RoSGNode", m.global.screen)
  m.screen.ObserveField("screenLimit", "OnSideBarFocus")

  m.container.AppendChild(m.screen)
  m.screen.SetFocus(true)
end sub

sub OnSideBarFocus()
  m.sideBar.SetFocus(true)
end sub

sub OnScreenFocus()
  m.screen.SetFocus(true)
end sub

sub HandleChangeScreen(event as object)
  while m.container.GetChildCount() > 0
    m.container.RemoveChild(m.container.GetChild(0))
  end while

  screenName = event.GetData()
  m.screen = CreateObject("RoSGNode", screenName)
  m.screen.ObserveField("screenLimit", "OnSideBarFocus")
  m.container.AppendChild(m.screen)
  m.sideBar.back = true
end sub

sub ToStackScreens(event as object)
  screensStack = event.GetData()
  
  for each screen in screensStack
    screen.ObserveField("back", "UnstackScreen")
    m.top.AppendChild(screen)
    screen.SetFocus(true)
  end for
end sub

sub UnstackScreen(event as object)
  m.global.screenStack.Pop()
  screen = event.getRoSGNode()
  m.top.RemoveChild(screen)

  if m.global.screenStack.Count() > 1 then
    m.global.screenStack.Peek().SetFocus(true)
    return
  end if

  m.screen.SetFocus(true)
end sub