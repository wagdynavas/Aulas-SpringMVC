<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url var="actionEditar" value="/musicas/alterar"></c:url>
<h2>Editar Música "${musica.nome }"</h2><br/>
<form:form action="${actionEditar }" method="post"
	modelAttribute="musica">
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>id</label>
				<form:input path="id" cssClass="form-control" readonly="true"/>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control"/>
				<form:errors path="nome" cssStyle="color: red"></form:errors> <!-- tag do spring que reposnsável por exibir  nossas mensagens de erro de validacao. -->
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Data de criação</label>
				<form:input path="dataDeCriacao" cssClass="form-control"/>
				<form:errors path="dataDeCriacao" cssStyle="color: red"></form:errors> <!-- tag do spring que reposnsável por exibir  nossas mensagens de erro de validacao. -->
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Album</label>
				<form:select path="album.id" cssClass="form-control">
					<form:options items="${albuns }" itemLabel="nome"
					itemValue="id"/>
				</form:select>
			</div>
		</div>
	</div>
	<input type="submit" value="Salvar" class="btn-default">

</form:form>
