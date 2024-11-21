sub Init()
  m.btnMovies = m.top.FindNode("btn-movies")
  m.btnSeries = m.top.FindNode("btn-series")
  m.btnChannels = m.top.FindNode("btn-channels")

  m.top.ObserveField("focusedChild", "OnFocusChange")
  Setup()
end sub

sub OnFocusChange()
  if m.top.hasFocus() then m.top.width = 240
end sub

sub Setup()
  m.top.color = "0x1e0b04"
  m.top.width = 80
  m.top.height = 720
end sub