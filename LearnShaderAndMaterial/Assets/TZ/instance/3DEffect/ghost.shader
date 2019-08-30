// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "Unlit/ghost"//残影效果
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		_Color("颜色",Color) = (1,1,1,1)
	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		//渲染类型设置：不透明
		Tags { "RenderType"="Opaque" "Queue" = "Transparent"}

		//细节层次设为：200
		LOD 100

		//--------------------------------唯一的通道-------------------------------
		//渲染X光效果
		Pass
		{
			//ZTest Greater
				//ZWrite Off
				Blend SrcAlpha One
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag

			// 着色器变体快捷编译指令：雾效。编译出几个不同的Shader变体来处理不同类型的雾效(关闭/线性/指数/二阶指数)
			#pragma multi_compile_fog

			//包含头文件
			#include "UnityCG.cginc"

			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//纹理坐标
				float3 normal :NORMAL;
			};

			//顶点着色器输出结构
			struct v2f
			{
				float2 uv : TEXCOORD0;//纹理坐标
				float4 vertex : SV_POSITION;//像素位置
				float3 normal:NORMAL;
				float3 viewDir :TEXCOORD1;
			};

			//变量声明
			float4 _Color;
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
	
				//ObjSpaceViewDir得到模型空间顶点到摄像机的观察方向
				o.viewDir = ObjSpaceViewDir(v.vertex);
				o.normal = v.normal;
				//【5】返回此输出结构对象
				return o;
			}
			
			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//【1】采样主纹理在对应坐标下的颜色值
				float3 normal = normalize(i.normal);
				float3 viewDir = normalize(i.viewDir);
				float rim = 1-dot(normal,viewDir);

				//【3】返回最终的颜色值
				return rim*_Color;
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
