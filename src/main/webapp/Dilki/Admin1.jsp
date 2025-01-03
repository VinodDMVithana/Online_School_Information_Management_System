<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome back</title>
    <link rel="stylesheet" href="css/Astyles.css"> 
</head>
<body>

    <header>
        <h2>Welcome to SIMS College</h2>
      <nav>
        <a href ="Dilki/index.jsp">Logout</a>
        </nav>
    </header>
     <nav>
    <a href = "Dilki/index2.jsp" >Home</a>
    <a href = "">Library</a>
    <a href = "Dilki/index.jsp">Timetables</a>
    <a href = "">Courses</a>
   </nav>

    <div class="user-account-container">
        <c:forEach var="ad" items="${adDetails}">
        
        <c:set var="id" value="${ad.id}"/>
        <c:set var="name" value="${ad.name}"/>
        <c:set var="email" value="${ad.email}"/>
        <c:set var="phone" value="${ad.phone}"/>
        <c:set var="username" value="${ad.username}"/>
        <c:set var="password" value="${ad.password}"/>
        <c:set var="role" value="${ad.role}"/>
            
            <div class="user-detail">
                <h3>Hello ${ad.name}</h3>
                <p>ID: ${ad.id}</p>
                <p>Name: ${ad.name}</p>
                <p>Email: ${ad.email}</p>
                <p>Phone: ${ad.phone}</p>
                <p>Username: ${ad.username}</p>
                <p>Password:${ad.password}</p>
                <p>Role: ${ad.role}</p>
                
            </div>
        </c:forEach>
    </div>
    <c:url value ="Dilki/updateuser.jsp" var ="Userupdate">
    <c:param name="id" value="${id}"/>
     <c:param name="name" value="${name}"/>
      <c:param name="email" value="${email}"/>
       <c:param name="phone" value="${phone}"/>
        <c:param name="username" value="${username}"/>
        <c:param name="password" value="${password}"/>
         <c:param name="role" value="${role}"/>
    
    </c:url>
    <a href = "${Userupdate}">
    <input type = "button" name ="update" value = "Update Profile">
    </a>
    
    <c:url value ="Dilki/deleteuser.jsp" var ="Userdelete">
    <c:param name="id" value="${id}"/>
     <c:param name="name" value="${name}"/>
      <c:param name="email" value="${email}"/>
       <c:param name="phone" value="${phone}"/>
        <c:param name="username" value="${username}"/>
        <c:param name="password" value="${password}"/>
         <c:param name="role" value="${role}"/>
    </c:url>
    <a href = "${Userdelete}">
    <input type="submit" name = "delete" value = "Delete my account">
   </a>
    <a href ="Yasintha/Dashboard.jsp">Go to your Dashboard</a>
    
    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 SIMS System. All rights reserved.We are Y2S1 SE/OOP/WD/MLB/G7 students</p>
    </footer>

</body>
</html>
