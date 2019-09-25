using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;

public class HelloWorld1 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        /*
         1.使用Tolua的相关类和方法必须引用命名空间LuaInterface
         2.调用lua代码之前必须先创建lua虚拟机 LuaState lua = new LuaState();      虚拟机极度耗费资源，建议全局唯一
         3.开启lua虚拟机             lua.start()
         4.执行符合lua语法的字符串   lua. DoString(hello)
         5.释放虚拟机对象              lua.Dispose()
         */
        //创建lua虚拟机对象
        LuaState lua = new LuaState();
        //开启虚拟机
        lua.Start();
        //定义一个符合lua代码格式的字符串
        string hello = @"n = 10
                name = 'TAM'                        
                print(n,name)";
        //执行字符串定义的lua代码
        lua.DoString(hello);
        //检查虚拟机是否有未执行的代码
        lua.CheckTop();
        //释放虚拟机对象
        lua.Dispose();
        lua = null;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
