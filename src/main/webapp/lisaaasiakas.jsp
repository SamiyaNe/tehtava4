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
<body onkeydown="tutkiKey(event)">
<form id="tiedot">
	<table>
		<thead>	
			<tr>
				<th colspan="3" id="ilmo"></th>
				<th colspan="2" class="oikealle"><a href="listaaasiakkaat.jsp" id="takaisin">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S�hk�posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="button" name="nappi" id="tallenna" value="Lis��" onclick="lisaaTiedot()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
function tutkiKey(event){
	if(event.keyCode==13){//Enter
		lisaaTiedot();
	}
	
}

document.getElementById("etunimi").focus();//vied��n kursori rekno-kentt��n sivun latauksen yhteydess�

//funktio tietojen lis��mist� varten. Kutsutaan backin POST-metodia ja v�litet��n kutsun mukana uudet tiedot json-stringin�.
//POST /autot/
function lisaaTiedot(){	
	var ilmo="";
	
	if(document.getElementById("etunimi").value.length<2){
		ilmo="Nimi on liian lyhyt";		
	}else if(document.getElementById("sukunimi").value.length<2){
		ilmo="Sukunimi on liian lyhyt";		
		
	}else if(document.getElementById("puhelin").value.length<5){
		ilmo="Numero on liian lyhyt";		
	}
	else if(document.getElementById("sposti").value.length<4){
		ilmo="Osoite liian lyhyt";	
	}
	if(ilmo!=""){
		document.getElementById("ilmo").innerHTML=ilmo;
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
		return;
	}
	document.getElementById("etunimi").value;
	document.getElementById("sukunimi").value;
	document.getElementById("puhelin").value;
	document.getElementById("sposti").value;	
		
	
		
	var formJsonStr=formDataToJSON(document.getElementById("tiedot")); //muutetaan lomakkeen tiedot json-stringiksi
	//L�het��n uudet tiedot backendiin
	fetch("asiakkaat",{//L�hetet��n kutsu backendiin
	      method: 'POST',
	      body:formJsonStr
	    })
	.then( function (response) {//Odotetaan vastausta ja muutetaan JSON-vastaus objektiksi		
		return response.json()
	})
	.then( function (responseJson) {//Otetaan vastaan objekti responseJson-parametriss�	
		var vastaus = responseJson.response;		
		if(vastaus==0){
			document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen ep�onnistui";
      	}else if(vastaus==1){	        	
      		document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen onnistui";			      	
		}
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
	});	
	document.getElementById("tiedot").reset(); //tyhjennet��n tiedot -lomake
}
</script>
</html>