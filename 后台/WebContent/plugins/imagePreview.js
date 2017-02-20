function preview(file,preview,imghead,width,height){
	//if($.browser.msie){
				//参数 是否是IE，div的id，img的id，宽, 高
		//previewImage(true,file,preview,imghead,width,height);
//}else{
				//参数 是否是IE，div的id，img的id，高,宽 
		previewImage(false,file,preview,imghead,width,height);
	//}
}

function clacImgZoomParam( maxWidth, maxHeight, width, height ){
	    var param = {top:0, left:0, width:width, height:height};
	    if( width>maxWidth || height>maxHeight )
	    {
	        rateWidth = width / maxWidth;
	        rateHeight = height / maxHeight;
	        
	        if( rateWidth > rateHeight )
	        {
	            param.width =  maxWidth;
	            param.height = Math.round(height / rateWidth);
	        }else
	        {
	            param.width = Math.round(width / rateHeight);
	            param.height = maxHeight;
	        }
	    }
	    
	    param.left = Math.round((maxWidth - param.width) / 2);
	    param.top = Math.round((maxHeight - param.height) / 2);
	    return param;
	}
	
	
function previewImage(isIE,file,preview,imghead,width,height)
	{
	  var MAXWIDTH  = width;
	  var MAXHEIGHT = height;
	  var div = document.getElementById(preview);
	  
	  if(isIE){
	   //IE预览使用滤镜
					// var docObj=document.getElementById(file);
 					 var imgObjPreview=document.getElementById(imghead);
 					   file.select();
                      // docObj.blur();
                        var imgSrc = document.selection.createRange().text;
                        var localImagId = document.getElementById(preview);
                        //必须设置高宽
                        localImagId.style.width = width+"px";
                        localImagId.style.height = height+"px";
//                        //å¾çå¼å¸¸çææï¼é²æ­¢ç¨æ·ä¿®æ¹åç¼æ¥ä¼ªé å¾ç
                        localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                        localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                        imgObjPreview.style.display = 'none';
                        document.selection.empty();
                        
	  }else if (file.files && file.files[0])
	  {
	  	//其他浏览器
	      div.innerHTML = '<img id='+imghead+'>';
	      var img = document.getElementById(imghead);
	      img.onload = function(){
	        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	        img.width = width;
	        img.height = height;
	        
	      }
	      var reader = new FileReader();
	      reader.onload = function(evt){img.src = evt.target.result;}
	      reader.readAsDataURL(file.files[0]);
	  }
	  else
	  {
	    var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
	    file.select();
	    var src = document.selection.createRange().text;
	    div.innerHTML = '<img id='+imghead+'>';
	    var img = document.getElementById(imghead);
	    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
	    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	    status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
	    div.innerHTML = "<div id=\"divhead\" style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";
	  }
	  
	}