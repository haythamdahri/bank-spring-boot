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
			<i class="far fa-list-alt"></i> Liste des versements
		</h1>

		<table class="table table-striped ">
			<thead>
				<tr align="center">
					<th scope="col">#</th>
					<th scope="col">Date</th>
					<th scope="col">Montant</th>
					<th scope="col">Compte</th>
					<th scope="col">Employe</th>
					<th scope="col" colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="versement" items="${versements}">
					<tr align="center">
						<th scope="row">${versement.numOperation}</th>
						<th scope="row">${versement.dateOperation}</th>
						<td>${versement.montant}</t>
						<td><a
							href="/comptes?id=${versement.compte.numCompte}">${versement.compte}</a></td>
						<td><a
							href="/employes?id=${versement.employe.idEmploye}">${versement.employe}</a></td>
						<td><a href="/versements?id=${versement.numOperation}"><button
									class="btn btn-info btn-sm">
									<i class="fas fa-edit"></i> Modifier
								</button></a></td>
						<td>
							<form
								onsubmit="return confirm('êtes-vous sûre de supprimer le versement?')"
								method="POST" action="/versements">
								<input type="hidden" name="deleteOperation"
									value="${versement.numOperation}" />
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="far fa-trash-alt"></i> Supprimer
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${versements == null || versements.size() == 0}">
					<tr>
						<td colspan="7" class="alert alert-warning text-center"><i
							class="fas fa-exclamation"></i> Aucun versement n'a été trouvé</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<hr>

		<c:if test="${versement.numOperation != null}">
			<h5 class="text-center"><i class="fas fa-edit"></i> Modification</h5>
		</c:if>
		<c:if test="${versement.numOperation == null}">
			<h5 class="text-center"><i class="fas fa-external-link-alt"></i> Ajout</h5>
		</c:if>

		<form:form method="POST" modelAttribute="versement">
			<div class="form-group">
				<form:input path="numOperation" type="hidden" />
				<div class="form-group">
					<form:label path="dateOperation">Date de operation: </form:label>
					<form:input required="true" type="date" class="form-control" path="dateOperation" />
				</div>
				<div class="form-group">
					<form:label path="montant">Montant: </form:label>
					<form:input required="true" type="number" class="form-control" path="montant" />
				</div>
				<div class="form-group">
					<form:label path="compte">Compte: </form:label>
					<form:select required="true" path="compte" class="form-control">
						<c:forEach var="compte" items="${comptes}">
							<option value="${compte.key}"
								<c:if test="${compte.key == versement.compte.numCompte}"> selected </c:if>>${compte.value}</option>
						</c:forEach>
					</form:select>
				</div>
				<div class="form-group">
					<form:label path="employe">Employe: </form:label>
					<form:select required="true" path="employe" class="form-control">
						<c:forEach var="employe" items="${employes}">
							<option value="${employe.key}"
								<c:if test="${employe.key == versement.employe.idEmploye}"> selected </c:if>>${employe.value}</option>
						</c:forEach>
					</form:select>
				</div>
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