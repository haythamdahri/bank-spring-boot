<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="fr">


<jsp:include page="head.jsp" />


<body>

	<!-- Include navbar -->
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container mt-5">
		<h1 class="display-4">
			<i class="fas fa-user-friends"></i> Liste des clients
		</h1>

		<div class="row mb-4">
			<div class="col-12">
				<form>
					<div class="form-group">
						<label>Nom: </label> <input name="name" class="form-control"
							placeholder="Nom client..." />
					</div>
					<button class="btn btn-primary btn-sm"><i class="fas fa-search"></i> Recherche</button>
				</form>
			</div>
		</div>

		<table class="table table-striped ">
			<thead>
				<tr align="center">
					<th scope="col">#</th>
					<th scope="col">Nom</th>
					<th scope="col">Comptes</th>
					<th scope="col" colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="client" items="${clients}">
					<tr align="center">
						<th scope="row">${client.idClient}</th>
						<td>${client.nomClient}</td>
						<td><a href="/comptes?client=${client.idClient}">Comptes
								du client</a></td>
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
				
				<c:if test="${clients == null || clients.size() == 0}">
					<tr>
						<td colspan="5" class="alert alert-warning text-center font-weight-bold"><i
							class="fas fa-exclamation"></i> Aucun client n'a été trouvé</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<hr>

		<c:if test="${client.idClient != null}">
			<h5 class="text-center">
				<i class="fas fa-edit"></i> Modification
			</h5>
		</c:if>
		<c:if test="${client.idClient == null}">
			<h5 class="text-center">
				<i class="fas fa-external-link-alt"></i> Ajout
			</h5>
		</c:if>

		<form:form method="POST" modelAttribute="client">
			<div class="form-group">
				<form:input path="idClient" type="hidden" />
				<form:label path="nomClient">Nom client: </form:label>
				<form:input required="true" type="text" class="form-control" path="nomClient"
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