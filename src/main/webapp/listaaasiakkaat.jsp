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
    border: 3px solid #BLACK ;
      background-color: GRAY;
    padding: 8px
  }
  
</style>
</head>
<body>

<table id= "listaus" >

<thead>
<tr>
			<th class="oikealle">Hakusana:</th>
			<th colspan="3"><input type="text" id="hakusana"></th>
			<th><input type="button" value="hae" id="hakunappi" class="hakunappi"></th>
		</tr>			
	
	<tr>
		<th>Asiakasnumero</th>
	<th>Etunimi</th>
	<th>Sukunimi</th>
	
	<th>Puhelin</th>
	<th>Sähköposti</th>
	</tr>
	</thead>
	<tbody></tbody>
	

</table>

<script>
$(document).ready(function(){
	
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
        	htmlStr+="<td>"+field.enimi+"</td>";
        	htmlStr+="<td>"+field.snimi+"</td>";
         	htmlStr+="<td>"+field.sposti+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
	
	
}
</script>

</body>
</html>