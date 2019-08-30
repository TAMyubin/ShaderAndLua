// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "H/Flash"
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		//流光贴图
		_Flash("流光贴图",2D) = "white"{}
		//移动速度
		_ScrollXSpeed("X速度",Range(0,1)) = 0.5
		_ScrollYSpeed("Y速度",Range(0,1)) = 0
		_Scroll("方向",Range(-1,1)) = 0
	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		Tags { "Queue" = "Transparent" "RenderType" = "Opaque" }
		//关闭剔除操作
		//Cull Off 
		//关闭深度写入模式
		//ZWrite Off 
		//设置深度测试模式:渲染所有像素.等同于关闭透明度测试（AlphaTest Off）
		//ZTest Always

		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			Blend One OneMinusSrcAlpha
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM
	
			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag
			
			//包含头文件
			#include "UnityCG.cginc"

			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//一级纹理坐标
				float4 color:COLOR;//颜色
			};

			//顶点着色器输出结构（v2f，vertex to fragment）
			struct v2f
			{
				float2 uv : TEXCOORD0;//一级纹理坐标
				float4 vertex : SV_POSITION;//像素位置
				float4 color:COLOR;//颜色
				float2 flash : TEXCOORD1;
			};
	//变量的声明
			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _Flash;
			float4 _Flash_ST;
			fixed _ScrollXSpeed;
			fixed _ScrollYSpeed;
			fixed _Scroll;
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			//顶点着色函数
			v2f vert (appdata v)
			{
				//【1】实例化一个输入结构体
				v2f o;

				//【2】填充此输出结构
				//输出的顶点位置（像素位置）为模型视图投影矩阵乘以顶点位置，也就是将三维空间中的坐标投影到了二维窗口
				o.vertex = UnityObjectToClipPos(v.vertex);
				//输入的UV纹理坐标为顶点输出的坐标
				o.uv = TRANSFORM_TEX(v.uv,_MainTex);
				//流光移动的速度与方向
				o.flash = TRANSFORM_TEX(v.uv,_Flash) + float2(_ScrollXSpeed,_ScrollYSpeed) * _Time.y*_Scroll;
				//【3】返回此输出结构对象
				return o;
			}

		

			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//【1】采样主纹理在对应坐标下的颜色值
				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 fla = tex2D(_Flash,i.flash);
				fla.rgb *= col.rgb;
				col.rgb +=fla.rgb *2;
				col.rgb *=col.a;

				//【3】返回最终的颜色值
				return col;
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
