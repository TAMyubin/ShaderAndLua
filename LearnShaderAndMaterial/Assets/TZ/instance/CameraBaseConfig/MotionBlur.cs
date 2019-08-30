using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MotionBlur : PostEffectBase
{
    //径向模糊：针对每个像素点，首先要得到一个相对于中心的方向，从中心指向该像素点的方向就是径向模糊的方向
    //然后沿着方向取几个点作为采样点，采样点越靠近中心越密集，最后该像素点的输出就是这些采样点的均值，越中心越清晰
    //越边缘越模糊
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
    public Vector2 blurCenter = new Vector2(0.5f, 0.5f);
    [Range(0, 1f), Header("强度")]
    public float blurRim = 0.2f;//强度
    [Range(0, 4f), Header("分辨率降低的倍数")]
    public int down = 2;//分辨率降低的倍数
    [Range(0, 4f), Header("迭代次数")]
    public float iteration = 2;//迭代次数
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        //if (_Material)
        //{
        //    _Material.SetFloat("_BlurRim", blurRim);
        //    _Material.SetVector("_BlurCenter", blurCenter);
        //    Graphics.Blit(source, destination, _Material);
        //}

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
                _Material.SetFloat("_BlurRim", blurRim);
                _Material.SetVector("_BlurCenter", blurCenter);
                Graphics.Blit(rt1, rt2, _Material);
                Graphics.Blit(rt2, rt1, _Material);
            }
            //把结果拷贝到目标RT
            Graphics.Blit(rt1, destination);
            RenderTexture.ReleaseTemporary(rt1);
            RenderTexture.ReleaseTemporary(rt2);
        }
    }
}
