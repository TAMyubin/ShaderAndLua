
print("访问变量 sex："..sex)
var1 = 42
varTable={1,2,"Tam",11}
varTable.default = "yu"
varTable.map = {}
varTable.map.name = "bin"
meta = {
	name = "test"
}
setmetatable(varTable,meta)
function LuaFunction( str )
	-- body
	print("打印参数str="..str)
end