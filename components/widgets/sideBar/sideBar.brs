sub Init()
  m.btnMovies = m.top.FindNode("btn-movies")
  m.btnMoviesLabel = m.top.FindNode("movies-label")
  m.btnSeries = m.top.FindNode("btn-series")
  m.btnSeriesLabel = m.top.FindNode("series-label")
  m.btnChannels = m.top.FindNode("btn-channels")
  m.btnChannelsLabel = m.top.FindNode("channels-label")

  m.top.ObserveField("focusedChild", "OpenSideBar")
  m.btnMovies.ObserveField("focusedChild", "OnBtnFocusChange")
  m.btnSeries.ObserveField("focusedChild", "OnBtnFocusChange")
  m.btnChannels.ObserveField("focusedChild", "OnBtnFocusChange")
  Setup()
end sub

sub OpenSideBar()
  if not m.top.HasFocus() then return
  FocusScreenSelected()
  m.top.width = 240
  m.btnMoviesLabel.visible = true
  m.btnSeriesLabel.visible = true
  m.btnChannelsLabel.visible = true
end sub

sub CloseSideBar()
  FocusScreenSelected()
  m.top.width = 100
  m.btnMoviesLabel.visible = false
  m.btnSeriesLabel.visible = false
  m.btnChannelsLabel.visible = false
end sub

sub OnBtnFocusChange(event as object)
  m.btnMovies.visible = false
  m.btnSeries.visible = false
  m.btnChannels.visible = false

  btn = event.GetRoSGNode()
  btn.visible = true
end sub 

sub FocusScreenSelected()
  if m.top.screenSelected = "MoviesScreen" then m.btnMovies.SetFocus(true)
  if m.top.screenSelected = "SeriesScreen" then m.btnSeries.SetFocus(true)
  if m.top.screenSelected = "ChannelsScreen" then m.btnChannels.SetFocus(true)
end sub

sub Setup()
  m.top.color = "0x1e0b04"
  m.top.width = 100
  m.top.height = 720
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  if not press then return false

  if key = "down" then 
    if m.btnSeries.HasFocus() then m.btnChannels.SetFocus(true)
    if m.btnMovies.HasFocus() then m.btnSeries.SetFocus(true)
  end if

  if key = "up" then 
    if m.btnSeries.HasFocus() then m.btnMovies.SetFocus(true)
    if m.btnChannels.HasFocus() then m.btnSeries.SetFocus(true)
  end if

  if key = "OK" then
    if m.btnMovies.HasFocus() then m.top.screenSelected = "MoviesScreen"
    if m.btnSeries.HasFocus() then m.top.screenSelected = "SeriesScreen"
    if m.btnChannels.HasFocus() then m.top.screenSelected = "ChannelsScreen"
  end if 

  if key = "right" then m.top.back = true

  return press
end function