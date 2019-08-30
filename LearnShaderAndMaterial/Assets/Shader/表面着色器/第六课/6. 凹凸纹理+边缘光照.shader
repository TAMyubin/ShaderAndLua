Shader "表面着色器/29.凹凸纹理+边缘光照" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _BumpMap("凹凸纹理",2D) = "bump"{}
        _RimColor("边缘颜色",Color) = (0.26,0.19,0.16,0)
        _RimPower("边缘颜色强度",Range(0.5,8.0)) = 3.0
    }
    SubShader {
    Tags { "RenderType" = "Opaque" }
    CGPROGRAM
    //兰伯特光照
    #pragma surface surf Lambert
    //输入结构
    struct Input
    {
        //主纹理uv值
     float2 uv_MainTex;
        //凹凸纹理uv值
        float2 uv_BumpMap;
        //当前坐标的视角方向
        float3 viewDir;
    };
    //变量声明
    sampler2D _MainTex;//主纹理
    sampler2D _BumpMap;//凹凸纹理
    float4 _RimColor;//边缘颜色
    float _RimPower;//边缘颜色强度
    //表面着色器函数编写
    void surf(Input IN,inout SurfaceOutput o)
    {
        //从主纹理获取rgb值
        o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        //从凹凸纹理获取法线值
        o.Normal = UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
        half rim = 1.0 - saturate(dot(normalize(IN.viewDir),o.Normal));
        o.Emission = _RimColor.rgb * pow(rim,_RimPower);
    }
    ENDCG
    }

    Fallback "Diffuse"
}