using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterWave : PostEffectBase
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
    public float distance = 60;
    public float time = 10;
    public float total = 1;
    public float waveWidth = 0.3f;
    public float waveSpeed = 0.3f;
    private float waveTime = 0;
    private Vector2 startPos = new Vector3(0.5f,0.5f);
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
       // waveTime = Time.time;//默认出现在屏幕中心
        //波纹在鼠标点击的位置出现
        if (Input.GetMouseButtonDown(0))
        {
            Vector2 mousePos = Input.mousePosition;
            startPos = new Vector2(mousePos.x / Screen.width, mousePos.y / Screen.height);
            waveTime = Time.time;//默认出现在屏幕中心

        }
    }
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        //计算波纹移动的距离
        float curDis = (Time.time - waveTime) * waveTime;
        _Material.SetFloat("_Distance", distance);
        _Material.SetFloat("_TimeFactor", time);
        _Material.SetFloat("_Total", total);
        _Material.SetFloat("_WaveWidth", waveWidth);
        _Material.SetFloat("_WaveDis", curDis);
        _Material.SetVector("_StartPos", startPos);
        Graphics.Blit(source, destination, _Material);

    }
}
