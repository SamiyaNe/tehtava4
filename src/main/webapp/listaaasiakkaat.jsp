<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Asiakaslista</title>
<style>
.oikealle{
	text-align: right;
}

.hakunappi{
 background-color: gray;
   color: white;
   padding: 15px 32px;
   text-align: center;
   font-size: 16px;

   transition-duration: 0.2s;
   margin-left: auto; /*margin ja display sijoittaa painikkeen keskelle*/
   margin-right: auto;
   display: block;
}
.hakunappi:active {
color: black;
   background-color:pink ; }
 
  .body td, #listaus th {

      background-color:pink;

    border: 1px solid GRAY;
    padding: 6px;
 
  }
  
  .table, #listaus tbody{
    padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: lightgrey;
  color: black;
  }
  .poista{
	color: red;
	text-decoration: underline;
	cursor: pointer;	
}
.uusiAsiakas, #takaisin{
	color: white;	
	cursor: pointer;	
}

#rivi_ {
background-color: red;
}
  
</style>
</head>
<body>
<form action="haeasiakkaat" method="get">
	<table id="listaus">
		<thead>	
			<tr>
				<th class="oikealle" colspan="5"><a href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
			</tr>	
			<tr>
				<th class="oikealle">Hakusana:</th>
				<th colspan="3"><input type="text" name="hakusana" id="hakusana" value="${param['hakusana']}"></th>
				<th><input type="submit" value="hae" id="hakunappi"></th>
			</tr>			
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sähköposti</th>
				<th></th>							
			</tr>
		</thead>
	<tbody>
			<c:forEach items="${asiakkaat}" var="listItem">
				<tr>
			        <td>${listItem.etunimi}</td>
			        <td>${listItem.sukunimi}</td>
			        <td>${listItem.puhelin}</td>
			        <td>${listItem.sposti}</td>
			        <td>
			        	<a href="muutaasiakas?asiakas_id=${listItem.asiakas_id}" class="muuta">muuta</a>
			        	<a onclick="varmista('${listItem.asiakas_id}')" class="poista">poista</a>			        	
			        </td>
		        </tr>
		    </c:forEach>		
		</tbody>
	

	</table>
</form>
<script>
function varmista(asiakas_id){
	if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakas_id+ "?")){
		document.location="poistaasiakas?asiakas_id=" + asiakas_id;
	}
}	
</script>
</body>
</html>