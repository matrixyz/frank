
var param = {};
$.ajax({
		type: "get",
	url:"/main/module?cmd=listShow&rand="+MathRand(),
	data: param,
	dataType: "json",
	
	success:function(data){
		if(data!=null&&data.length==0){
			alert("没有数据!");
		}
		for ( var borrow in data) {
		 
		}
	},
	error: function (XMLHttpRequest, textStatus, errorThrown) {
			alert(errorThrown);
	}
});	

$.post("test.php", { "func": "getNameAndTime" },
	function(data){
		     alert(data.name); // John
		     console.log(data.time); //  2pm
	}, "json");



<!DOCTYPE html><html><head><title>Apache Tomcat/8.0.36 - Error report</title><style type="text/css">H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}.line {height: 1px; background-color: #525D76; border: none;}</style> </head><body><h1>HTTP Status 415 - </h1><div class="line"></div><p><b>type</b> Status report</p><p><b>message</b> <u></u></p><p><b>description</b> <u>The server refused this request because the request entity is in a format not supported by the requested resource for the requested method.</u></p><hr class="line"><h3>Apache Tomcat/8.0.36</h3></body></html>