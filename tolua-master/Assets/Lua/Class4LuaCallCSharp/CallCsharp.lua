
--1.通过 命名空间.类名，来访问C#类
--2.访问的C#类必须是添加并生成中间代码的类
--3.调用成员属性或者字段，用.
				--	方法用：
			--调用静态方法用.
		go=	UnityEngine.GameObject.Find("Cube")
		print(go.name)
		--执行v3的lua文件
		local v3 = require("UnityEngine/Vector3")
		--获取transform组件获取到position
		go.transform.position = v3(100,100,100)
		--访问静态类中成员函数和成员变量
		print(StaticClass.str)
		StaticClass.Function()
	CS=	go:GetComponent("TestClass")
	print(CS.normalClass.str)
	CS.normalClass:Function()
	--通过对象访问属性或者字段 用.
			--访问静态成员函数 用.
			--访问普通成员函数 用：
