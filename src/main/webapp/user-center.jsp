<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html> 
<head>
<meta charset="UTF-8">
<title>考试中心</title>
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
		function showmessageWin(id){
			parentFn.addWindow("/main/message?cmd=getSomeMessage&id="+id+"&rand="+MathRand());
		}
		$(function(){ 
			$('#closeAllTab').click(function(){
				if(confirm("确定关闭全部选项卡吗？")){
			      $(".tabs li").each(function(index, obj) {
			            //获取所有可关闭的选项卡
			          var tab = $(".tabs-closable", this).text();
			          if(tab!='今日信息'){
			          	$(".easyui-tabs").tabs('close', tab);
			          }
			          
			      });
				}

			
			}); 
			$('#openSendMessage').click(function(){
				parentFn.addWindow("/main/message?cmd=add_init&rand="+MathRand());

			
			}); 
			parentFn.timer1;
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
			parentFn.closeAllOtherTab=function(){
				$('#tt_tabs').tabs('close','编辑试题(选择题)');
			
			}
			parentFn.closeSomeTab=function(title){
				$('#tt_tabs').tabs('close',title);
			
			}			
			//
 			parentFn.hiddenLeftMenu=function(){//隐藏左侧菜单的region
 				$('#wrap').layout('collapse','west'); 
 			}
			parentFn.showLeftMenu=function(){//显示左侧菜单的region
 				$('#wrap').layout('expand','west'); 
 				
 			}
			/** 动态添加tab-----方式二     **/ 
			parentFn.addTab=function(title, href,icon){  
				//$('#wrap').layout('hidden',"west");
				if(title!='今日信息'){
					parentFn.hiddenLeftMenu();
				}
				var had=false;
				var len=parentFn.allTitle.length;
				for(var i=0;i<len;i++){
					if(parentFn.allTitle[i]==title){
						had=true;
					}
				}
				if(had==false){
					parentFn.allTitle.push(title);
				}
			  	
 				
			
				var tt = $('#tt_tabs');  
				$('#tt_tabs').tabs({   
				    border:false,   
				    onClose:function(){
                          parentFn.showLeftMenu();
                          var lens=parentFn.allTitle.length;
                          if(lens>1){
	                          
	                          
	                          $('#tt_tabs').tabs('select',parentFn.allTitle[lens-2]);
                          }

                     } 
				}); 
				//alert(tt);
				if (tt.tabs('exists', title)){//如果tab已经存在,则选中并刷新该tab          
					tt.tabs('select', title);  
					refreshTab({tabTitle:title,url:href});  
				} else {  
					var content="";
					if (href){  
						content = '<iframe  frameborder="0"  src="'+href+'" style="width:100%;height:100%;" scrolling="yes" ></iframe>';  
					} else {  
						content = '未实现';  
					}  
					
					tt.tabs('add',{  
						title:title,  
						closable:true,  
						content:content,  
						iconCls:icon||'icon-default'
						
						 
					});  
					
				}  
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
			parentFn.getOnlineUsers=function(){
				
				
				$.ajax({
					type: "get",
					url:"/userSer?cmd=get_online_users&rand="+MathRand(),					
					dataType: "json",
					
					success:function(data){
						if(data!=undefined&&data.length>0){
							$("#onLineUsers").empty();
							for(var i=0;i<data.length;i++){
								
								$("#onLineUsers").append($("<a href=\"#\">"+data[i].realName+"</a><br>"));
							}
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
							alert(errorThrown);
					}
				});	
			}	
			parentFn.getMessagex=function(){
				parentFn.getMessage();
				setInterval(parentFn.getMessage,300000);
			}
			window.onload=function()
			{
				
				parentFn.addTab("今日信息","/main/count?cmd=count_main_index",null);
				parentFn.getOnlineUsers();
				setInterval(parentFn.getOnlineUsers,600000);
				//parentFn.getMessage();
				setTimeout(parentFn.getMessagex,"2000");
			};		
			$(".easyui-tree li").click(function(){
				var text=$.trim($(this).text());
				//alert($.trim(text)=='新建用户信息');
				if(text=='开始考试'){
					
					parentFn.closeAllOtherTab();
					parentFn.addTab("开始考试", "/main/stu?cmd=stu_do_exam_list",null);
				}else if(text=='我的历史'){
					parentFn.addTab("我的历史", "/main/stu?cmd=showMyhty",null);
				}else if(text=='新建试卷'){
					parentFn.addTab("新建试卷", "/main/exam?cmd=createExamIns",null);
				}else if(text=='新建试题(选择题)'){
					parentFn.addTab("新建试题(选择题)", "/main/allQue?cmd=create",null);
					//$('#show_manual').window('open');
				}else if(text=='管理试卷'){
					parentFn.addTab("管理试卷", "/main/exam?cmd=exam_des_list",null);
					//$('#show_manual').window('open');
				}else if(text=='管理试题'){
					parentFn.addTab("管理试题", "/main/allQue?cmd=mgr_list_init",null);
					//$('#show_manual').window('open');
				}else if(text=='管理知识节点'){
					parentFn.addTab("管理知识节点", "/main/types?cmd=list",null);
					//$('#show_manual').window('open');
				}else if(text=='新建考试计划'){
					parentFn.addTab("新建考试计划", "/userSer?cmd=users_query_init",null);
					 
				}else if(text=='管理考试计划'){
					parentFn.addTab("管理考试计划", "/main/exam?cmd=mgr_exam_plan_init",null);
					 
				}else if(text=='管理用户'){
					parentFn.addTab("管理用户", "/userSer?cmd=mgr_user_group_init",null);
					 
				}else if(text=='查看所有考试结果'){
					parentFn.addTab("查看所有考试结果", "/main/stu?cmd=stu_should_do_exam_all_init",null);
					 
				}else if(text=='修改密码'){
					parentFn.addTab("修改密码", "/userSer?cmd=update_pwd_init",null);
					 
				}else if(text=='初始化缓存'){
					parentFn.clearCache(); 
				}else if(text=='新建练习'){
					parentFn.addTab("新建练习", "/main/train?cmd=create",null);
				}else if(text=='管理练习'){
					parentFn.addTab("管理练习", "/main/train?cmd=get_train_que_list_page",null);
				}else if(text=='完成练习'){
					parentFn.addTab("完成练习", "/main/train?cmd=stu_do_train_init",null);
				}
			
			});	
					

		});

    </script>
</head>
<body class="easyui-layout" id="wrap">
<div id="show_data"   class="easyui-window"   closed="true" style=" overflow:hidden;width:560px; height:400px;"> </div> 

	<div style="padding-left:30px; height:40px; background:#e0ecff; overflow:hidden;" region="north">
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
	<!--左侧菜单栏开始-->
	<div region="west" split="true" title="导航菜单" style="width:230px;padding:0px;">
	  <div class="easyui-accordion" data-options="fit:true,border:false">
	 <s:if test="${users.roleId==3 }">
		<div title="我的考试" style="padding:0px;">
		  <ul class="easyui-tree">
			 
			<li>开始考试</li>
			 <li>新建试题(选择题)</li>
			  <li>管理试题</li>
			  <li>修改密码</li>
		  </ul>
		</div>
	</s:if>	
	 <s:if test="${users.roleId==-1 }">
		<div title="试卷管理" data-options="selected:true" style="padding:0px;">
		  <ul class="easyui-tree">
			<li>新建试卷</li>
		   <li>新建试题(选择题)</li>
		   <li>管理试卷</li>
		   <li>管理试题</li>
		   <li>管理知识节点</li>
		   <li>开始考试</li>
		  </ul>
		</div>
		<div title="用户管理" style="padding:0px">
		  <ul class="easyui-tree">
			<li>新建用户</li>
			<li>管理用户</li>
			 
		  </ul>
		</div>
		<div title="考试管理" style="padding:0px">
		  <ul class="easyui-tree">
			<li>新建考试计划</li>
			<li>管理考试计划</li>
			 <li>查看所有考试结果</li>
		  </ul>
		</div>
		<div title="每日多练" style="padding:0px">
		  <ul class="easyui-tree">
			<li>新建练习</li>
			<li>管理练习</li>
			<li>完成练习</li>
			<li>统计结果</li>
		  </ul>
		</div>		
		<div title="系统管理" style="padding:0px">
		  <ul class="easyui-tree">
			<li>初始化缓存</li>
			 <li>修改密码</li>
			 
		  </ul>
		</div>	
		<div title="源码库" style="padding:0px">
		  <ul class="easyui-tree">
			<li>JavaScript库</li>
			 <li>Bean类库</li>
			 <li>Dao类库</li>
			  <li>Controller类库</li>
			  <li>HtmlCss库</li>
			  <li>Sql库</li>
		  </ul>
		</div>
		<div title="业务模型库" style="padding:0px">
		  <ul class="easyui-tree">
			<li>权限控制类</li>
			 <li>事务控制类</li>
			 <li>Dao类库</li>
			  <li>Controller类库</li>
			  <li>HtmlCss库</li>
			  <li>Sql库</li>
			   <li>Xml库</li>
			    <li>模板库</li>
		  </ul>
		</div>	
		<div title="应用模型库" style="padding:0px">
		  <ul class="easyui-tree">
			<li>OA系统</li>
			 <li>CMS系统</li>
			 <li>论坛系统</li>
			  <li>p2p系统</li>
			  <li>Erp系统</li>
			  <li>电子商务系统</li>
			   <li>SNS系统</li>
		  </ul>
		</div>			
		</s:if>	
		<div title="项目代码管理" style="padding:0px">
		  <ul class="easyui-tree">
			<li>项目列表</li>
			 <li>模块管理</li>
		  </ul>
		</div>		
	  </div>
	</div>
	<!--左侧菜单栏结束-->
	<div id="onLineUsers" region="east" split="true" title="在线用户" style="width:100px;padding:10px;"></div>
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
 </div> 
</body>
</html>
