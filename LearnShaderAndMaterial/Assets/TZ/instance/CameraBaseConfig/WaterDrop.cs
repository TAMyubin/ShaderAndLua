using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterDrop : PostEffectBase
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
    private Texture2D waterDrop;
    public float distortion = 6;
    public float sizeX = 1f;
    public float sizeY = 0.5f;
    public float dropSpeed = 2;
    private float time = 0;
    // Start is called before the first frame update
    void Start()
    {
        waterDrop = Resources.Load("ScreenWaterDrop") as Texture2D;
    }

    // Update is called once per frame
    void Update()
    {

    }
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        time += Time.deltaTime;
        if (time > 100)
            time = 0;

        _Material.SetFloat("_Distor", distortion);
        _Material.SetFloat("_CurTime", time);
        _Material.SetFloat("_SizeX", sizeX);
        _Material.SetFloat("_SizeY", sizeY);
        _Material.SetFloat("_DropSpeed", dropSpeed);
        _Material.SetTexture("_WaterDropTex", waterDrop);
        Graphics.Blit(source, destination, _Material);
    }
}
