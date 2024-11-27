sub Init()
  m.itemposter = m.top.findNode("itemPoster")
  m.itemlabel = m.top.findNode("itemLabel")
  m.borderFocus = m.top.findNode("borderFocus")
end sub

sub Showcontent()
  itemcontent = m.top.itemContent
  m.itemposter.uri = itemcontent.HDPosterUrl
  m.itemlabel.text = itemcontent.title
end sub

sub OnFocus()
  print m.top
  if m.top.itemHasFocus then 
    m.borderFocus.color = "0xffd500"
  else
    m.borderFocus.color = "0xffffff"
  end if
end sub