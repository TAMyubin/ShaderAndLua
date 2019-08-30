Shader "表面着色器/31.细节纹理" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _Detail("细节纹理",2D) = "gray"{}
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        #pragma surface surf Lambert
        struct Input
        {
            //主纹理uv
            float2 uv_MainTex;
            //细节纹理uv
            float2 uv_Detail;
        };
        sampler2D _MainTex;
        sampler2D _Detail;
        void surf(Input IN, inout SurfaceOutput o)
        {
            //从主纹理获取rgb颜色值
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
            o.Albedo *= tex2D(_Detail,IN.uv_Detail).rgb *2;
        }
        ENDCG
    }

    Fallback "Diffuse"
}