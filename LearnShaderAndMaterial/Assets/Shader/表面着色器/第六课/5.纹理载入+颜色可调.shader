Shader "表面着色器/28.纹理+颜色修改" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _ColorTint ("色泽", Color) = (0.6, 0.3, 0.6, 0.3)
    }
    SubShader {
    Tags { "RenderType" = "Opaque" }
    //开启CG着色编程语言段
    CGPROGRAM
    //光照声明：使用兰伯特光照+自定义颜色函数

        #pragma surface surf Lambert finalcolor:setcolor
    struct Input
    {
        //纹理uv值
        float2 uv_MainTex;
    };
    //变量声明
    fixed4 _ColorTint;
    sampler2D _MainTex;
    //3.定义颜色函数setcolor的编写
    void setcolor(Input IN,SurfaceOutput o,inout fixed4 color){
        //将自选的颜色值乘给color
        color *= _ColorTint;
    }
    //4.表面着色函数的编写
    void surf(Input IN, inout SurfaceOutput o){
        //从主纹理获得rgb值
        o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
    }
    //结束CG着色编程语言段
    ENDCG
    }

    Fallback "Diffuse"
}