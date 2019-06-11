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
			<i class="fas fa-exchange-alt"></i> Virement
		</h1>

		<c:if test="${errorMontant != null}">
			<div class="row alert alert-danger text-center">
				<i class="fas fa-exclamation"></i>&nbsp; ${errorMontant}
			</div>
		</c:if>

		<hr>

		<form method="POST" >
			<div class="form-group">
				<div class="form-group">
					<label >Date de operation: </label>
					<input required="true" type="date" name="dateOperation" class="form-control"  />
				</div>
				<div class="form-group">
					<label >Montant: </label>
					<input required="true" type="number" name="montant" value="0.0" placeholder="montant" class="form-control"  />
				</div>
				<div class="form-group">
					<label >Compte Emetteur: </label>
					<select required="true" name="compteEmetteur" class="form-control">
						<c:forEach var="compte" items="${comptes}">
							<option value="${compte.numCompte}">${compte}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label >Compte Recepteur: </label>
					<select required="true" name="compteRecepteur" class="form-control">
						<c:forEach var="compte" items="${comptes}">
							<option value="${compte.numCompte}">${compte}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label >Employe: </label>
					<select required="true" name="employe" class="form-control">
						<c:forEach var="employe" items="${employes}">
							<option value="${employe.idEmploye}">${employe}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="fas fa-save"></i> Sauvegarder
			</button>
		</form>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/all.min.js"></script>
</body>
</html>