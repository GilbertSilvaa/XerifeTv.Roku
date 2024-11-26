sub Init()
  m.top.functionName = "Request"
end sub

sub Request()
  URL = "https://xerifetv-cms.onrender.com/Api/Content/Movies?limit=10"
  urlTransfer = CreateObject("RoUrlTransfer")
  urlTransfer.SetUrl(URL)
  urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
  response = urlTransfer.GetToString()

  if response = invalid then return
  response = ParseJson(response)

  content = CreateObject("roSGNode", "ContentNode")

  for each item in response
    categoryNode = CreateObject("roSGNode", "ContentNode")
    categoryNode.title = item.category

    for each movie in item.items
      movieNode = CreateObject("roSGNode", "ContentNode")
      movieNode.id = movie.id
      movieNode.AddFields(movie)
      movieNode.AddFields({ HDPosterUrl: movie.posterUrl })
      categoryNode.AppendChild(movieNode)
    end for

    content.AppendChild(categoryNode)
  end for

  m.top.response = content
end sub
