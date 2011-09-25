jQuery ->
	memurl = $("a").attr("href")
	name = $(".member").attr("id")
	localStorage.setItem("name", name)
	localStorage.setItem("memurl", memurl)