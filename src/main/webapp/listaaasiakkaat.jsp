<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
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
	color: white;
	text-decoration: underline;
	cursor: pointer;	
}
.uusiAsiakas, #takaisin{
	color: white;	
	cursor: pointer;	
}
  
</style>
</head>
<body>

<table id= "listaus" >

<thead>
<tr>
			
			
			<th class="oikealle">Hakusana:</th>
			<th colspan="2"><input type="text" id="hakusana"></th>
			<th><input type="button" value="hae" id="hakunappi" class="hakunappi"></th>
			<th colspan = "1" class="oikealle"> <span id="UusiAsiakas" ><a href= "lisaaasiakas.jsp">Lisää uusi asiakas </a></span></th>
		</tr>			
	
	<tr>
	
	<th>Etunimi</th>
	<th>Sukunimi</th>
	
	<th>Puhelin</th>
	<th>Sähköposti</th>
	<th>Poista asiakas</th>
	
	</tr>
	</thead>
	<tbody></tbody>
	

</table>

<script>
$(document).ready(function(){
	
	$("#uusiAsiakas").click(function(){		
		document.location = "lisaaasiakas.jsp";
	});

	
	haeAsiakkaat();
	$("#hakunappi").click(function(){		
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		  if(event.which==13){ //Enteriä painettu, ajetaan haku
			  haeAsiakkaat();
		  }
	});
	$("#hakusana").focus();//viedään kursori hakusana-kenttään sivun latauksen yhteydessä
});	

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){//Funktio palauttaa tiedot json-objektina		
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
         	htmlStr+="<td>"+field.sposti+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td><span class='poista' onclick=poista('"+field.etunimi+"')>Poista</span></td>";
        	htmlStr+="</tr>";
        
        	
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
	
	
}

function poista (etunimi){
if (confirm ("Poista asiakas " + etunimi + "?")){
	
	$.ajax({url:"asiakkaat/"+asiakas_id, type:"DELETE", dataType:"json", success:function(result) { //result on joko {"response:1"} tai {"response:0"}
        if(result.response==0){
        	$("#ilmo").html("Asiakkaan poisto epäonnistui.");
        }else if(result.response==1){
        	$("#rivi_"+rekno).css("background-color", "red"); //Värjätään poistetun asiakkaan rivi
        	alert("Asiakkaan" + etunimi+ sukunimi +" poisto onnistui.");
			haeAsiakkaat();        	
		}
    }});
}
}
</script>

</body>
</html>
