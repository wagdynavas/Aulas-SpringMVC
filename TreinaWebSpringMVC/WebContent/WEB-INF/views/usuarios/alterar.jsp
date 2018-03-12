<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:url var="actionEditar" value="/usuarios/alterar"></c:url>
<h2>Editar Usuário "${usuario.username }"</h2>
<br />
<form:form action="${actionEditar }" method="post"
	modelAttribute="usuario">

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>id</label>
				<form:input path="id" cssClass="form-control" readonly="true" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="username" cssClass="form-control" />
				<form:errors path="username" cssStyle="color: red"></form:errors>
				<!-- tag do spring que reposnsável por exibir  nossas mensagens de erro de validacao. -->
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Password</label>
				<form:password path="password" cssClass="form-control" placeholder="******"/>
				<form:errors path="password" cssStyle="color: red"></form:errors>
				<!-- tag do spring que reposnsável por exibir  nossas mensagens de erro de validacao. -->
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Role</label>
				<form:select path="role" cssClass="form-control">
					<option value="ROLE_ADMIN">Administrador</option>
					<option value="ROLE_USER">Usuário comum</option>
				</form:select>
			</div>
		</div>
	</div>
	<input type="submit" value="Salvar" class="btn-default">

</form:form>
