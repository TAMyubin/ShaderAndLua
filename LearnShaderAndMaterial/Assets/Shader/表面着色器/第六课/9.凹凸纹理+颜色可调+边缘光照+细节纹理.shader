Shader "表面着色器/32.凹凸纹理+颜色可调+边缘光照+细节纹理" {
    //属性
    Properties {
        _MainTex("主纹理",2D) = "white"{}
        _BumpMap("凹凸纹理",2D) = "bump"{}
        _Detail("细节纹理",2D) = "gray"{}
        _ColorTint ("色泽", Color) = (0.6, 0.3, 0.6, 0.3)
        _RimColor ("边缘颜色", Color) = (0.26, 0.19, 0.16, 0)
        _RimPower ("边缘颜色强度", Range(0.5, 8.0)) = 3.0
    }
    //子着色器
    SubShader {
        //标签
        Tags { "RenderType" = "Opaque" }
        //开启CG着色编程语言段
        CGPROGRAM
        //定义光照模式：兰伯特光照 + 自定义颜色函数
        #pragma surface surf Lambert finalcolor:setcolor
        //输入结构
        struct Input{
            //主纹理uv
            float2 uv_MainTex;
            //凹凸纹理uv
            float2 uv_BumpMap;
            //细节纹理uv
            float2 uv_Detail;
            //当前坐标视线方向
            float3 viewDir;
        };
        //定义变量
        sampler2D _MainTex;
        sampler2D _BumpMap;
        sampler2D _Detail;
        fixed4 _ColorTint;
        float4 _RimColor;
        float _RimPower;
        //自定义颜色函数编写
        void setcolor(Input IN,SurfaceOutput o,inout fixed4 color){
            color *= _ColorTint;
        }
        //4.表面着色函数的编写
        void surf(Input IN,inout SurfaceOutput o){
            //先从主纹理获取rgb颜色值
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
            //设置细节纹理
            o.Albedo *=tex2D(_Detail,IN.uv_Detail).rgb*2;
            //从凹凸纹理获取法线值
            o.Normal = UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
            //从_RimColor参数获取自发光颜色
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir),o.Normal));
            o.Emission = _RimColor.rgb * pow(rim,_RimPower);
        }
        ENDCG
    
    }

    Fallback "Diffuse"
}