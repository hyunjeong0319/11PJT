<%@ page contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<meta charset="EUC-KR">
   
   <!-- 참조 : http://getbootstrap.com/css/   참조 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
   
      body > div.container{
      	   border: 3px solid #D6CDB7;
	 	   padding-top : 40px;
	 }
    </style>
    
   <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
   function fncAddProduct(){
	   
		//Form 유효성 검증
	 	var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
	}
 
   function resetData(){
      document.detailForm.reset();
   }
   
   
   $(function() {     
      
      $( "#manuDate" ).datepicker({
          dateFormat: "yy-mm-dd",
          showOn: "button",
          buttonImage: "../images/ct_icon_date.gif",
          buttonImageOnly: true,
          buttonText: "제조일자를 선택하세요."
      });
       
   });
   
   $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button:contains('등록')" ).on("click" , function() {
			//Debug..
			 //alert(  $( "td.ct_btn01:contains('확인'')" ).html() );
			 //self.location ="/product/listProduct?menu=manage";
			 fncAddProduct();
		});
		
	});	
   
   $(function() {      
	   $( "button:contains('취소')" ).on("click" , function() {
       $("form")[0].reset();
   		}) ;
    });	

</script>
</head>

<body>
   
   <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
   
   <!--  화면구성 div Start /////////////////////////////////////-->
   <div class="container">
   
      <div class="page-header text-center">
          <h3 class=" text-info">상품등록</h3>
       </div>
   
   <!-- form Start /////////////////////////////////////-->
   <form class="form-horizontal">
   
      <div class="form-group">
          <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
          </div>
      </div>
      
      <div class="form-group">
          <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
          </div>
      </div>
      
      <div class="form-group">
          <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
          </div>
      </div>
      
      <div class="form-group">
          <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
          <div class="col-sm-2" >
            <input type="text" class="form-control" id="price" name="price" placeholder="가격">
          </div>
      </div>
      
      <div class="form-group">
          <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
          <div class="col-sm-4" >
            <input type="text" class="form-control" id="fileName" name="fileName" placeholder="상품이미지">
          </div>
      </div>
      
      <div class="form-group">
          <div class="col-sm-offset-4  col-sm-4 text-center">
            <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class ="btn btn-primary" href="#">취소</button>
          </div>
      </div>
   </form>

</body>
</html>