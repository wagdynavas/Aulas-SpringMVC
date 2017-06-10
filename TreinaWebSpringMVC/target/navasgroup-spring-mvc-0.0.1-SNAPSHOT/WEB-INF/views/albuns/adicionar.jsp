<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Navasgroup-spring-MVC Adicionar Albuns</title>
</head>
<body>
	<c:url var="actionAdicionar" value="/albuns/adicionar"></c:url>
	<form:form action="${actionAdicionar }" method="post" modelAttribute="album">
			<label>Nome</label>
			<form:input path="nome"/> <!-- O path recebe o nome do atributo da classe Album q será preenchido por ele -->
			<form:errors path="nome"></form:errors>
			<br>
			<label>Ano de Lancamento</label>
			<form:input path="anoDeLancamento"/>
			<form:errors path="anoDeLancamento"></form:errors><!-- tag do spring que reposnsável por exibir  nossas mensagens de erro de validacao. -->
			<input type="submit" value="Salvar">
			
	</form:form>
</body>
</html>