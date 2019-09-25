using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class LuaPath : MonoBehaviour
{
    LuaState lua;
    /*
     * Unity中的路径
     * Resources 文件夹
     * 会在打包时一并打包进项目
     * 2.文件夹在打包时会压缩，压缩成二进制
     * Resources.Load加载 文件夹中内容
     * 
     * Application.dataPath
     * 1.永远指向项目的安装路径
     * 2.返回一个相对路径，根据平台不同，返回结果不同
     * 3.这个路径是只读路径
     * 
     * Application.persistentDataPath;
     * 1.是个沙盒目录，可以持久化的目录
     * 2.这个目录不在应用的安装路径下
     * 3.可读可写，根据平台不同，路径不同
     * 4.更新应用时当前目录下数据不会被清理
     * 5.目录没有保护级别，可以在电脑上查看目录内容
     * 安卓平台这个目录可能在SD卡上
     * 
     * Application.streamingAssetsPath
     * 1.流数据缓存目录（从网上下载的内容都放在这里）
     * 2.如果在项目开发中存在StringAssets文件夹
     * 那这个文件夹会在打包时原封不动的复制到项目中
     * 
     * 
     * 
     * Application.temporaryCachePath
     * 1.临时缓存目录
     * 2.会被定期清除
     */
    // Start is called before the first frame update
    void Start()
    {
        lua = new LuaState();
        lua.Start();
        //设定lua代码所在文件路径
        lua.AddSearchPath(Application.dataPath + "/Lua/Class2LuaPath");
        Require();
    }
    /// <summary>
    /// 使用dofile函数调用lua代码时，每次执行都会重新调用lua代码
    /// </summary>
   public void DoFile()
    {
        lua.DoFile("LuaPath");
    }
    /// <summary>
    /// 使用Require函数引用lua代码时只会执行一次，不会重复执行同一个lua文件
    /// </summary>
    public void Require()
    {
        lua.Require("LuaPath");
    }
    private void OnDestroy()
    {
        lua.Dispose();
        lua = null;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
