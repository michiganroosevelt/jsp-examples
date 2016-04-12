<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../views/template/header.jsp" />

<body>
	<jsp:include page="../../views/template/nav.jsp" />

	<%
		Date someDate = new Date("2001/12/16");
	%>

	<c:set var="failedDate" scope="session">
		new Date("2016/1/1");
	</c:set>

	<sql:setDataSource var="snapshot" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/dvdrental" user="postgres"
		password="welcome" />

	<sql:update dataSource="${snapshot}" var="count">
	  DELETE FROM customer WHERE first_name = ? and last_name = ?;
	  <sql:param value="bob" />
		<sql:param value="dole" />
	</sql:update>

	<sql:update dataSource="${snapshot}">
	   INSERT INTO public.customer( 	
	   		store_id, 
	   		first_name, 
	   		last_name, 
	   		email, 
	   		address_id,
	   		create_date,
	   		active
	   	) VALUES ( 
	   		1, 
	   		'bob', 
	   		'dole', 
	   		'bob.dole@fake.com', 
	   		5,
	   		?,
	   		1
	   	);
		<sql:dateParam value="${anotherDate}" type="DATE" />
	</sql:update>

	<sql:transaction dataSource="${snapshot}">
		<sql:update>
	  DELETE FROM customer WHERE first_name = ? and last_name = ?;
	  <sql:param value="bob" />
			<sql:param value="marley" />
		</sql:update>
		<sql:update>
	   INSERT INTO public.customer( 	
	   		store_id, 
	   		first_name, 
	   		last_name, 
	   		email, 
	   		address_id,
	   		active
	   	) VALUES ( 
	   		1, 
	   		'bob', 
	   		'marley', 
	   		'bob.marley@fake.com', 
	   		5,
	   		1
	   	);
	</sql:update>
	</sql:transaction>

	<sql:query dataSource="${snapshot}" var="result" maxRows="5" startRow="0">
		SELECT * FROM customer order by customer_id desc;
	</sql:query>

	<div class="container">
		<div class="starter-template">
			<h1>JSTL Sql Example Page</h1>
			<p class="lead"></p>
		</div>

		<div class='row'>
			<div class="col-xs-2">sql:query example:</div>
			<div class="col-xs-5">
				<c:forEach var="row" varStatus="counter" items="${result.rows}">
					<c:out value="${row.first_name}" />
					<c:out value="${row.last_name}" />
					<c:out value="${row.customer_id}" />
					<br>
				</c:forEach>
			</div>
		</div>


	</div>

</body>
</html>
