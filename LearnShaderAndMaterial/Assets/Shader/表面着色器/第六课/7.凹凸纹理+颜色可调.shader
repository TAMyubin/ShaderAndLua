Shader "表面着色器/30.凹凸纹理+颜色可调+边缘光照" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _BumpMap("凹凸纹理",2D) = "white"{}
        _ColorTint ("色泽", Color) = (0.6, 0.3, 0.6, 0.3)
        _RimColor("边缘颜色",Color) = (0.26,0.19,0.16,0)
        _RimPower ("边缘颜色强度", Range(0.5, 8.0)) = 3.0
    }
    SubShader {
        Tags { "RendeType" = "Opaque" }
        CGPROGRAM
        //开启光照：兰伯特光照+自定义颜色函数
        #pragma surface surf Lambert finalcolor:setcolor
        struct Input
        {
            //主纹理uv
            float2 uv_MainTex;
            //凹凸纹理uv值
            float2 uv_BumpMap;
            //当前坐标的视角方向
            float3 viewDir;
        };
        //变量声明
        sampler2D _MainTex;
        sampler2D _BumpMap;
        fixed4 _ColorTint;
        float4 _RimColor;
        float _RimPower;
        //编写自定义颜色函数
        void setcolor(Input IN,SurfaceOutput o,inout fixed4 color)
        {
            color *= _ColorTint;
        }
        //表面着色器函数编写
        void surf(Input IN,inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
            o.Normal = UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
            //从_RimColor中获取自发光颜色
            half rim = 1.0- saturate(dot(normalize(IN.viewDir),o.Normal));
            o.Emission = _RimColor.rgb * pow(rim,_RimPower);
        }
        ENDCG
    }

    Fallback "Diffuse"
}