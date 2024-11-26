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
  m.borderFocus.visible = m.top.itemHasFocus
end sub