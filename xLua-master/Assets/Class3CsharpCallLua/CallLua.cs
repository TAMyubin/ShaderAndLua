using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;

[CSharpCallLua]
public interface IPerson
{
    string name { get; set; }
    int Age { get; set; }
    string Sex { get; set; }
    void eat();
    void Add(int a, int b);
}
public class CallLua : MonoBehaviour
{
    LuaEnv LuaEnv;
    // Start is called before the first frame update
    void Start()
    {
        LuaEnv = new LuaEnv();
        LuaEnv.AddLoader((ref string path) =>
        {
            return File.ReadAllBytes(Application.dataPath + "/Class3CsharpCallLua/" + path + ".lua");
        });
        LuaEnv.DoString("require'LuaScript1'");

        //1.获取lua中的全局变量
        //通过lua虚拟机.Global.Get<要获取的数据类型>(数据名)
        int a= LuaEnv.Global.Get<int>("a");
        string b = LuaEnv.Global.Get<string>("name");
        bool c = LuaEnv.Global.Get<bool>("isDis");


        //获取lua中的全局表
        //1.将lua中的表映射到C#的对象中
        //只能映射字典风格元素，函数和列表风格都不能获取
        //映射过程是值拷贝，所以改变c#成员变量不会改变lua表中的元素
        //效率低，消耗性能
        // Person TAM = null;
        //TAM= LuaEnv.Global.Get<Person>("tb");
        // print("name: " + TAM.name + "Age: " + TAM.Age + "Sex: " + TAM.Sex);


        //2.将lua中的表映射到接口去
        //被映射的接口必须要加入特性[CSharpCallLua]，并且生成中间代码
        //性能消耗要优于第一种映射类的方式
        //不能映射列表风格的元素
        //映射过程是引用拷贝，所以改变C#中成员变量会改变lua表中的元素的值
        IPerson Tan = LuaEnv.Global.Get<IPerson>("tb");
        print("name: " + Tan.name + "Age: " + Tan.Age + "Sex: " + Tan.Sex);
        Tan.Add(100, 55);
        Tan.eat();
        print("--------------------");
        //3.可以将lua中的表映射到字典或者列表中
        //只能映射表中字典风格元素，不能映射列表和函数
        //一种轻量级的映射方式
        //Dictionary<string, object> dict = LuaEnv.Global.Get<Dictionary<string, object>>("tb");
        //foreach(string key in dict.Keys)
        //{
        //    print(key + "  " + dict[key]);
        //}

        //将列表风格的元素映射到列表中
        //List<object> list = LuaEnv.Global.Get<List<object>>("tb");
        //foreach (object o in list)
        //{
        //    print(o);
        //}

        //4.将lua表映射到LuaTable中
        //可以获取到字典风格和列表风格的元素，但不能获取函数
        LuaTable table = LuaEnv.Global.Get<LuaTable>("tb");
        print(table[1]);
        print(table.Length);
        print(table.Get<string>("name"));
        LuaEnv.Dispose();
        LuaEnv = null;
    }
    class Person
    {
        public string name;
        public int Age;
        public string Sex;
    }
    private void OnDestroy()
    {
    
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}

