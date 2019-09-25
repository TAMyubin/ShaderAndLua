using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//引用命名空间
using XLua;
public class XluaHelloWorld : MonoBehaviour
{
    //lua虚拟机非常耗费资源，建议全局唯一
    //创建lua虚拟机
    LuaEnv luaEnv;
    // Start is called before the first frame update
    void Start()
    {
        //不需要开启lua虚拟机
        luaEnv = new LuaEnv();
        //执行lua代码（可以执行一个符合lua语法的字符串）
        //由lua虚拟机打印的内容会在内容前会自动添加 lua：
        luaEnv.DoString("print('helloworld')");
    }
    private void OnDestroy()
    {
        //当运行完毕释放虚拟机
        luaEnv.Dispose();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
