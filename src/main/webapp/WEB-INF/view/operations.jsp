<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="fr">


<jsp:include page="head.jsp" />


<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/"><i class="fas fa-university"></i>
			Banque</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/clients"><i
						class="fas fa-users"></i> Clients <span class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>

	<div class="container mt-5">
		<h1 class="display-4">
			<i class="fab fa-chromecast"></i> Liste des clients
		</h1>


		<table class="table table-striped ">
			<thead>
				<tr align="center">
					<th scope="col">#</th>
					<th scope="col">Nom</th>
					<th scope="col" colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="client" items="${clients}">
					<tr align="center">
						<th scope="row">${client.idClient}</th>
						<td>${client.nomClient}</td>
						<td><a href="/clients?id=${client.idClient}"><button
									class="btn btn-info btn-sm">
									<i class="fas fa-edit"></i> Modifier
								</button></a></td>
						<td>
							<form
								onsubmit="return confirm('êtes-vous sûre de supprimer le client?')"
								method="POST" action="/clients">
								<input type="hidden" name="deleteClient"
									value="${client.idClient}" />
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="far fa-trash-alt"></i> Supprimer
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<hr>

		<form:form method="POST" modelAttribute="client">
			<div class="form-group">
				<form:input path="idClient" type="hidden" />
				<form:label path="nomClient">Nom client: </form:label>
				<form:input type="text" class="form-control" path="nomClient"
					placeholder="Saisir le nom du client..." />
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="fas fa-save"></i> Sauvegarder
			</button>
		</form:form>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/all.min.js"></script>
</body>
</html>