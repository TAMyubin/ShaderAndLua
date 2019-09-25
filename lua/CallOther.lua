local  tb =  require("InvokeModel")
if not tb then
	print("lua模块不存在")
	return
end
print(tb.Height)
tb:PrintHeight()