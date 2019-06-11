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
			<i class="fab fa-chromecast"></i> Liste des groupes
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
				<c:forEach var="groupe" items="${groupes}">
					<tr align="center">
						<th scope="row">${groupe.idGroupe}</th>
						<td>${groupe.nomGroupe}</td>
						<td><a href="/groupes?id=${groupe.idGroupe}"><button
									class="btn btn-info btn-sm">
									<i class="fas fa-edit"></i> Modifier
								</button></a></td>
						<td>
							<form
								onsubmit="return confirm('êtes-vous sûre de supprimer le client?')"
								method="POST" action="/clients">
								<input type="hidden" name="deleteGroupe"
									value="${groupe.idGroupe}" />
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

		<form:form method="POST" modelAttribute="groupe">
			<div class="form-group">
				<form:input path="idGroupe" type="hidden" />
				<form:label path="nomGroupe">Nom Groupe: </form:label>
				<form:input type="text" class="form-control" path="nomGroupe"
					placeholder="Saisir le nom du groupe..." />
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