<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>Lista de Usuários</h2><br/>
<div class="row">
	<div class="col-md-11">
		<div class="form-group">
			<label>Pesquisa</label>
			<input type="text" id="txt-pesquisa" class="form-control"/>
		</div>
		<button class="btn btn-default" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>

<table class="table" id="tbl-musicas">
	<thead>
		<th>ID</th>
		<th>Nome</th>
		<th>Role </th>
		<th>Ações </th>
	</thead>
	
	<tbody>
		<c:if test="${!empty usuarios}">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td>${usuario.id}</td>
					<td>${usuario.username }</td>
					<td>${usuario.role}</td>
					
					<td>
						<a href="/navasgroup-spring-mvc/usuarios/alterar/${usuario.id}">Alterar</a> | 
						<a href="/navasgroup-spring-mvc/usuarios/excluir/${usuario.id}">Excluir</a> | 
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		
	</tbody>
	
</table>
<br/>
<a href="/navasgroup-spring-mvc/usuarios/adicionar" class="btn btn-default">Adicionar novo usuário</a>

<script type="text/javascript">
$(document).ready(function(){
	$('#btn-pesquisar').click(function(){
		var nomeMusica = $('#txt-pesquisa').val();
		$.ajax({
			method: 'GET',
			url: '/navasgroup-spring-mvc/musicas/porNome?nome=' + nomeMusica,
			success: function(data){
				$('#tbl-musicas tbody > tr').remove();
				$.each(data, function(index, musica){
					$('#tbl-musicas tbody').append(
							'<tr>' + 
							'  <td>' + musica.id + '</td>' + 
							'  <td>' + musica.nome + '</td>' +
							'  <td>' + musica.anoDeLancamento + '</td>' +
							'  <td>' +
							'     <a href="/navasgroup-spring-mvc/musicas/alterar/' + musica.id +'">Alterar</a> |' +
							'     <a href="/navasgroup-spring-mvc/musicas/excluir/' + musica.id +'">Excluir</a> ' + 
							'  </td>' +
							'</tr>'
					);
				});
				
			},
			error: function(){
				alert("Houve um erro na requisicao");
			}
		});
	});
});

</script>