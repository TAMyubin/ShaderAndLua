using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class ClassCsharp : MonoBehaviour
{
    private LuaState lua;
    // Start is called before the first frame update
    void Start()
    {
        new LuaResLoader();
        lua = new LuaState();
        lua.Start();
        LuaBinder.Bind(lua);
        lua.AddSearchPath(Application.streamingAssetsPath);
    }
    public void OnUpdateClick()
    {
        lua.Require("LuaScript");
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
