<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
	<jsp:include page="../views/template/header.jsp"/>

<body>
	<jsp:include page="../views/template/nav.jsp"/>


	<div class="container">
		<div class="starter-template">
			<h1>JSTL Core Example Page</h1>
			<p class="lead"></p>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:out example:</div>
			<div class="col-xs-5">
				<c:out value="This is the output from c:out"></c:out>
				<br>
				<c:out value="${null}" default="this is the default value"></c:out>
				<br>
				<c:out value="${person1.firstName}" />
				<c:out value="${person1.lastName}" />
				<br>
				<c:out value="${person2.firstName}" default="no name" />
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:set example:</div>
			<div class="col-xs-5">
				<c:set var="var1" scope="session" value="${person1.firstName} - ${person1.lastName}" />
				<c:out value="${var1}" />
				<br>
				<c:set target="${ person1 }" property="firstName" value="Ralph" />
				<c:out value="${person1.firstName}" />
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:remove example:</div>
			<div class="col-xs-5">
				var1 before:
				<c:out value="${var1}" />
				<br>
				<c:remove var="var1" />
				var1 after remove:
				<c:out value="${var1}" />
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:catch example:</div>
			<div class="col-xs-5">
				<c:catch var="caughtException">
					<%
						int x = 10 / 0;
					%>
				</c:catch>
				<c:if test="${ caughtException != null }">
					Caught an exception: ${caughtException}
					<br>
					Message is ${caughtException.message}
				</c:if>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:if example:</div>
			<div class="col-xs-5">
				<c:if test="${ 10 > 5 }">
					10 is greater than 5: ${ 10 > 5 }
				</c:if>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:choose example:</div>
			<div class="col-xs-5">
				First c:choose example:
				<c:choose>
					<c:when test="${ true }">
						First is true
					</c:when>
					<c:when test="${ false }">
						Second is true
					</c:when>
					<c:otherwise>
						Nothing is true
					</c:otherwise>
				</c:choose>
				<br> Second c:choose example:
				<c:choose>
					<c:when test="${ false }">
						First is true
					</c:when>
					<c:when test="${ true }">
						Second is true
					</c:when>
					<c:otherwise>
						Nothing is true
					</c:otherwise>
				</c:choose>
				<br> Third c:choose example:
				<c:choose>
					<c:when test="${ false }">
						First is true
					</c:when>
					<c:when test="${ false }">
						Second is true
					</c:when>
					<c:otherwise>
						Nothing is true
					</c:otherwise>
				</c:choose>
				<br>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:import example:</div>
			<div class="col-xs-5">
				<c:import var="data" url="http://localhost:${pageContext.request.localPort}/jsp-examples/simpleTestPage" />
				<c:out value="${data}" />
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:forEach example:</div>
			<div class="col-xs-8">
				Example 1:<br>
				<c:forEach var="bob" varStatus="counter" items="${bobs}">
					Loop ${counter.index}: ${bob.firstName} ${bob.lastName}<br>
				</c:forEach>
				Example 2:<br>
				<c:forEach var="bob" varStatus="counter" items="${bobs}" begin="1">
					Loop ${counter.index}: ${bob.firstName} ${bob.lastName}<br>
				</c:forEach>
				Example 3:<br>
				<c:forEach var="bob" varStatus="counter" items="${bobs}" end="1">
					Loop ${counter.index}: ${bob.firstName} ${bob.lastName}<br>
				</c:forEach>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:forToken example:</div>
			<div class="col-xs-8">
				<c:forTokens var="name" varStatus="counter" items="Me,Myself,I" delims=",">
					Loop ${counter.index}: ${name}<br>
				</c:forTokens>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:param example:</div>
			<div class="col-xs-8">
				<c:url var="myUrl" value="http://localhost:${pageContext.request.localPort}/jsp-examples/simpleTestPage">
					<c:param name="num1" value="333" />
					<c:param name="num2" value="333" />
				</c:url>
				<c:out value="${myUrl}" />
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">c:redirect example:</div>
			<div class="col-xs-8">&#60;c:redirect url="https://www.google.com"/&#62;</div>
		</div>

	</div>

</body>
</html>
