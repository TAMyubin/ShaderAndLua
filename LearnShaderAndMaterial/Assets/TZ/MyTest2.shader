// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "Unlit/MyTest2"
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		_CutOff("透明度",Range(0,1)) = 0.5
		_Color("反射光颜色",Color) = (1,1,1,1)
	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		//渲染类型设置：不透明
				Tags{ "Queue" = "AlphaTest" "IgnoreProjector" = "true" "RenderType" = "Transparent" }

		//细节层次设为：200
		LOD 100

		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			Tags { "LightMode" = "ForwardBase" }
				Cull Off
				ZTest Less
				ZWrite Off
				Blend SrcAlpha OneMinusSrcAlpha
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag
			//包含头文件
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//纹理坐标
				float3 normal: NORMAL;//法线向量坐标
			};

			//顶点着色器输出结构
			struct v2f
			{
				float2 uv : TEXCOORD0;//纹理坐标
				float3 worldNormal : TEXCOORD1;//世界空间的法线坐标
				float3 worldPos:TEXCOORD2;//世界空间的坐标位置
				float4 vertex : SV_POSITION;//像素位置
			};

			//变量声明
			sampler2D _MainTex;
			float4 _MainTex_ST;
			fixed _CutOff;
			fixed4 _Color;
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			v2f vert (appdata v)
			{
				//【1】实例化一个输入结构体
				v2f o;
				//【2】填充此输出结构
				//输出的顶点位置（像素位置）为模型视图投影矩阵乘以顶点位置，也就是将三维空间中的坐标投影到了二维窗口
				o.vertex = UnityObjectToClipPos(v.vertex);
				//计算世界空间下的法线向量
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				//计算世界空间的顶点坐标，
				o.worldPos = mul(unity_ObjectToWorld,v.vertex);
			
				o.uv = TRANSFORM_TEX(v.uv,_MainTex);
				//【5】返回此输出结构对象
				return o;
			}
			
			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//归一化得到单位向量
				float3 worldNormal = normalize(i.worldNormal);
				//UnityWorldSpaceLightDir 从世界空间中的顶点坐标得到这个点到光源的方向
				float3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
				//【1】采样主纹理在对应坐标下的颜色值
				fixed4 col = tex2D(_MainTex, i.uv);
				//结果小于0，就丢弃
				//clip(col.a - _CutOff);
				//反射颜色
				fixed3 albedo =col.rgb * _Color.rgb;
				//环境光
				fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz * albedo;
				//漫反射 Diffuse = LightColor * MainColor * max(0,dot(N,L))
				//LightColor:光源颜色，MainColor：材质漫反射颜色
				//N:法线方向，L：光源的单位矢量 max函数防止法线与光源点乘的结果为负数
				//_LightColor0 表示第一个直射光颜色
				fixed3 diffuse = _LightColor0.rgb * albedo * max(0,dot(worldNormal,worldLightDir));
				//【3】返回最终的颜色值
				return fixed4(ambient + diffuse,col.a*_CutOff);
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
