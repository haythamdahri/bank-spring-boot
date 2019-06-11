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
			<i class="fas fa-list"></i> Liste des employés
		</h1>


		<table class="table table-striped ">
			<thead>
				<tr align="center">
					<th scope="col">#</th>
					<th scope="col">Nom</th>
					<th scope="col">Comptes crées</th>
					<th scope="col">Groupes</th>
					<th scope="col" colspan="4">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employe" items="${employes}">
					<tr align="center">
						<th scope="row">${employe.idEmploye}</th>
						<td>${employe.nomEmploye}</td>
						<td><a href="/comptes?employe=${employe.idEmploye}">Liste des comptes</a></td>
						<td><c:forEach var="groupe" items="${employe.groupes}"
								varStatus="status">
								<a href="/employes?groupe=${groupe.idGroupe}">${groupe.nomGroupe}</a>
								<c:if test="${!status.last}">,</c:if>
							</c:forEach> <c:if
								test="${employe.groupes == null || employe.groupes.size() == 0}">
								<p class="text-info">Employé n'est pas affécté a aucun
									groupe</p>
							</c:if></td>
						<td><a href="/employes?id=${employe.idEmploye}"><button
									class="btn btn-info btn-sm">
									<i class="fas fa-edit"></i> Modifier
								</button></a></td>
						<td>
						<td>
							<button class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#employeModal${employe.idEmploye}">
								<i class="fas fa-user-plus"></i> Ajouter à un groupe
							</button> <!-- Modal -->
							<div class="modal fade bd-example-modal-lg"
								id="employeModal${employe.idEmploye}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">
												<i class="fas fa-users"></i> Groupes
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="POST" action="/add-groupe-employe">
											<div class="modal-body">
												<input type="hidden" name="employe"
													value="${employe.idEmploye}" />
												<div class="form-group">
													<label>Groupe</label> <select class="form-control"
														name="groupe">
														<c:forEach var="groupe" items="${groupes}">
															<option value="${groupe.idGroupe}">${groupe.nomGroupe}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">
													<i class="far fa-window-close"></i> Fermer
												</button>
												<button type="submit" class="btn btn-primary">
													<i class="fas fa-save"></i> Sauvegarder
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</td>
						<td>
							<form
								onsubmit="return confirm('êtes-vous sûre de supprimer l\'employe?')"
								method="POST" action="/employes">
								<input required type="hidden" name="deleteEmploye"
									value="${employe.idEmploye}" />
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="far fa-trash-alt"></i> Supprimer
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
				
				<c:if test="${employes == null || employes.size() == 0}">
					<tr>
						<td colspan="8" class="alert alert-warning text-center font-weight-bold"><i
							class="fas fa-exclamation"></i> Aucun client n'a été trouvé</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<hr>
		
		<c:if test="${employe.idEmploye != null}">
			<h5 class="text-center">
				<i class="fas fa-edit"></i> Modification
			</h5>
		</c:if>
		<c:if test="${employe.idEmploye == null}">
			<h5 class="text-center">
				<i class="fas fa-external-link-alt"></i> Ajout
			</h5>
		</c:if>

		<form:form method="POST" modelAttribute="employe">
			<div class="form-group">
				<form:input path="idEmploye" type="hidden" />
				<form:label path="nomEmploye">Nom Employe: </form:label>
				<form:input type="text" class="form-control" path="nomEmploye" required="true"
					placeholder="Saisir le nom d'employe..." />
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