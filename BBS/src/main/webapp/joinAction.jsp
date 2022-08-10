<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Bulletin website</title>
</head>
<body>
		<%
					if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
							|| user.getUserGender() == null || user.getUserEmail() == null) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('There is a blank information')");
							script.println("history.back()");
							script.println("</script>");
					} else{
							UserDAO userDAO = new UserDAO();
							int result = userDAO.join(user);
							if (result ==  -1) {  // In case of ID already existion 
									PrintWriter script = response.getWriter();
									script.println("<script>");
									script.println("alert('This ID already exists')");
									script.println("history.back()");
									script.println("</script>");
							} else if (result == 0) { // In case of membership registration done
									PrintWriter script = response.getWriter();
									script.println("<script>");
									script.println("location.href = 'main.jsp'");
									script.println("</script>");
							} 
					}
					
		%>
</body>
</html>