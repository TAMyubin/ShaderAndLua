using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GaussionBlur : PostEffectBase
{
    /*高斯模糊：又叫高斯平滑，主要功能是对图片进行加权平均的操作，与均值模糊类似
     每个像素的颜色值都是由其本身和周围像素的颜色值加权平均得到的，越靠近像素本身，权值越高
     权值符合正态分布，也叫高斯分布*/
    // Start is called before the first frame update

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
    [Range(0, 2f), Header("模糊半径")]
    public float blurRadius = 1;
    [Range(0, 4f), Header("分辨率降低的倍数")]
    public int down = 2;//分辨率降低的倍数
    [Range(0, 4f), Header("迭代次数")]
    public float iteration = 2;//迭代次数
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
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
                _Material.SetFloat("_BlurSize", blurRadius);
                Graphics.Blit(rt1, rt2, _Material,0);
                Graphics.Blit(rt2, rt1, _Material,1);
            }
            //把结果拷贝到目标RT
            Graphics.Blit(rt1, dest);
            RenderTexture.ReleaseTemporary(rt1);
            RenderTexture.ReleaseTemporary(rt2);
            //_Material.SetFloat("_BlurRadius", blurRadius);
            //Graphics.Blit(source, dest,_Material);
        }
    }
}
