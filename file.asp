<%
	dim fs,fname
    set fs=Server.CreateObject("Scripting.FileSystemObject")
	file=server.mappath(Request("id")&".txt")
	set fname=fs.opentextfile(file,2,true)
	fname.Write(request("str"))
	fname.Close
	set fname=nothing
	set fs=nothing
%>