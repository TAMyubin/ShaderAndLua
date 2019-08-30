Shader "表面着色器/34.自定义高光" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        //光照模式：使用自定义的光照模式
        #pragma surface surf SimpleSpecular
        //实现自定义的光照模式SimpleSpecular
        half4 LightingSimpleSpecular (SurfaceOutput s,half3 lightDir,half3 viewDir,half atten)
        {
            half3 h = normalize(lightDir + viewDir);
            half diff = max(0,dot(s.Normal,lightDir));
            float nh = max(0,dot(s.Normal,h));
            float spec = pow(nh,48.0);
            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb*spec)*(atten * 2);
            c.a = s.Alpha;
            return c;
        }
        struct Input
        {
            float2 uv_MainTex;
        };
        //变量声明
        sampler2D _MainTex;
        void surf(Input IN,inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;

        }
        ENDCG
    
    }

    Fallback "Diffuse"
}