--类 通过类去创建对象
	local person = {}
	--创建对象的方法
	function person:New(Name,Sex )
		-- body
		o=setmetatable({},self)
		self.__index = self
		o.Name = Name
		o.Sex = Sex
		return o
	end
	function person:personInfo( )
		-- body
		print(string.format("人员名字 %s 性别 %s",self.Name,self.Sex))
	end

	local Tam = person:New("TAM","男")
	local yu = person:New("yu","女")
	print(Tam)
	print(yu)
	Tam:personInfo()
	yu:personInfo()


	--方法2
	local person1 = setmetatable(
		{personInfo1 = function (self )
			-- body
			print(string.format("人员名字 %s 性别 %s",self.Name1,self.Sex1))
		end
		},
		{
			__call = function (self,Name1,Sex1)
				-- body
				local tb = {}
				tb.Name1 = Name1
				tb.Sex1 = Sex1
				setmetatable(tb,{__index=self})
				return tb
			end
		}
		)
	local Tam = person1("TAM","男")
	local yu = person1("yu","女")
	print(Tam)
	print(yu)
	Tam:personInfo1()
	yu:personInfo1()

print("------------------继承--------------------")
	--继承
local father = {}
father.Name2 = "TAM"
father.Age = 30
function father:personInfo2( ... )
	-- body
		print(string.format("人员名字 %s 年龄 %s",self.Name2,self.Age))
end
--定义子类
local Son = {}
Son.Name2 = "yu"
Son.Age = 10
function Son:Speak()
	print(self.Name2.."在说话")
	end
	--子类中使用子类中的成员变量，如果访问子类中不存在的变量，则去父类中查找
	setmetatable(Son,{__index=father})
	print(Son.Name2)
	Son:personInfo2()
	Son:Speak()