<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

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
<form id="tiedot">
	<table>
		<thead>	
			<tr>
				<th colspan="5" class="oikealle"  style= "background-color:lightgrey;">
				<span ><a href= "listaaasiakkaat.jsp">Takaisin listaukseen </a></span></th>
				
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
			
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="submit" id="tallenna" value="Lis��"></td>
			
			
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
	$("#tiedot").validate({						
		rules: {
			etunimi:  {
				required: true,
				minlength: 2				
			},	
			sukunimi:  {
				required: true,
				minlength: 2				
			},
			puhelin:  {
				required: true,
				minlength: 5
			},	
			sposti:  {
				required: true,
				minlength: 4
			}	
		},
		messages: {
			etunimi: {     
				required: "Etunime� ei annettu",
				minlength: "Liian lyhyt"			
			},
			sukunimi: {
				required: "Sukunime� ei annettu",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Puhelinnumeroa ei annettu",
				minlength: "Liian lyhyt"
			},
			sposti: {
				required: "S�hk�postia ei annettu",
			
				minlength: "Liian lyhyt"
			
			}
		},			
		submitHandler: function(form) {	
			lisaaTiedot();
		}		
	}); 	
});
//funktio tietojen lis��mist� varten. Kutsutaan backin POST-metodia ja v�litet��n kutsun mukana uudet tiedot json-stringin�.
//POST /autot/
function lisaaTiedot(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); //muutetaan lomakkeen tiedot json-stringiksi
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result) { //result on joko {"response:1"} tai {"response:0"}       
		if(result.response==0){
      	$("#ilmo").html("asiakkaan lis��minen ep�onnistui.");
      }else if(result.response==1){			
      	$("#ilmo").html("Asiakkaan lis��minen onnistui.");
      	$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
  }});	
}
</script>
</html>