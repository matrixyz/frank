<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<form action="/user/login" method="post">
用户名： <input type="text" name="name"/><br/>
 密码：<input type="text" name="pwd"/><br/>
<input type="submit" value="登录"/><br/>
${msg}

</form>
</body>
</html>
