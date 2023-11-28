<%@page import="java.util.Random"%>
<%@ page import="java.util.*" %>
<%@ page import="com.SecureHealth.crypto.AES" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<title>Patient Upload File</title>


<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400);

.frame {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 400px;
  margin-top: -200px;
  margin-left: -200px;
  border-radius: 2px;
  box-shadow: 1px 2px 10px 0px rgba(0,0,0,0.3);
  background: #3A92AF;
  background: -webkit-linear-gradient(bottom left, #3A92AF 0%, #5CA05A 100%);
  background: -moz-linear-gradient(bottom left, #3A92AF 0%, #5CA05A 100%);
  background: -o-linear-gradient(bottom left, #3A92AF 0%, #5CA05A 100%);
  background: linear-gradient(to top right, #3A92AF 0%, #5CA05A 100%); 
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3A92AF', endColorstr='#5CA05A',GradientType=1 );
  color: #fff;
	font-family: 'Open Sans', Helvetica, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.center {
  position: absolute;
	width: 300px;
	height: 260px;
  top: 70px;
  left: 50px;
	background: #fff;
	box-shadow: 8px 10px 15px 0 rgba(0,0,0,0.2);
	border-radius: 3px;
}

.title {
	font-size: 16px;
	color: #676767;
	line-height: 50px;
	height: 50px;
	border-bottom: 1px solid #D8D8D8;
	text-align: center;
}

.dropzone {
	position: absolute;
	z-index: 1;
	box-sizing: border-box;
	display: table;
	table-layout: fixed;
	width: 100px;
	height: 80px;
	top: 86px;
	left: 100px;
	border: 1px dashed #A4A4A4;
	border-radius: 3px;
	text-align: center;
	overflow: hidden;
	
	&.is-dragover {
		border-color: #666;
		background: #eee;
	}
	
	.content {
		display: table-cell;
		vertical-align: middle;
	}
	
	.upload {
		margin: 6px 0 0 2px;
	}
	
	.filename {
		display: block;
		color: #676767;
		font-size: 14px;
		line-height: 18px;
	}
	
	.input {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		opacity: 0;
		margin-left:10px;
	}
	
}

.upload-btn {
	position: absolute;
	width: 140px;
	height: 40px;
	left: 80px;
	bottom: 24px;
	background: #6ECE3B;
	border-radius: 3px;
	text-align: center;
	line-height: 40px;
	font-size: 14px;
	box-shadow: 0 2px 0 0 #498C25;
	cursor: pointer;
	transition: all .2s ease-in-out;
	border:none;
	
	&:hover {
		box-shadow: 0 2px 0 0 #498C25, 0 2px 10px 0 #6ECE3B;
	}
}

.bar {
	position: absolute;
	z-index: 1;
	width: 300px;
	height: 3px;
	top: 49px;
	left: 0;
	background: #6ECE3B;
	transition: all 3s ease-out;
	transform: scaleX(0);
	transform-origin: 0 0;
	
	&.active {
		transform: scaleX(1) translate3d(0,0,0);
	}
}

.syncing {
	position: absolute;
	top: 109px;
	left: 134px;
	opacity: 0;
	
	&.active {
		animation: syncing 3.2s ease-in-out;
   
	}
}

.done {
	position: absolute;
	top: 112px;
	left: 132px;
	opacity: 0;
	
	&.active {
		animation: done .5s ease-in 3.2s;
		animation-fill-mode: both;
	}
}


@keyframes syncing {
	0% {
		transform: rotate(0deg);
	}
	10% {
		opacity: 1;
	}
	90% {
		opacity: 1;
	}
	100% {
		transform: rotate(360deg);
		opacity: 0;
	}
}

@keyframes done {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}

</style>
</head>
<body style="background: #00b09b;  /* fallback for old browsers */background: -webkit-linear-gradient(to right, #96c93d, #00b09b);  /* Chrome 10-25, Safari 5.1-6 */background: linear-gradient(to right, #96c93d, #00b09b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */"> 


<%
String patientlogin=session.getAttribute("patientlogin").toString();
session.setAttribute("patientlogin", patientlogin);

Random r = new Random();
String key="ABCDEF123456789";
char c=key.charAt(r.nextInt(key.length()));
char c1=key.charAt(r.nextInt(key.length()));
char c2=key.charAt(r.nextInt(key.length()));
char c3=key.charAt(r.nextInt(key.length()));
char c4=key.charAt(r.nextInt(key.length()));
char c5=key.charAt(r.nextInt(key.length()));
String secret = c+""+c1+""+c2+""+c3+""+c4+""+c5;
System.out.println("The Value of secret is " +secret);


//AES aes = new AES();
//String encryptKey = aes.encrypt99(secret);
//System.out.println("EncryptKey::"+encryp); 

%>



<c:if   test="${param.success==1}">

	
	</c:if>
<form action="PatientFileUploadServlet" method="post" enctype="multipart/form-data">
<div class="frame">
  <div class="center">
		<div class="bar"></div>
		<div class="title">Drop file to upload</div>
		<div class="dropzone">
			<div class="content">
				<img src="https://100dayscss.com/codepen/upload.svg" class="upload" style=" height: 45px; margin-top: 10px;">
				<span class="filename"></span>
				<input type="hidden" name="<%=secret%>" value="<%=secret%>" readonly>
				<!--  <input type="file" class="upload-input" name="filename" />-->
				 <input type="file" class="input" name="filename" style="margin-left:5px">
			</div>
		</div>
		<img src="https://100dayscss.com/codepen/syncing.svg" class="syncing" >
		<img src="https://100dayscss.com/codepen/checkmark.svg" class="done">
		<button type="submit" class="upload-btn" name="uploadbutton">Upload file</button>
  </div>
</div>
</form>

<script>
var droppedFiles = false;
var fileName = '';
var $dropzone = $('.dropzone');
var $button = $('.upload-btn');
var uploading = false;
var $syncing = $('.syncing');
var $done = $('.done');
var $bar = $('.bar');
var timeOut;

$dropzone.on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
	e.preventDefault();
	e.stopPropagation();
})
	.on('dragover dragenter', function() {
	$dropzone.addClass('is-dragover');
})
	.on('dragleave dragend drop', function() {
	$dropzone.removeClass('is-dragover');
})
	.on('drop', function(e) {
	droppedFiles = e.originalEvent.dataTransfer.files;
	fileName = droppedFiles[0]['name'];
	$('.filename').html(fileName);
	$('.dropzone .upload').hide();
});

$button.bind('click', function() {
	startUpload();
});

$("input:file").change(function (){
	fileName = $(this)[0].files[0].name;
	$('.filename').html(fileName);
	$('.dropzone .upload').hide();
});

function startUpload() {
	if (!uploading && fileName != '' ) {
		uploading = true;
		$button.html('Uploading...');
		$dropzone.fadeOut();
		$syncing.addClass('active');
		$done.addClass('active');
		$bar.addClass('active');
		timeoutID = window.setTimeout(showDone, 3200);
	}
}

function showDone() {
	$button.html('Done');
}


	
</script>

<script>

if(test=${param.success==1}){
			
			console.log("File Uploaded");
			swal("Success!", "File Uploaded!", "success");
			
			
		}

</script>
</body>
</html>