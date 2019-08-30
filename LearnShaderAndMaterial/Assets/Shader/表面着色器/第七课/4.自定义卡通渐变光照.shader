Shader "表面着色器/37.自定义卡通渐变光照" {
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _Ramp("渐变纹理",2D) = "gray"{}
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        //光照模式声明：使用自制的卡通渐变光照模式
        #pragma surface surf Ramp
        sampler2D _Ramp;
        half4 LightingRamp(SurfaceOutput s,half3 lightDir,half atten)
        {
            //点乘反射光线法线和光线方向
            half NdotL = dot(s.Normal,lightDir);
            //增强光强
            half diff = NdotL * 0.5+0.5;
            half3 ramp = tex2D(_Ramp,float2(diff,diff)).rgb;
            //计算出最终结果
            half4 color;
            color.rgb = s.Albedo * _LightColor0.rgb * ramp*(atten * 2);
            color.a = s.Alpha;
            return color;
        }
        struct Input
        {
            float2 uv_MainTex;
        };
        sampler2D _MainTex;
        void surf(Input IN,inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"
}