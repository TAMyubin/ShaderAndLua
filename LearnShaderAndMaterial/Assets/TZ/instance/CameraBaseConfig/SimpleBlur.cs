using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimpleBlur : PostEffectBase
{

    public Shader shader;
    private Material material;
    public Material _Material
    {
        get
        {
            material = CheckShaderAndCreateMaterial(shader, material);
            return material;
        }
    }
    //影响模糊效果的重要因素是模糊半径，模糊半径越大，模糊程度越大
    //均值模糊：将一个像素和其周围的像素取平均值
    [Range(0, 4f), Header("模糊半径")]
    public float blurRadius = 1;
    [Range(0, 4f), Header("分辨率降低的倍数")]
    public int down = 2;//分辨率降低的倍数
    [Range(0, 4f), Header("迭代次数")]
    public float iteration = 2;//迭代次数
    private void OnRenderImage(RenderTexture source, RenderTexture dest)
    {
        if (_Material)
        {
            //获取临时的渲染纹理
            RenderTexture rt1 = RenderTexture.GetTemporary(source.width >> down, source.height >> down, 0);
            RenderTexture rt2 = RenderTexture.GetTemporary(source.width >> down, source.height >> down, 0);
            //将原图拷贝到降分辨率的RT上
            Graphics.Blit(source, rt1);
            //进行迭代
            for (int i = 0; i < iteration; i++)
            {
                _Material.SetFloat("_BlurRadius", blurRadius);
                Graphics.Blit(rt1, rt2, _Material);
                Graphics.Blit(rt2, rt1, _Material);
            }
            //把结果拷贝到目标RT
            Graphics.Blit(rt1, dest);
            RenderTexture.ReleaseTemporary(rt1);
            RenderTexture.ReleaseTemporary(rt2);
            //_Material.SetFloat("_BlurRadius", blurRadius);
            //Graphics.Blit(source, dest,_Material);
        }
        else
        Graphics.Blit(source, dest);
    }
}
