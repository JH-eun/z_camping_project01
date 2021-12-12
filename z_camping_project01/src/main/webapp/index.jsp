<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../header.jsp"%>

<!-- main image -->
<script><!--슬라이드쇼-->
      var image1=new Image();
      image1.src="images/img_camp1.jpeg";
      var image2=new Image();
      image2.src="images/img_camp2.jpeg";
      var image3=new Image();
      image3.src="images/img_camp3.jpeg";
      var image4=new Image();
      image4.src="images/img_camp4.jpeg";
      var image5=new Image();
      image5.src="images/img_camp5.jpeg";
      
</script>

<div class="clear"></div>

<div id="main_img">
	<img src="images/img_camp1.jpeg" name="slide" style="width:728px;height:470px">
</div>

<script>/*slideshow*/
        var step=1;
        function slideit(){
          document.images.slide.src=eval("image"+step+".src");
          if(step<5){
            step++
          }else{
            step=1;
          }
          setTimeout("slideit()",3000);
        }
        slideit(); 
</script>


<div class="clear"></div>


<!-- footer -->
<%@ include file="../footer.jsp"%>
