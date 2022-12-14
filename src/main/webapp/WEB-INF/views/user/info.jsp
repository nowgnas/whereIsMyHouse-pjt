<%--
  Created by IntelliJ IDEA.
  User: nowgnas
  Date: 2022/10/29
  Time: 11:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Info</title>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <%@include file="../common/head.jsp" %>
</head>
<body>


<article class="container">
    <div class="page-header">
        <div class="col-md-6 col-md-offset-3">
            <h3>Member Infomation</h3>
        </div>
    </div>
    <div class="col-sm-6 col-md-offset-3">

        <div id="infobox"></div>
        <div class="form-group">
            <label for="inputName">성명</label>
            <input type="text" class="form-control" id="name" value="${member.name}">
        </div>
        <div class="form-group">
            <label for="inputName">포지션</label>
            <input type="text" class="form-control" id="position" value="${member.position}">
        </div>

        <div class="form-group">
            <label for="InputEmail">ID</label>
            <input type="text" class="form-control" id="id" value="${member.id}" readonly>
        </div>


        <div class="form-group">
            <label for="inputPasswordCheck">이메일</label>
            <input type="email" class="form-control" id="email" value="${member.email}">
        </div>
        <div class="form-group">
            <label for="inputMobile">휴대폰 번호</label>
            <input type="text" class="form-control" id="phoneNumber" value="${member.phoneNumber}">
        </div>

        <div class="form-group text-center">
            <input type="button" id="updateBtn" class="btn btn-primary" value="정보수정">
            <input type="button" id="deleteBtn" class="btn btn-primary" value="회원탈퇴">
        </div>
    </div>
</article>

<script>
//1) 추가
document.querySelector("#updateBtn").addEventListener("click", async () => {


	  let name = document.querySelector("#name").value;
	  let position = document.querySelector("#position").value;
	  let email = document.querySelector("#email").value;
	  let phoneNumber = document.querySelector("#phoneNumber").value;  
	  let data = {
	        method: "PUT",
	        body: JSON.stringify({name, position, email, phoneNumber}),
	        headers: {"Content-Type": "application/json"},
	    };
	    
	    
	    data = await fetch("update", data);
	    data = await data.text();
	    alert(data);
        opener.parent.location.reload();
        window.close();

  
});


    document.querySelector("#deleteBtn").addEventListener("click", async () => {

        await fetch("delete", {
            method: "DELETE",
        });

        alert("회원탈퇴가 완료되었습니다.");
        opener.parent.location.reload();
        window.close();

    });


</script>
</body>
</html>
