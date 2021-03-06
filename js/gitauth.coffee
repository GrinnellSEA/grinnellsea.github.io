---
---

window.token_encrypted = ""

xhr("/login/oauth.json?" + Math.floor(Math.random()*1e12).toString(), (d) ->
	window.token_encrypted = JSON.parse(d))

window.getRepository = (err) ->
	github = new Github(
		token: decrypt(window.token_encrypted, localStorage.password, err)
		auth: "oauth"
	)

	github.getRepo("GrinnellSEA", "grinnellsea.github.io")


window.decrypt = (encrypted, password, err) ->
	if password
		try
			return sjcl.decrypt(password, JSON.stringify(encrypted))
		catch error
			err "Not authorized."
	else
		err "Not authorized"
	
	false
