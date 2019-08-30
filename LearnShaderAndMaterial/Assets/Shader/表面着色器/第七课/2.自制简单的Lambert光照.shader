﻿Shader "表面着色器/35.自制简单的Lambert光照" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        //光照模式声明：使用自制的兰伯特光照模式
        #pragma surface surf TamLambert
        half4 LightingTamLambert(SurfaceOutput s,half3 lightDir, half atten){
            half NdotL = max(0,dot(s.Normal,lightDir));
            half4 color;
            color.rgb = s.Albedo * _LightColor0.rgb *(NdotL * atten * 2);
            color.a = s.Alpha;
            return color;
        }
        struct Input
        {
            float2 uv_MainTex;
        };
        sampler2D _MainTex;
        void surf(Input IN,inout SurfaceOutput o){
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"
}