<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>

<title>Lis�� asiakas</title>
<style >

  .table, #tiedot tbody{
    padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: lightgrey;
  color: black;
  }
table td, table th {
  border: 1px solid #ddd;
  padding: 8px;  
}


</style>
</head>
<body>
<form id="tiedot" action="lisaaasiakas" method="post">
	<table>
		<thead>	
			<tr>
				<th colspan="5" class="oikealle"><a href="listaaasiakkaat.jsp">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
			
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="button" id="tallenna" value="Lis��" onclick="tarkasta()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
function tarkasta(){
	
	if(document.getElementById("etunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Nimi on liian lyhyt";
		return;
	}else if(document.getElementById("sukunimi").value.length<1){
		document.getElementById("ilmo").innerHTML="Sukunimi on liian lyhyt";
		return;
	}else if(document.getElementById("puhelin").value.length<5){
		document.getElementById("ilmo").innerHTML="Numero on liian lyhyt";
		return;
	}else if(document.getElementById("sposti").value.length<4) {
		document.getElementById("ilmo").innerHTML="S�hk�posti on liian lyhyt";
		return;
	}
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	document.forms["tiedot"].submit();
}

function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}
</script>
</html>