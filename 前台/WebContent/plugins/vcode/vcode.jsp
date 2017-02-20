<%@ page contentType="image/jpeg" session="false" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"  pageEncoding="UTF-8"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.List"%>  
<%@page import="com.shxt.util.FontHandle"%>  
<%!
// 生成随机颜色方法定义 
Color getRandColor(Random random,int fc,int bc) 

{ 
    if(fc>255) fc=255; 
    if(bc>255) bc=255; 
    int r=fc+random.nextInt(bc-fc); 
    int g=fc+random.nextInt(bc-fc); 
    int b=fc+random.nextInt(bc-fc); 
    return new Color(r,g,b); 
} 

%> 
<% 
// 设置页面不缓存 
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0);

// 设置图片的长宽 
int width=110, height=30; 

// 设置备选字符（去掉了0,,o,1,i,l等容易让人难以辨别的字符）
String base ="3456789012"; 

// 备选字符长度 
int length = base.length();

// 设置备选噪点字符
//String disBase="3456789012abcdefghjkmnpqwrstuvxy"; 
// 设置备选噪点字符
String disBase="abcdefghjkmnpqwrstuvxy"; 

// 创建记忆体图像 
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 

// 获取图形上下文
Graphics g = image.getGraphics();

// 创建随机类的实例以供下面调用 
Random random = new Random();

// 生成的验证码以及干扰曲线的颜色
Color tmpColor = getRandColor(random,10,150);

// 创建输出流对象
OutputStream os = response.getOutputStream();

// 创建变长变量用来存储干扰线描点的坐标
List<Double> x = new ArrayList<Double>();
List<Double> y = new ArrayList<Double>();


// 随机正弦函数的波形
int rd =random.nextInt(38)+2;

/*-------------------------------------------------------/分割线/-------------------------------------------------------*/
// 设定图像背景色(因为是背景色，所以偏淡) 
g.setColor(new Color(243, 251, 254)); 
g.fillRect(0, 0, width, height);


// 在图片背景上增加字母噪点 

for (int i=0;i<5;i++) 
{ 
	g.setColor(getRandColor(random,1,225)); 
    g.drawString(String.valueOf(disBase.charAt(random.nextInt(21)+1)), 24*i + random.nextInt(1)+9,random.nextInt(6)+10); 
    g.drawString(String.valueOf(disBase.charAt(random.nextInt(21)+1)), 24*i + random.nextInt(1)+9,random.nextInt(10)+22); 
}

// 取随机产生的字符串(4位数字与字母的组合)
// 保存生成的字符元串 
String sRand=""; 
// 设置字体颜色
g.setColor(tmpColor); 
// 设置字体 
g.setFont(FontHandle.getRandomFont()); 
//.setFont(f1); 
for (int i=0;i<4;i++) 
{ 
  int start = random.nextInt(length); 
  String rand=base.substring(start,start+1); 
  sRand+=rand; 
 // 將此字符画到图片上
  g.drawString(rand,24*i+ 10 + random.nextInt(8),24); 
}


// 生成干扰曲线
// 设置干扰曲线的颜色
g.setColor(tmpColor);


for(double i=-2*Math.PI;i<2*Math.PI;i+=0.05){
	double j = Math.sin(i)/2;
	x.add(i*17);
	y.add(j*rd+13);

}
for (int i=0;i<x.size()-1;i++) 
{ 
  g.drawLine((int)x.get(i).doubleValue(),(int)y.get(i).doubleValue(),(int)(x.get(i+1).doubleValue()),(int)(y.get(i+1).doubleValue()));
  g.drawLine((int)x.get(i).doubleValue()+1,(int)y.get(i).doubleValue()+1,(int)(x.get(i+1).doubleValue())+1,(int)(y.get(i+1).doubleValue())+1);
}



// 将验证码存入session 
HttpSession sess=request.getSession(true);
if(sess!=null){
	sess.setAttribute("RANDOM",sRand);
}

g.dispose();

// 输出图像到页面 
ImageIO.write(image, "JPEG", os); 
os.close();
os.flush();
os.close();
os=null;
response.flushBuffer();
out.clear();
out = pageContext.pushBody();
%>
