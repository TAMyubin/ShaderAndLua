using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BrightnessSaturationAndContrast : PostEffectBase
{
    public Shader shader;
    private Material material;
    //亮度：像素的明暗程度，图中的RGB值大小，RGB越大，亮度越亮
    [Range(0, 3), Header("亮度")]
    public float brightness = 1.0f;
    //饱和度：色彩的纯度，图片的饱和度越高说明图片的色彩越鲜艳，否则越灰暗
    [Range(0, 3), Header("饱和度")]
    public float saturation = 1.0f;
    //对比度：最高亮度和最低亮度的比值
    [Range(0, 3), Header("对比度")]
    public float contrast = 1.0f;
    public Material _Material
    {
        get
        {
            material = CheckShaderAndCreateMaterial(shader, material);
            return material;
        }
    }
    /// <summary>
    /// unity提供的接口用来处理渲染后的图像
    /// </summary>
    /// <param name="source"></param>
    /// <param name="dest"></param>
    private void OnRenderImage(RenderTexture source, RenderTexture dest)
    {
        if (_Material)
        {
            _Material.SetFloat("_Brightness", brightness);
            _Material.SetFloat("_Saturation", saturation);
            _Material.SetFloat("_Contrast", contrast);
            Graphics.Blit(source, dest, _Material);
        }
        else
        {
            //直接绘制
            Graphics.Blit(source, dest);
        }
    }
    /*source:当前屏幕的渲染纹理或者是上一步处理完的渲染纹理
     * dest：目标渲染纹理，把纹理渲染到屏幕上
     * mat：使用的材质
     * pass：默认是-1，顺序调用shader中所有的pass，否则只会调用给定索引的pass
     * sacle：源纹理的缩放
     * offset：源纹理的偏移量
     */
}
