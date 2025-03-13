<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Navigation</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Future Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/main.jsp">메인</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/bbs.jsp">게시판</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="margin-right:50px">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"> 접속하기</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/login.jsp">로그인</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">회원가입</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
