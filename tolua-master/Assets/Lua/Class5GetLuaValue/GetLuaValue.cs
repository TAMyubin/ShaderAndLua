using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class GetLuaValue : MonoBehaviour
{
    LuaState lua;
    // Start is called before the first frame update
    void Start()
    {
        lua = new LuaState();
        lua.Start();

        //在C#存放lua全局变量
        //在lua虚拟机初始化完成后，通过虚拟机对象["变量名"] = 值 添加lua全局变量
        lua["sex"] = "男";
        lua.AddSearchPath(Application.dataPath + "/Lua/Class5GetLuaValue");
        lua.Require("GetLuaValue");
        //访问lua中var1变量
        //通过lua虚拟机[变量名]来访问lua中的全局变量 也可以修改
        lua["var1"] = 999;
        //访问lua表中的某个变量，这个表是全局的  虚拟机对象[表名。变量名]
      print  (lua["varTable.default"]);
        //获取lua函数也可以使用这种方式
     LuaFunction func =  lua["LuaFunction"] as LuaFunction;
        func.Call("tamYUBIN");
        func.Dispose();
        func = null;
        //获取lua中的表
        //通过lua虚拟机对象.GetTable（“全局表名”）
        LuaTable table = lua.GetTable("varTable");
     LuaTable map=   lua.GetTable("varTable.map");
        //通过表对象["键 "]来访问对应值
        print(map["name"]);
        //通过表对象[元素下标]来访问对应下标的元素
       // table[3] = "132";
        print(table[3] + " " + (string)table["default"]);

        //获取一个表的元表
        LuaTable mate = table.GetMetaTable();
        print(mate["name"]);

        //可以将lua表转换为C#中的数组
        //可以通过表对象.ToArray()来将表对象转为object类型的数组
        //只会转换数组风格的元素
        object[] list = table.ToArray();
        foreach(object o in list)
        {
            print("ToArray: " + o);
        }
        //lua表对象需要在使用结束后释放，否则会造成内存泄漏
        map.Dispose();
        table.Dispose();
        map = null;
        table = null;
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
