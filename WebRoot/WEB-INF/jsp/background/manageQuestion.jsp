<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
  <head>
<link href="resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="resource/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
    <script  type="text/javascript">
	    $(function(){
	        $(".product").change(function(){
		          //file表单选择了文件
		          if($(this).val() != ""){
					 $(this).next().after("<input type='hidden' name='logos' value="+$(this).attr('id')+" />");
			      }
		    });

// 	        KindEditor.ready(function(K) {
//                 editor = K.create('#eleven');
//             }); 

	        KindEditor.ready(function(K) {
		    	editor = K.create('textarea[name="information.informationContent"]', {
					cssPath : 'kindeditor/plugins/code/prettify.css',
					uploadJson : 'upload_json.jsp',
					allowFileManager : true,
					afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['form2'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['form2'].submit();
						});
					}
				});
		    	prettyPrint();
		    });

            $("#dialog_close").click(function(){
            	$("#addInfoType").hide();
            });
            $("#closeForm").click(function(){
            	$("#addInfoType").hide();
            });

            $("#submitForm").click(function(){
				if($.trim($("#typeName").val()) == ""){
					alert("动态类型不能为空！");
					return ;
				}
                
				$.post("common_addInfoType.action?informationTypeName="+$("#typeName").val(),function(result){
					$("#inforTypeId").append("<option value='"+result+"'>"+$("#typeName").val()+"</option>");	
					$("#addInfoType").hide();
				});
            });
		});

		function addInfoType(){
			$("#addInfoType").show();
		}
    </script>
  </head>
  
  <body>
	   <form method="post" id="form1" enctype="multipart/form-data" <s:if test="question==null">action="admin_addQuestion.action"</s:if><s:else>action="admin_updateQuestion.action"</s:else>>
	   		<s:if test="question==null">
	   			<h2>添加常见问题</h2>
	   		</s:if>
	   		<s:else>
	   			<h2>修改常见问题</h2>
	   		</s:else>
		   <table align="center" id="myTable" class="table table-bordered table-hover definewidth m10">
		   <input type="hidden" name="question.questionId"  value="<s:property value='question.questionId' />" />
		      <tr>
		        <td>问题名称：</td>
		        <td><input type="text" name="question.questionName" value="<s:property value='question.questionName' />" style="height:30px;width:500px;"/></td>
		      </tr>
		      <tr>
		        <td>问题答案：</td>
		        <td>
					<textarea name="question.questionAnswer"  id="eleven" style="width:100%; height:500px;" rows="10" cols="40"><s:property value='question.questionAnswer' /></textarea>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="2">
		            <input type="submit" <s:if test="question==null">value="添加"</s:if><s:else>value="修改"</s:else> class="btn btn-primary"/>
					<input type="button" value="返回列表"  onclick="javascript:location.href='admin_questionUI.action'" class="btn btn-success"/>
		        </td>
		      </tr>
		   </table>
		</form>
  </body>
</html>
