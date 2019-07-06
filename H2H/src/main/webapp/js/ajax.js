// JavaScript Document
/** ************************图书详情***************************** */
function changeBookInfo(value, location, status){
	var xmlhttp;
	var url = "";
	url = "bookDetailChangeLocationServlet?bookbarCode=" + value;

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			display2(check, location, status);
		}
	};
	xmlhttp.send(null);

}

function display2(str, location, status) {
		arr = str.split("|");
		document.getElementById(location).value = arr[0];
		document.getElementById(status).value = arr[1];
}
/** ************************账号重复***************************** */
function smaeLibrarian(account, label, button) {
	var xmlhttp;
	var url = "";

	url = "adminop?account=" + document.getElementById(account).value;

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			myshow(check, account, label, button);
		}
	};
	xmlhttp.send(null);

}

function myshow(str1, account, label, button) {
	if (str1 == "same") {
		document.getElementById(label).innerHTML = "Account already exists";
		document.getElementById(button).setAttribute("disabled", "true");
	} else {
		document.getElementById(button).disabled=false;
		document.getElementById(label).innerHTML = "";
	}
}
/** ********************添加Librarian************************** */
function addLibrarian(account, password, repeatPassword) {
	var xmlhttp;
	var url = "";

	if (document.getElementById(account).value == ""
			|| document.getElementById(password).value == ""
			|| document.getElementById(repeatPassword).value == "") {
		alert("Account or password is empty!");
		return;
	}

	if (document.getElementById(password).value != document
			.getElementById(repeatPassword).value) {
		alert("Entered passwords differ!");
		return;
	}

	url = "adminop?account=" + document.getElementById(account).value
			+ "&password=" + document.getElementById(password).value;

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			display(check, account, password, repeatPassword);
		}
	};
	xmlhttp.send(null);

}

function display(str1, account, password, repeatPassword) {
	if (str1 == "ok") {
		alert("This operation succeeds!");
		document.getElementById(account).value = "";
		document.getElementById(password).value = "";
		document.getElementById(repeatPassword).value = "";
	}
	if (str1 == "no") {
		alert("This operation fails!");
		document.getElementById(account).value = "";
		document.getElementById(password).value = "";
		document.getElementById(repeatPassword).value = "";
	}
}
/** ********************修改Admin密码************************** */
function modifyAdminPassword(oldPassword, newPassword, repeatPassword) {
	var xmlhttp;
	var url = "";

	if (document.getElementById(oldPassword).value == ""
			|| document.getElementById(newPassword).value == ""
			|| document.getElementById(repeatPassword).value == "") {
		alert("Password is empty!");
		return;
	}

	if (document.getElementById(newPassword).value != document
			.getElementById(repeatPassword).value) {
		alert("Entered new passwords differ!");
		return;
	}

	url = "adminop?oldPassword=" + document.getElementById(oldPassword).value
			+ "&newPassword=" + document.getElementById(newPassword).value;

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			display1(check, oldPassword, newPassword, repeatPassword);
		}
	};
	xmlhttp.send(null);

}

function display1(str1, oldPassword, newPassword, repeatPassword) {
	if (str1 == "ok") {
		alert("This operation succeeds!");
		document.getElementById(oldPassword).value = "";
		document.getElementById(newPassword).value = "";
		document.getElementById(repeatPassword).value = "";
	}
	if (str1 == "no") {
		alert("This operation fails!");
		document.getElementById(oldPassword).value = "";
		document.getElementById(newPassword).value = "";
		document.getElementById(repeatPassword).value = "";
	}
}
/** ********************修改借书数、罚款、押金************************** */
function sendtext(textId, labelId) {
	var xmlhttp;
	var url = "";

	if (textId == "number") {
		url = "adminop?number=" + document.getElementById(textId).value;
	} else if (textId == "fineStrategy") {
		url = "adminop?fine=" + document.getElementById(textId).value;
	} else if (textId == "cashPledge") {
		url = "adminop?cash=" + document.getElementById(textId).value;
	} else if (textId == "fineLimitTime") {
		url = "adminop?fineLimitTime=" + document.getElementById(textId).value;
	} else if (textId == "reservedTime") {
		url = "adminop?reservedTime=" + document.getElementById(textId).value;
	} else if (textId == "reservedMaxinum") {
		url = "adminop?reservedMaxinum="
				+ document.getElementById(textId).value;
	}

	if (document.getElementById(textId).value == "") {
		alert("Can not be empty!");
		return;
	}

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			show(check, textId, labelId);
		}
	};
	xmlhttp.send(null);
}

function show(str2, textId, labelId) {
	if (str2 == "ok") {
		alert("This operation succeeds!");
		if (labelId == "numberlabel")
			document.getElementById(labelId).setAttribute(
					'alt',
					"cuurent maximum number: "
							+ document.getElementById(textId).value);

		if (labelId == "finelabel")
			document.getElementById(labelId).setAttribute(
					'alt',
					"current strategy: "
							+ document.getElementById(textId).value);

		if (labelId == "cashlabel")
			document.getElementById(labelId).setAttribute('alt',
					"current pledge: " + document.getElementById(textId).value);

		if (labelId == "fineLimitTimeLabel")
			document.getElementById(labelId)
					.setAttribute(
							'alt',
							"fine limit time: "
									+ document.getElementById(textId).value);

		if (labelId == "reservedTimeLabel")
			document.getElementById(labelId).setAttribute('alt',
					"reserved time: " + document.getElementById(textId).value);

		if (labelId == "reservedMaxinumLabel")
			document.getElementById(labelId).setAttribute(
					'alt',
					"reserved maxinum: "
							+ document.getElementById(textId).value);

		document.getElementById(textId).value = "";
	}
	if (str2 == "no") {
		alert("This operation fails!");
		document.getElementById(textId).value = "";
	}
	if (str2 == "no1") {
		alert("You should type in a number between 0.00 to 999.99!");
		document.getElementById(textId).value = "";

	}
}
