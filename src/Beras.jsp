<%
	int jumlahberas = 0;
	if (session.getAttribute("jumlahberas")!=null){
	}else{
		response.sendRedirect("getberas");
	}
	
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Beras</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	<script language="javascript" type="text/javascript">
	function AddToCart(IdBarang){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				alert("Pesanan sedang diproses");
				if (xmlhttp.responseText.trim()=="Betul"){
					alert("Pesanan Diterima");}
				else{
					alert("Jumlah Barang : "+xmlhttp.responseText);}
			}
		}
		var JumlahStr=""+IdBarang;
		var Jumlah=document.getElementById(JumlahStr).value;
		alert("AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori=Beras");
		xmlhttp.open("GET","AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori=Beras",true);
		xmlhttp.send();
	}
	</script>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		
		<!-- Navbar Section -->
		<p id="bbuy-a"> Products in "Beras" Category</p>
		<form method=post action="getberas">
			<select name="sort">
				<option value = "urutkan">--urutkan--</option>
				<option value = "namabarang">nama</option>
				<option value = "harga">harga</option>
			</select>
			<input type=submit value="OK">
		</form>

		<!-- End of Navbar -->
		
		<div id="dagangan">
			
			<!-- Dagangan Baris 1 -->
			<div class="frame">
			
			<%String str ="";
			int test = (Integer)session.getAttribute("jumlahberas");
			if (test>Integer.parseInt(request.getParameter("l"))){
				test = Integer.parseInt(request.getParameter("l"));
			}
			for (int i =Integer.parseInt(request.getParameter("f"));i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("bnama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("bnama"+i)%>"><%str =(String)session.getAttribute("bnama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("bharga"+i);out.print(intr);%> /kg</p>
							
							<div class="frame buy-bar">
								<input class="kolom-9 buy-box" type="text" id='<%str =(String)session.getAttribute("bnama"+i);out.print(str);%>' name="buy" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
								<!--<button class="kolom-1 buy-button" type="button" onClick=AddToCart(<//%=(String)session.getAttribute("bid"+i)%>)></button>-->
							</div>
							
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			<!--End of Dagangan-->				
		</div>
		
		<div id="pagination">
			<ul>
				<%String n = ""+(Integer.parseInt(request.getParameter("f")));
				  String m = ""+(Integer.parseInt(request.getParameter("l")));
				  String o = ""+(Integer.parseInt(request.getParameter("f")));
				  String p = ""+(Integer.parseInt(request.getParameter("l")));
				  if (Integer.parseInt(request.getParameter("f"))>10){
					  o = ""+(Integer.parseInt(request.getParameter("f"))-10);
					  p = ""+(Integer.parseInt(request.getParameter("l"))-10);
				   %>
					   
				 <% }
				 if (Integer.parseInt(request.getParameter("l"))<(Integer)session.getAttribute("jumlahberas")){
					   n = ""+(Integer.parseInt(request.getParameter("f"))+10);
					   m = ""+(Integer.parseInt(request.getParameter("l"))+10);
				  %>
				  	
				 <% }%>
				 <li><a href="Beras.jsp?f=<%out.print(o);%>&l=<%out.print(p);%>">&laquo;Previous</a></li>
				 <li><a href="Beras.jsp?f=<%out.print(n);%>&l=<%out.print(m);%>">Next&raquo;</a></li>
				
				
			
			</ul>
		</div>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>