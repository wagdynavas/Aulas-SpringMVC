<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Navas Group</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal" />
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Albuns <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/navasgroup-spring-mvc/albuns/listar">Listar</a></li>
							<li><a href="/navasgroup-spring-mvc/albuns/adicionar">Cadastrar</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Músicas <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/navasgroup-spring-mvc/musicas/listar">Listar</a></li>
							<li><a href="/navasgroup-spring-mvc/musicas/adicionar">Cadastrar</a></li>
						</ul></li>
				</ul>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Usuários <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/navasgroup-spring-mvc/usuarios/listar">Listar</a></li>
								<li><a href="/navasgroup-spring-mvc/usuarios/adicionar">Cadastrar</a></li>
							</ul></li>
					</ul>
				</sec:authorize>

				<ul class="nav navbar-nav" style="float: right;">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Bem-vindo, ${principal.username}<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/navasgroup-spring-mvc/logout">Sair</a></li>

						</ul></li>
				</ul>
			</div>
		</sec:authorize>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>