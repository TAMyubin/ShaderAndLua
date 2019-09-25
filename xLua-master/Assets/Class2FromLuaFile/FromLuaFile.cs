using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;
public class FromLuaFile : MonoBehaviour
{
    LuaEnv luaEnv;
    // Start is called before the first frame update
    void Start()
    {
        luaEnv = new LuaEnv();
        //1.通过resource.load只能加载Resources文件夹下读取lua代码(要写后缀)
        //TextAsset ta = Resources.Load<TextAsset>("LuaScript.lua");
        // luaEnv.DoString(ta.text);
        // //2.通过执行require来执行代码
        // luaEnv.DoString("require 'LuaScript'");

        //3.xlua是怎样获取lua文件路径的
        //xlua是通过lualoader来寻找对应loader下的lua文件
        //每次添加一个loader当时使用require加载lua文件时
        //xlua就会遍历所有的loader直到找到某个loader下面有对应lua文件位置
        //没找到返回空，如果有多个重名文件，只会执行第一个个找到的文件
        //Resources文件夹是xlua默认添加的一个loader
        luaEnv.AddLoader((ref string path) =>
        {
            return  File.ReadAllBytes(Application.dataPath + "/Class2FromLuaFile/" + path + ".lua");
        });
        luaEnv.DoString("require 'LuaScript'");
    }

    private void OnDestroy()
    {
        luaEnv.Dispose();
        luaEnv = null;
    }

    // Update is called once per frame
    void Update()
    {

    }
}
