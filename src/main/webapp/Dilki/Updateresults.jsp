<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
        window.onload = function() {
            var message = '<%= request.getAttribute("message") %>';
            var alertType = '<%= request.getAttribute("alertType") %>';
            if (alertType === "success") {
                alert(message);
            } else if (alertType === "error") {
                alert(message);
            }
           
            window.location.href = "Dilki/index2.jsp"; 
        };
    </script>
</head>
<body>

</body>
</html>