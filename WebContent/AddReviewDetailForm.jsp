<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddReviewDetailForm.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>
<style type="text/css">
	.center
	{
		margin:0 auto;
		text-align: center;
	}
	#center
	{
		margin:0 auto;
		text-align: center;
	}
    .reviewleft
	{
		margin-left: 200px;
	}
	#content 
	{
	    position: absolute;
	    left: 50%;
	    transform: translate(-50%);
	    width: 460px;
	}
	h3 
	{
	    margin: 10px 0 4px;
	    font-size: 14px;
	    font-weight: 700;
	}
	.box 
	{
	    display: block;
	    width: 100%;
	    height: 40px;
	    border: solid 1px #dadada;
	    padding: 10px 14px 10px 14px;
	    box-sizing: border-box;
	    background: #fff;
	    position: relative;
	}
	.int 
	{
	    display: block;
	    position: relative;
	    width: 100%;
	    height: 20px;
	    border: none;
	    background: #fff;
	    font-size: 18px;
	}
	.error_next_box 
	{
	    margin-top: 9px;
	    font-size: 12px;
	    color: red;    
	    display: none;
	}

	#alertTxt 
	{
	    position: absolute;
	    top: 19px;
	    right: 38px;
	    font-size: 12px;
	    color: red;
	    display: none;
	}
	select 
	{
	    width: 100%;
	    height: 29px;
	    font-size: 15px;
	    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
	    background-size: 20px 8px;
	    -webkit-appearance: none;
	    display: inline-block;
	    text-align: start;
	    border: none;
	    cursor: default;
	    font-family: Dotum,'돋움',Helvetica,sans-serif;
	}
	.box.int_id 
	{
    	padding-right: 110px;
	}
	#reviewdetail
	{
		display: block;
	    width: 100%;
	    height: 200px;
	    border: solid 1px #dadada;
	    padding: 10px 14px 10px 14px;
	    box-sizing: border-box;
	    background: #fff;
	    position: relative;
	}
	.imagePreview 
	{
		width: 200px;
		height: 200px;
	  	background-position: center center;
	  	background-size: cover;
	  	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	  	display: inline-block;
	}
	
</style>
<script type="text/javascript">

   // 추가한 제이쿼리 플러그인의 콜백함수 호출
   $(function()
   {
      $('#rating').barrating({
        theme: 'fontawesome-stars'
      });
   });
   
</script>
<script type="text/javascript">
	
	// 사진 업로드 버튼 클릭시 파일 업로드할 수 있도록 구현
	const browseBtn = document.querySelector('.browse-btn');
	const realInput = document.querySelector('#real-input');
	
	browseBtn.addEventListener('click',()=>{
		realInput.click();
	});
	
	function readInputFile(e){
	    var sel_files = [];
	    
	    sel_files = [];
	    $('#imagePreview').empty();
	    
	    var files = e.target.files;
	    var fileArr = Array.prototype.slice.call(files);
	    var index = 0;
	    
	    fileArr.forEach(function(f){
	    	if(!f.type.match("image/.*")){
	        	alert("이미지 확장자만 업로드 가능합니다.");
	            return;
	        };
	        if(files.length < 11){
	        	sel_files.push(f);
	            var reader = new FileReader();
	            reader.onload = function(e){
	            	var html = `<a id=img_id_${index}><img src=${e.target.result} data-file=${f.name} /></a>`;
	                $('imagePreview').append(html);
	                index++;
	            };
	            reader.readAsDataURL(f);
	        }
	    })
	    if(files.length > 11){
	    	alert("최대 10장까지 업로드 할 수 있습니다.");
	    }
	}

	$('#real-input').on('change',readInputFile);
	
</script>
<script type="text/javascript">

	var sel_file;
	
	$(document).ready(function()
	{
		$("#input.img").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e)
	{
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f)
		{
			if(!f.type.match("image.*"))
			{
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e)
			{
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

</script>
<script type="text/javascript">

	// 사진 업로드
	$(function() {
    $("#uploadFile").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
 
            reader.onloadend = function(){ 
             $('.imagePreview').css("background-image", "url("+this.result+")"); 
            };
        }
    });
});

</script>
</head>
<body>

<div id="textbox">
	<h5><img src="<%=cp%>/images/addReviewIcon.PNG" width="20px" height="20px">리뷰 추가하기</h5>
	<hr>
</div>
<br><br>
<form action="" method="post" id="">
	<div id="content">
		<!-- 첨부 사진 미리보기 -->
		<div class="imagePreview"></div>
		<!-- 선택한 사진 이름 보기 -->
		<input type="file" id="uploadFile" name="image" class="img" accept="img/*"/>

		<!-- 공연에 대한 별점 주기 -->
		<div>
			<h3>
				<label for="reviewrating">공연 평점</label>
			</h3>
			<select id="rating">
				<option value="1">1</option>
			  	<option value="2">2</option>
			  	<option value="3">3</option>
			  	<option value="4">4</option>
			  	<option value="5">5</option>
			</select>
		</div>
		<!-- 공연 리뷰 입력 폼 -->
		<div>
			<h3>
				<label for="reviewtitle">제목</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="reviewtitle" class="int" maxlength="50">
			</span>
			<span class="error_next_box">제목을 입력해주세요.</span>
		</div>
		<div>
			<h3>
				<label for="playname">공연명</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="playname" class="int" value="" readonly="readyonly">
			</span>
		</div>
		<div>
			<h3>
				<label for="date">공연 날짜</label>
			</h3>
			<span class="box int_id">
				달력제이쿼리...value로 넘어오는 값 받고.
			</span>
			<span class="error_next_box">공연 날짜를 선택해주세요.</span>
		</div>
		<div>
			<h3>
				<label for="starttime">공연 시간</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="starttime" class="int">
			</span>
		</div>
		<div>
			<h3>
				<label for="place">공연 장소</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="place" class="int" value="" readonly="readyonly">
			</span>
		</div>
		<div>
			<h3>
				<label for="cast">출연진</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="cast" class="int" value="">
			</span>
		</div>
		<div>
			<h3>
				<label for="money">티켓 금액</label>
			</h3>
			<span class="box int_id">
				<input type="text" id="money" class="int">
			</span>
		</div>
		<div>
			<h3>
				<label for="companion">함께 본 사람</label>
			</h3>
			<span class="box int_id">
				셀렉트박스로 리스트 가져오기 (c:foreach)
			</span>
			<span class="error_next_box">함께 본 사람을 선택해주세요.</span>
		</div>
		<div>
			<h3>
				<label for="reviewdetail">공연 상세 리뷰</label>
			</h3>
			<textarea id="reviewdetail" cols="55" rows="10" style="resize: none;"></textarea>
		</div>
		<br>
		<div>
			<button type="submit" id="center" class="btn btn-primary">리뷰 작성 완료하기</button>
		</div>
	</div>
</form>
<br><br><br><br><br><br><br><br>

</body>
</html>