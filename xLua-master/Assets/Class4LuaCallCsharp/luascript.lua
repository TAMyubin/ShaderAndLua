--new C#对象
--C#创建对象new类名（）
--CS开头，命名空间，类名（）这样可以在lua创建C#对象
local go = CS.UnityEngine.GameObject()
--访问C#中静态方法，成员变量，成员属性都用.来访问
--						访问 普通成员方法   必须用 对象：方法名来调用
print(CS.UnityEngine.Time.deltaTime)
local camera = CS.UnityEngine.GameObject.Find("Main Camera")
print(camera)
camera.name = "LuaCamera"
local Com = camera:GetComponent("Camera")
Com.fieldOfView = 90