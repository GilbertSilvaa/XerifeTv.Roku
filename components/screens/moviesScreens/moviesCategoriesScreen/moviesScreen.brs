sub Init()
  m.rowlist = m.top.findNode("rowList")
  m.rowlist.ObserveField("itemSelected", "OpenSynopsis")
  m.top.ObserveField("focusedChild", "OnFocusScreen")
  
  getMoviesTask = CreateObject("roSGNode", "GetMoviesTask")
  getMoviesTask.ObserveField("response", "MoviesResponse")
  getMoviesTask.control = "run"
end sub

sub MoviesResponse(event as object)
  data = event.GetData()
  m.rowlist.content = data
  m.rowlist.SetFocus(true)
end sub

sub OpenSynopsis(event as object)
  indexSelected = m.rowlist.rowItemSelected
  movieContent = m.rowlist.content.GetChild(indexSelected[0]).GetChild(indexSelected[1])

  synopsisScreen = CreateObject("roSGNode", "MovieSynopsisScreen")
  synopsisScreen.id = "synopsisScreen"
  synopsisScreen.content = movieContent

  m.global.screenStack = [synopsisScreen]
end sub

sub OnFocusScreen()
  if m.top.hasFocus() then m.rowlist.SetFocus(true)
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  if not press then return false

  if key = "left" then m.top.screenLimit = true

  return press
end function