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

        //第三种
        //优点不需要获取函数对象，只能返回一个返回值
        //int num = lua.Invoke<int, int, int>("test.Add", 600, 100, true);
        //Debug.Log("获得的返回值是" + num);

        //Lua函数在C#中是一个LuaFunction对象
        //将已经加载到内存中的lua脚本中的函数
        //作为参数传递给GetFunction就可以获取到lua函数对象
        //使用获取lua获取对象的方式，必须最后释放lua函数对象
        luafun = lua.GetFunction("test.Add");
        if (luafun != null)
        {
            //第一种引用lua函数的方法
            //最多只能获取一个返回值
            //int num = luafun.Invoke<int, int, int>(50, 60);
            //Debug.Log("获得的返回值是"+num);
            //第二种
            //优点灵活，缺点麻烦
            //int num= CallLua();
            //  Debug.Log("获得的返回值是" + num);

            //第四种
            //优点最简便，但是没有返回值
            luafun.Call(489, 555);
           

        }
    }
    public int CallLua()
    {
        //准备调用lua函数
        luafun.BeginPCall();
        luafun.Push(99);
        luafun.Push(122);
        //调用函数
        luafun.PCall();
        //获取返回值
        int num = (int)luafun.CheckNumber();
        string str = luafun.CheckString();
        bool bol = luafun.CheckBoolean();
        //结束调用
        luafun.EndPCall();
        Debug.Log(str+bol);
        return num;
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
