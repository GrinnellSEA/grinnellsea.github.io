---
title: Login
---

<input type="password" id="password" placeholder="Password" /> 
<button id="loginbutton">Login</button> <br />
Stay signed in? 
<input type="checkbox" checked id="staysignedin" />

<script type="text/javascript">
	registerFunction(function() {
		$("#loginbutton").onclick = function() {
			var password = $("#password").value;
			if ($("#staysignedin").checked) {
				localStorage.password = password;
			}
			if (getAuth(password)) {
				// redirect to previous page
				location.href = location.search.split("=")[1]; 				
			}
		};

		$("#password").onkeypress = function(e) {
			if (e.keyCode === 13) {
				$("#loginbutton").click();
			}
		};
	 });
</script>