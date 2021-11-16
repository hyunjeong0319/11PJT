<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<style>
	  body {
            padding-top : 50px;
        }
    </style>


<script type="text/javascript">


//===========================================//
function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		
		
 $(function() {
	 
	//==> �˻� Event ����ó���κ�
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)s
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
	 $( "btn btn-default:contains('�˻�')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
		/* $("#currentPage").val(1);
		$('input[name="menu"]').val('${menu}'); 
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit(); */

	});
	
	 $(function() {
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(1)" ).on("click" , function() {
				var text =$(this).children().children().next().text();
				console.log(text);
				 self.location ="/product/getProduct?prodNo="+text;
			});
	
			$( "td:nth-child(1)" ).css("color" , "blue");
			
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			//$(".ct_list_pop:nth-child(2)" ).css("background-color" , "whitesmoke");
			
		 });	
	
	$(".prodName").on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					var text = $(this).text();
					console.log(text);
					var prodNo = $(this).next().text();
					console.log(prodNo);

					//self.location='/product/updateProductView?prodNo='+prodNo;
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {

										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);
										
										var displayValue = "<h6>"
																	+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
																	+"��ǰ�� : "+JSONData.prodName+"<br/>"
																	+"��ǰ�̹���: "+JSONData.fileName+"<br/>"
																	+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
																	+"</h6>";
										//Debug...									
										//alert(displayValue);
										$("h6").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});

					
/* 					if('${menu}'=='search'){
					//self.location='/product/getProduct?prodNo='+prodNo;
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										console.log(JSONData);
										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);
										
										var displayValue = "<h3>"
																	+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
																	+"��ǰ�� : "+JSONData.prodName+"<br/>"
																	+"��ǰ�̹���: "+JSONData.fileName+"<br/>"
																	+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
																	+"</h3>";
										//Debug...									
										//alert(displayValue);
										$("h3").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});

					}	 */
					
	});
	


});
 
</script>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-info">
		
<%-- 		<c:if test = "${menu eq 'manage'}">
		 <h3>��ǰ����</h3>
		</c:if>
		<c:if test = "${menu eq 'search'}">
		 <h3>��ǰ�˻�</h3>
		</c:if> --%>
	       <h3>�� ǰ �� �� �� ȸ</h3>
	    </div>
	     <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		     <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
					
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
		    
</div>
	    
</div>
  <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�������</th>
            <th align="left">�������</th>
          </tr>
        </thead>
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">
			  <div>
			  		<span>${i}</span>
			  		<span id ="prodNo" hidden ="">${product.prodNo}</span>
			  </div>
			  </td>
			  <td align="left">
			  <div>
					<span class="prodName">${product.prodName}</span>
					<span hidden="">${product.prodNo}</span>
				</div>
			   </td>
			  <td align="left">${product.price}	</td>
			  <td align="left">${product.manuDate}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id = "${product.prodNo}"></i>
			  	<input type ="hidden" value ="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
        </table>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
</div>
</body>
</html>
