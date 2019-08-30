Shader "表面着色器/36.自制半Lambert光照" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        //光照模式：使用自制的半兰伯特光照模式
        #pragma surface surf TamHalfLambert

        half4 LightingTamHalfLambert(SurfaceOutput s,half3 lightDir ,half atten)
        {
            half NdotL = max(0,dot(s.Normal,lightDir));
            //在兰伯特光照的基础上加这句，增强光强
            float hLambert = NdotL * 0.5+0.5;
            half4 color;
            //修改这句的相关参数
            color.rgb = s.Albedo * _LightColor0.rgb * (hLambert* atten*2);
            color.a = s.Alpha;
            return color;
        }
        struct Input
        {
            float2 uv_MainTex;
        };
        sampler2D _MainTex;
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rbg;
        }
        ENDCG
    
    }

    Fallback "Diffuse"
}