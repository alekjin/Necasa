<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>photo list</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/list.css">
	<style>
	</style>
	<script>
		function init() {
			insertCommentsCount();
			registerEvents();
		}

		function registerEvents() {
			console.log("register Events OK");
			var eleList = document.getElementsByClassName('toggleComment');
			for (var i = 0 ; i < eleList.length ; i++) eleList[i].addEventListener('click', toggleComments, false);

			var formList = document.querySelectorAll('.commentWrite input');
			for (var j = 0 ; j < formList.length ; j++) formList[j].addEventListener('click', writeComment, false);

			document.querySelector(".photowrap").querySelector("button").addEventListener('click', writeArticle, false);
		}

		function toggleComments(e) {
			console.log("toggle");
			var node = e.target.parentNode.parentNode.querySelector('.commentswrap');
			if (node.style.display == 'none')
				node.style.display='block';
			else
				node.style.display='none';

			e.returnValue = false;
		}

		function writeComment(e) {
			e.preventDefault();

			var eleForm = e.currentTarget.form;
			var oFormData = new FormData(eleForm);

			var sID = eleForm[0].value;
			var url = "/board/" + sID + "/comments.json";

			var request = new XMLHttpRequest();
			request.open("POST", url, true);

			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var obj = JSON.parse(request.responseText);
					var eleCommentList = eleForm.parentNode.parentNode;
					eleCommentList.insertAdjacentHTML("beforeend" , "<div class='commentwrap'><p>" + obj.userid + " : " + obj.comment + "</p></div><hr/>" );
					console.log(obj);
					console.log("응답이 왔어요.");

					var cmtNumNode = eleCommentList.querySelector(".comment_number");

					var cmtTotalNum = parseInt(cmtNumNode.innerHTML.split(" ")[2]);
					cmtNumNode.innerHTML =  "Comments : " + (cmtTotalNum+1);
				};
			}
			request.send(oFormData);
		}

		function writeArticle(e) {
			e.preventDefault();

			var eleForm = e.currentTarget.form;
			var oFormData = new FormData(eleForm);

			var url = "/board/photo.json";

			var request = new XMLHttpRequest();
			request.open("POST", url, true);

			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var obj = JSON.parse(request.responseText);
					var nextPhoto = eleForm.parentNode.parentNode.childNodes;
					nextPhoto[5].insertAdjacentHTML("beforebegin" ,"<div class='photowrap'>" +
																"<a href='/board/view/" + obj.id + ".opo'> <img src='/images/" + obj.filename + "' width='400px' /><br /></a>" +
																"<br /><p><h1>" + obj.title + "</h1></p><br />" +
																"<div class='contentswrap'><p>" + obj.contents + "</p></div><br />" +
																"<div class='toggleComment'><a href='#'>Show Comment!</a></div><div class='commentswrap' style='display: none;'>" +
																"</div><br />");

					console.log(obj);
					console.log("응답이 왔어요.");
				};
			}
			request.send(oFormData);
		}

		function moveToUpload() {
			window.location = "/board/upload.opo";
		}

		function countComments() {
			commentsList = document.querySelectorAll('.commentswrap');
			for (var i = 0 ; i < commentsList.length ; i++) {
				var currentNode = commentsList[i];
				var nCommentCount = currentNode.querySelectorAll('.commentwrap').length;
				return nCommentCount;
			}
		}


		function countComments() {
			commentsList = document.querySelectorAll('.commentswrap');
			for (var i = 0 ; i < commentsList.length ; i++) {
				var currentNode = commentsList[i];
				var nCommentCount = currentNode.querySelectorAll('.commentwrap').length;
				return nCommentCount;
			}
		}

		function insertCommentsCount() {
			var commentsList = document.querySelectorAll('.commentswrap');
			var Classes = document.getElementsByClassName("comment_number");

			for (var i = 0 ; i < commentsList.length ; i++) {
				var currentNode = commentsList[i];
				var nCommentCount = currentNode.querySelectorAll('.commentwrap').length;
				Classes[i].innerHTML = "Comments : " + nCommentCount;
			}
		}
		window.onload = init;
	</script>
</head>
<body>
<div class="bodywrap">
	<div class="photowrap">
		<form name="uploadphoto" action="#" method="POST" enctype="multipart/form-data" accept="image/gif, image/jpeg, image/png">

			<label id="choose_upload"><strong>업로드할 사진을 고르세요</strong></label> <br />
			<input name="file" type="file"> <br />
			<input name="title" type="text" placeholder="이 사진의 이름을 지어주세요."> <br />
			<textarea name="contents" rows="4" cols="40" placeholder="이 사진에 대한 코멘트를 입력하세요."></textarea> <br />
			<input name="tags" placeholder="이 사진의 태그를 정해주세요"> <br />

			<button name="upload">업로드</button>

		</form>
	</div>
	<br />
	<c:forEach items="${photos}" var="photo">
	<div class="photowrap">
	<a href="/board/view/${photo.id}.opo"> <img src="/images/${photo.filename}" width="400px" /><br /></a>
	<br />
	<p><h1>${photo.title}</h1></p>
	<br />
		<div class="contentswrap">
		<p>${photo.contents}</p>
		</div>
		<br />
			<div class="toggleComment">
			<a href="#">Show Comment!</a>
			</div>
			<div class="commentswrap" style="display: none;">
				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<div class="comment_write">
							<form class="commentWrite" action="/board/view/${photo.id}/comment" method="post">
								<input type="hidden" name="Id" value="${photo.id}">
								<p>Comment : </p>
								<p><textarea name="comment"></textarea></p>
								<p><input type="submit"> </p>
							</form>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<br />

				<div class="comment_number">
				</div>
				<c:forEach items="${photo.comments}" var="comment">
					<div class="commentwrap">
						<p>${comment.userid} : ${comment.comment}</p>
					</div>
						<hr/>
				</c:forEach>
			</div>
	</div>
	<br />
	</c:forEach>
	<button onclick="moveToUpload()">새글쓰기</button>
	<script>
		registerEvents();
		insertCommentsCount();
	</script>
</div>
</body>
</html>