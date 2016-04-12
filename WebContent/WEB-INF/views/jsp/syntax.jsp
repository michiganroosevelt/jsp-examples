<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../views/template/header.jsp" />

<body>
	<jsp:include page="../../views/template/nav.jsp" />

	<div class="container">
		<div class="starter-template">
			<h1>JSP Syntax</h1>
			<p class="lead"></p>
		</div>

		<div class='row'>
			<div class="col-xs-2">Basic Scriptlet</div>
			<div class="col-xs-5">
				<% out.println("Example 1"); %>
				<br>
				<jsp:scriptlet>
					out.print("Example 2");
				</jsp:scriptlet>
			</div>
		</div>
		
		<div class='row'>
			<div class="col-xs-2">Declarations</div>
			<div class="col-xs-5">
				<%! String dec1 =  "Declaration 1"; %>
				<%! String dec2 =  "Declaration 2"; %>
				<jsp:scriptlet>
					out.print("Dec1: " + dec1);
				</jsp:scriptlet>
				<br>
				<%= "Dec2: " + dec2 %>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">Expressions</div>
			<div class="col-xs-5">
				<%= "Todays Date: " + new java.util.Date() %>
				<br>
				<jsp:expression>
					"Another Expression"
				</jsp:expression>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">Comments</div>
			<div class="col-xs-5">
				Uncommented:
				<%-- JSP Comment --%>
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">Directives</div>
			<div class="col-xs-5">
				Include: <%@ include file="../simpleTestPage.jsp" %>
				<br>
				taglib: <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				page: 
				import: <%@ page import="java.util.Map" %>
				<br>
				Other Page attributes:
				<br>
				buffer, autoFlush, contentType, errorPage, isErrorPage, extends, info
				<br>
				isThreadSafe, language, session, isELIgnored, isScriptingEnabled
			</div>
		</div>

		<div class='row'>
			<div class="col-xs-2">Actions</div>
			<div class="col-xs-5">
			</div>
		</div>
		
		
		
	</div>
</body>
</html>
