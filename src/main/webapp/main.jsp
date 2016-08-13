<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html> 
<head>
<meta charset="UTF-8">
<title>like a man</title>
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
<style type="text/css">  
        html,body  
        {  
            height:100%;  
            margin:0 auto;  
        }  
    </style>
<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
		var parentFn=new Object();
		parentFn.allTitle=new Array();//用来存储所有选项卡的标题
		function MathRand()
		{//该函数为了防止IE缓存页面，造成 datagrid 刷新无反应
			var Num="";
			for(var i=0;i<8;i++)
			{
				Num+=Math.floor(Math.random()*10);
			}
			return Num;
		} 
		 
		
		$(function(){ 
			 
			 
			//获取滚动信息栏信息
			parentFn.getMessage=function(){
				
				
				$.ajax({
					type: "get",
					url:"/main/message?cmd=getMessage&rand="+MathRand(),					
					dataType: "json",
					
					success:function(data){
						if(data!=undefined&&data.length>0){
							$("#messageDiv").empty();
							for(var i=0;i<data.length;i++){
								
								$("#messageDiv").append($("<a href=\"#\" onclick=\"showmessageWin('"+data[i].id+"')\" style=\"position:absolute;display:none;left:620px;\">"+data[i].title+"</a>&nbsp;&nbsp;"));
							}
							clearInterval(parentFn.timer1);
							parentFn.timer1=setInterval(function(){
			 
							  $("#messageDiv").find("a:first").css({display:""}).animate({
							    left:"-400px"
							  },20000,function(){
							  
							    $("#messageDiv").find("a:first").appendTo($("#messageDiv"));
							      $("#messageDiv").find("a:first").css({display:"none",left:"620px"});
							  });
							},20000);
							
							 $('#show_data').window('close');
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
							alert(errorThrown);
					}
				});	
			}	
			 
			/** 动态添加tab-----方式二     **/ 
			parentFn.initTab=function(){  
				var title="代码库";
				var tt = $('#tt_tabs'); 
				tt.tabs({
				    border:false,
				    onSelect:function(title){
						//alert(title+' is selected');
				    },
				    tools:'#tab-tools'
				});
				var href="/web/mgr-model.jsp";
				var content = '<iframe  frameborder="0"  src="'+href+'" style="width:100%;height:100%;" scrolling="yes" ></iframe>'; 
				tt.tabs('add',{  
					title:"工作空间",  					
					iconCls:'icon-man'
				});   
				tt.tabs('add',{ title:"模型管理", iconCls:'icon-one',content:"" }); 
				tt.tabs('add',{ title:"HTML", iconCls:'icon-three',content:"" }); 
				tt.tabs('add',{ title:"JS", iconCls:'icon-hh',content:"" });
				tt.tabs('add',{ title:"JSP", iconCls:'icon-green',content:"" });
				tt.tabs('add',{ title:"Controller", iconCls:'icon-three',content:"" });
				tt.tabs('add',{ title:"持久化", iconCls:'icon-green',content:"" });
				tt.tabs('add',{ title:"业务", iconCls:'icon-one',content:"" });
				tt.tabs('add',{ title:"项目管理", iconCls:'icon-hh',content:"" });
				tt.tabs('add',{ title:"用户管理", iconCls:'icon-man',content:"" });
				tt.tabs('add',{ title:"系统设置", iconCls:'icon-hh',content:content });
			}  

			/**     
			 * 刷新tab 
			 * @cfg  
			 *example: {tabTitle:'tabTitle',url:'refreshUrl'} 
			 *如果tabTitle为空，则默认刷新当前选中的tab 
			 *如果url为空，则默认以原来的url进行reload 
			 */  
			function refreshTab(cfg){  
				var refresh_tab = cfg.tabTitle?$('#mytabs').tabs('getTab',cfg.tabTitle):$('#mytabs').tabs('getSelected');  
				if(refresh_tab && refresh_tab.find('iframe').length > 0){  
				var _refresh_ifram = refresh_tab.find('iframe')[0];  
				var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;  
				//_refresh_ifram.src = refresh_url;  
				_refresh_ifram.contentWindow.location.href=refresh_url;  
				}  
			}  

			parentFn.addWindow=function(src ){  
				$('#show_data').empty();
 

				$('#show_data').append("<iframe frameborder='0' src='"+src+"' width='100%' height='100%' border='0' ></iframe>");
                $('#show_data').window('open');
			
			}
			parentFn.closeImgWindow=function(src ){  
				
                $('#show_data').window('close');
			
			}
			parentFn.clearCache=function(){
				 
				
				$.ajax({
					type: "get",
					url:"/main/sys?cmd=init_stu_do_exam&rand=",					
					dataType: "text",
					
					success:function(data){
						if(data!=null&&data=="true"){
							alert("缓存清除成功!");
						}else{
							  alert("缓存清除失败!");
						}
						
						
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
							alert(errorThrown);
					}
				});	
			}
			
			
			window.onload=function()
			{
				parentFn.initTab();
				
				
			};		
			 
					

		});

    </script>
</head>
<body class="easyui-layout" id="wrap">
<div id="show_data"   class="easyui-window"   closed="true" style=" overflow:hidden;width:560px; height:400px;"> </div> 

	<div style="padding-left:30px; height:40px; background:#e0ecff; overflow:hidden;border:0px;" region="north">
		<div style="float:left; width:300px;height:38px;background-image:url(/sysimg/logo.png)">
		
		</div>
		<div style="float:right; width:auto;">
		<span style="font-size:14px; color:999; float:right; text-align:left; width:100px; overflow:hidden; height:30px; margin-top:5px;">
		<a href="userSer?cmd=loginOut" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出系统</a>
		 
		</span>
		<span style="font-size:14px; color:666; float:right; text-align:left; width:180px; overflow:hidden; height:30px; margin-top:5px;">
		<a href="#" id="closeAllTab" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">关闭所有选项卡</a>
		
		</span>
		<span style="font-size:14px; color:666; float:right; text-align:left; width:190px; overflow:hidden; height:30px; margin-top:5px;">
	 
		<a href="#" id="closeAllTab" class="easyui-linkbutton" data-options="iconCls:'icon-man'">当前用户: ${users.nam }</a>
		
		</span>
		 </div>
	</div>
	
	
	<div  region="south" split="true"  style="height:35px; background:#e0ecff;">
				<div style="float:right;width:120px;">
				<a id="openSendMessage" href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" id="submitForm">&nbsp;发送消息&nbsp;</a>
				</div>
				<div id="messageDiv" style="float:left;width:620px;height:26px;line-height:26px;border:0px solid #ccc;position:relative;overflow:hidden;">
				
				</div>
				<div style="float:left;width:120px;"></div>



	</div>
	 <div   region="center"   split="true"> 
		<div  id="tt_tabs"   class="easyui-tabs"  split="true" border="false" fit="true">
			 
		</div> 	
		<div id="tab-tools">
			<input id="ss" class="easyui-searchbox" style="width:300px" data-options="prompt:'Please Input Value',menu:'#mm'"/>
		</div>
		<div id="mm" style="width:120px">
		    <div data-options="name:'all',iconCls:'icon-ok'">All News</div>
		    <div data-options="name:'sports'">Sports News</div>
		</div>
 </div> 
</body>
</html>
