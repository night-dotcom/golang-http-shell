<%
If Request("id") <> "" Then
'读取txt
	set fs=server.createobject("scripting.filesystemobject")
	file=server.mappath(Request("id")&".txt")
	set txt=fs.opentextfile(file,1,true) '1只读,2写,8 打开文件并从文件末尾开始写,True 以 Unicode 格式打开文件,False 以 ASCII 格式打开,UseDefault 使用系统默认值打开文件
	if not txt.atendofstream then '先确定还没有到达结尾的位置
	Content = txt.ReadAll '读取整个文件的数据
	Response.Write Content
	end if

'清空txt内容
	dim fs,fname
    set fs=Server.CreateObject("Scripting.FileSystemObject")
	file=server.mappath(Request("id")&".txt")
	set fname=fs.opentextfile(file,2,true)
	fname.Write("")
	fname.Close
	set fname=nothing
	set fs=nothing
	
'接收post
	If request("u") <> "" Then
		u = request("u")
		set f=Server.CreateObject("scripting.filesystemobject")
		file=server.mappath(Request("id")&".log")
		set ff=f.opentextfile(file,8,true,0)
		ff.writeline(u)
		ff.close
		set ff=nothing
		set f=nothing
		
		set f=Server.CreateObject("scripting.filesystemobject")
		file=server.mappath(Request("id")&".dic")
		set ff=f.opentextfile(file,2,true)
		ff.writeline(u)
		ff.close
		set ff=nothing
		set f=nothing
		End If
End If
%>