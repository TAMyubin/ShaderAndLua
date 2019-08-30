Shader "表面着色器/27.凹凸纹理载入" {
   Properties 
    {
        _MainTex ("【主纹理】Texture", 2D) = "white" {}
        _BumpMap ("【凹凸纹理】Bumpmap", 2D) = "bump" {}
    }

    SubShader {
        Tags { "RenderType" = "Opaque" }
        //开启CG着色编程语言段
        CGPROGRAM
        //1.光照模式声明：兰伯特光照模式
        #pragma surface surf Lambert
        //2.输入结构
        struct Input
        {
            //主纹理的uv值
            float2 uv_MainTex;
            //凹凸纹理的uv值
            float2 uv_BumpMap;
        };
        //变量声明
        sampler2D _MainTex;//主纹理
        sampler2D _BumpMap;//凹凸纹理
        //3.表面着色函数的编写
        void surf (Input IN, inout SurfaceOutput o) 
        {
            //从主纹理获得rgb的颜色值
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
            //从凹凸纹理获得rgb的颜色值
            o.Normal  =UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
        }
        //结束CG着色编程语言段
        ENDCG
    
    }
    Fallback "Diffuse"
}