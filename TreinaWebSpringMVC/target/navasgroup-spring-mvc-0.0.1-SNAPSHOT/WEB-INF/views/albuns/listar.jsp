<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Listas de Albuns</h2><br/>

<table class="table">
	<thead>
		<th>ID</th>
		<th>Albuns</th>
		<th>Ano do Lancamento</th>
		<th>Acoes</th>
	</thead>
	
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>$(album.id)</td>
					<td>$(album.nome)</td>
					<td>$(album.anoDeLancamento)</td>
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