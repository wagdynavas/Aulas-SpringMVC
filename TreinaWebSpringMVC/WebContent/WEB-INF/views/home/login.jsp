<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<link href="../resources/css/login.css" rel="stylesheet" />
<title>Albuns login</title>
</head>


<body>
	
	 <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form action="/navasgroup-spring-mvc/login" method="post" class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Nome" required autofocus>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Lembrar de mim
                    </label>
                </div>
                <input value="Entrar" class="btn btn-lg btn-primary btn-block btn-signin" type="submit"/>
            </form><!-- /form -->
            <a href="#" class="forgot-password">
               Esqueceu a senha?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
