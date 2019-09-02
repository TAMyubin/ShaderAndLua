using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class CallLuaFunc : MonoBehaviour
{
    public LuaState lua;
    public LuaFunction luafun;
    // Start is called before the first frame update
    void Start()
    {
        lua = new LuaState();
        lua.Start();
        lua.AddSearchPath(Application.dataPath + "/Lua/Class3LuaFunction");
        lua.Require("LuaFunction");
        //Lua函数在C#中是一个LuaFunction对象
        //将已经加载到内存中的lua脚本中的函数
        //作为参数传递给GetFunction就可以获取到lua函数对象
        luafun = lua.GetFunction("test.Add");
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
