using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;
using System;

[CSharpCallLua]
public class CallLuaFunction : MonoBehaviour
{
    LuaEnv luaEnv;
    [CSharpCallLua]
   public delegate int Add(int a, int b);
    [CSharpCallLua]
    public delegate int Add2(int a, int b,out int c,out string d);
    // Start is called before the first frame update
    void Start()
    {
        luaEnv = new LuaEnv();
        luaEnv.AddLoader((ref string path) =>
        {
            return File.ReadAllBytes(Application.dataPath + "/Class5CallLuaFunction/" + path + ".lua");
        });
        luaEnv.DoString("require'ls'");
        //访问lua全局函数
        //1.将lua函数映射到C#内置委托中
        //委托本身消耗资源，用完制空
        //无法接受返回值
        //Action<int, int> Add;
        //Add = luaEnv.Global.Get<Action<int, int>>("Add");
        //Add(60, 50);
        //Add = null;

        //2.将函数映射到自定义委托中
       // Add add;
       // add = luaEnv.Global.Get<Add>("Add");
       //int c = add(550, 50);
       // print(c);
       // add = null;



        //3.可以自定义委托获取lua中多个返回值
        Add2 add;
        add = luaEnv.Global.Get<Add2>("Add");
        int d;
        string e;
        int c = add(550, 50,out d,out e);
        print(c + "  " + d + "  " +e);
        add = null;
        luaEnv.Dispose();
        luaEnv = null;
    }


    
}
