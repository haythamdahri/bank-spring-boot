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
			<i class="far fa-user"></i> Liste des comptes
		</h1>


		<table class="table table-striped ">
			<thead>
				<tr align="center">
					<th scope="col">#</th>
					<th scope="col">Date de création</th>
					<th scope="col">Solde</th>
					<th scope="col">Client</th>
					<th scope="col">Employee</th>
					<th scope="col" colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="compte" items="${comptes}">
					<tr align="center">
						<th scope="row">${compte.numCompte}</th>
						<td>${compte.dateCreation}</td>
						<td>${compte.solde}</td>
						<td><a href="/comptes?client=${compte.client.idClient}">${compte.client}</a></td>
						<td><a href="/comptes?employe=${compte.employe.idEmploye}">${compte.employe}</a></td>
						<td><a href="/comptes?id=${compte.numCompte}"><button
									class="btn btn-info btn-sm">
									<i class="fas fa-edit"></i> Modifier
								</button></a></td>
						<td>
						<td>
							<form
								onsubmit="return confirm('êtes-vous sûre de supprimer le compte?')"
								method="POST" action="/comptes">
								<input type="hidden" name="deleteCompte"
									value="${compte.numCompte}" />
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="far fa-trash-alt"></i> Supprimer
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${comptes == null || comptes.size() == 0}">
					<tr>
						<td colspan="7" class="alert alert-warning text-center font-weight-bold"><i
							class="fas fa-exclamation"></i> Aucun employe n'a été trouvé</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<hr>
		
		<c:if test="${compte.numCompte != null}">
			<h5 class="text-center">
				<i class="fas fa-edit"></i> Modification
			</h5>
		</c:if>
		<c:if test="${compte.numCompte == null}">
			<h5 class="text-center">
				<i class="fas fa-external-link-alt"></i> Ajout
			</h5>
		</c:if>

		<form:form method="POST" modelAttribute="compte">
			<form:input path="numCompte" type="hidden" />
			<div class="form-group">
				<form:label path="dateCreation">Date de création: </form:label>
				<form:input required="true"  type="date" class="form-control" path="dateCreation" />
			</div>
			<div class="form-group">
				<form:label path="solde">Solde: </form:label>
				<form:input required="true"  type="number" class="form-control" path="solde" />
			</div>
			<div class="form-group">
				<form:label path="client">Client: </form:label>
				<form:select required="true"  path="client" class="form-control">
					<c:forEach var="client" items="${clients}">
						<option value="${client.key}" <c:if test="${client.key == compte.client.idClient}"> selected </c:if>>${client.value}</option>
					</c:forEach>
				</form:select>
			</div>

			<div class="form-group">
				<form:label path="employe">Employe: </form:label>
				<form:select required="true"  path="employe" class="form-control">
					<c:forEach var="employe" items="${employes}">
						<option value="${employe.key}" <c:if test="${employe.key == compte.employe.idEmploye}"> selected </c:if>>${employe.value}</option>
					</c:forEach>
				</form:select>
			</div>

			<div class="form-group">
				<label>Type compte: </label> <select required="true"  name="typeCompte"
					class="form-control">
					<c:forEach var="typeCompte" items="${typeComptes}">
						<option value="${typeCompte}" <c:if test="${typeCompte == compteType}"> selected </c:if>>${typeCompte}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label>Intérêts(Pour compte épargne): </label> <input required="true"  type="number"
					value="${isEpargne != null ? compte.interet : 0}"
					class="form-control" name="interet" placeholder="Intérêts..." />
			</div>

			<div class="form-group">
				<label>Découverts(Pour compte courant): </label> <input required="true" 
					type="number" value="${isCourant != null ? compte.decouvert : 0}"
					class="form-control" name="decouvert" placeholder="Découverts...." />
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-save"></i> Sauvegarder
			</button>
		</form:form>

		<div class="row mb-5"></div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/all.min.js"></script>
</body>
</html>