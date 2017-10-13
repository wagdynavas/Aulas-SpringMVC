<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Listas de Albuns</h2><br/>

<div class="row">
	<div class="col-md-11">
		<div class="form-group">
			<label>Pesquisa</label>
			<input type="text" id="txt-pesquisa" class="form-control"/>
		</div>
		<button class="btn btn-default" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>
<table class="table" id="tbl-albuns">
	<thead>
		<th>ID</th>
		<th>Albuns</th>
		<th>Ano do Lançamento</th>
		<th>Ações </th>
	</thead>
	
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>${album.id}</td>
					<td>${album.nome }</td>
					<td>${album.anoDeLancamento}</td>
					<td>
						<a href="/navasgroup-spring-mvc/albuns/alterar/${album.id}">Alterar</a> | 
						<a href="/navasgroup-spring-mvc/albuns/excluir/${album.id}">Excluir</a> | 
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		
	</tbody>
	
</table>
<br/>
<a href="/navasgroup-spring-mvc/albuns/adicionar" class="btn btn-default">Adicionar novo album</a>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-pesquisar').click(function(){
			var nomeAlbum = $('#txt-pesquisa').val();
			$.ajax({
				method: 'GET',
				url: '/navasgroup-spring-mvc/albuns/porNome?nome=' + nomeAlbum,
				success: function(data){
				$('#tbl-albuns tbody > tr').remove();
					$.each(data, function(index, album){
						$('#tbl-albuns tbody').append(
								'<tr>' + 
								'  <td>' + album.id + '</td>' + 
								'  <td>' + album.nome + '</td>' +
								'  <td>' + album.anoDeLancamento + '</td>' +
								'  <td>' +
								'     <a href="/navasgroup-spring-mvc/albuns/alterar/' + album.id +'">Alterar</a> |' +
								'     <a href="/navasgroup-spring-mvc/albuns/excluir/' + album.id +'">Excluir</a> ' + 
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