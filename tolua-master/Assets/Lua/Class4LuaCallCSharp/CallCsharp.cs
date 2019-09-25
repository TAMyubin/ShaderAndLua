using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class CallCsharp : MonoBehaviour
{
    public LuaState lua;
    // Start is called before the first frame update
    /*Lua调用C#函数的步骤
     1.将调用C#类添加到CustonSetting
     2.点击lua菜单栏 Generate All 生成对象类的中间代码
     3.使用luaBinder.bind（lua虚拟机）来将中间代码绑定到lua虚拟机
     特别注意：
     只要CutonSetting脚本中添加的类有代码变化，必须重新 Generate All
     否则 修改的代码不会被应用，也是lua调用不了已经修改过的内容
     4.在lua代码中 命名空间.类名，来访问对应的C#类
         */
    void Start()
    {
        lua = new LuaState();
        lua.Start();
        //将生成好的中间代码绑定到lua虚拟机上
        //才可以调用C#函数，否则无法调用
        LuaBinder.Bind(lua);
        lua.AddSearchPath(Application.dataPath + "/Lua/Class4LuaCallCsharp");
        lua.Require("CallCsharp");
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    private void OnDestroy()
    {
        lua.Dispose();
        lua = null;
    }
}
