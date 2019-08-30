// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/MotionBlur"
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		//关闭剔除操作
		Cull Off 
		//关闭深度写入模式
		ZWrite Off 
		//设置深度测试模式:渲染所有像素.等同于关闭透明度测试（AlphaTest Off）
		ZTest Always

		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag
			
			//包含头文件
			#include "UnityCG.cginc"
			//宏定义 采样个数
			#define VALUE 6
			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//一级纹理坐标
			};

			//顶点着色器输出结构（v2f，vertex to fragment）
			struct v2f
			{
				float2 uv : TEXCOORD0;//一级纹理坐标
				float4 vertex : SV_POSITION;//像素位置
			};
			//变量的声明
			sampler2D _MainTex;
			float2 _BlurCenter;//模糊中心点
			float _BlurRim;//模糊强度
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
				o.uv = v.uv;

				//【3】返回此输出结构对象
				return o;
			}

	

			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//模糊方向为模糊中心点指向边缘
				float2 dir = i.uv - _BlurCenter;
				float4 color = float4(0,0,0,0);
				for(int j = 0;j<VALUE;j++){
					//计算uv采样，正常uv + 从中间点向边缘逐渐增加的采样距离
					float2 uv = i.uv + _BlurRim * dir * j;
					color +=tex2D(_MainTex,uv);
				}
				color /=VALUE;
				return color;
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
