using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;
public class LuaCallCsharp : MonoBehaviour
{
    LuaEnv luaEnv;
    // Start is called before the first frame update
    void Start()
    {
        luaEnv = new LuaEnv();
        luaEnv.AddLoader((ref string path) =>
        {
            return File.ReadAllBytes(Application.dataPath + "/Class4LuaCallCsharp/" + path + ".lua");
        });
        luaEnv.DoString("require'luascript'");
        luaEnv.Dispose();
        luaEnv = null;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
