using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//屏幕基础类
[ExecuteInEditMode]//非运行模式也能触发该脚本
[RequireComponent(typeof(Camera))]//屏幕后处理特效一半需要绑定到摄像机上
public class PostEffectBase : MonoBehaviour
{
    /// <summary>
    ///     用来检测是否支持屏幕特效，不支持就disable这个被继承的子类
    /// </summary>
    protected void CheckResources()
    {
        bool isSupported = CheckSupport();
        if (isSupported == false)
        {
            NotSupported();
        }
    }
    /// <summary>
    /// 检测平台是否支持图片渲染
    /// </summary>
    /// <returns></returns>
    protected bool CheckSupport()
    {
        if (SystemInfo.supportsImageEffects == false)
        {
            Debug.LogWarning("该平台不支持图像效果或者贴图渲染");
            return false;
        }
        return true;
    }

    protected void NotSupported()
    {
        enabled = false;
    }
    /// <summary>
    /// 检测资源，如果不支持，关闭脚本活动
    /// </summary>
    void Start()
    {
        CheckResources();
    }
    /// <summary>
    /// 检测需要渲染的shader可用性，然后返回使用了该shader的material
    /// </summary>
    /// <param name="shader"></param>
    /// <param name="material"></param>
    /// <returns></returns>
    protected Material CheckShaderAndCreateMaterial(Shader shader, Material material)
    {
        if (shader == null) { return null; }
        if (shader.isSupported && material && material.shader == shader)
        {
            return material;
        }
        if (!shader.isSupported)
        {
            return null;
        }
        else
        {
            material = new Material(shader);
            material.hideFlags = HideFlags.DontSave;
            if (material)
                return material;
            else
                return null;
        }
    }
}
