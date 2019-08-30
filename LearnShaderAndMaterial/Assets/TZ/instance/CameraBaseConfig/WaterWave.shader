// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/WaterWave"
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

			//变量的声明
			sampler2D _MainTex;
			float _Distance;//距离系数
			float _TimeFactor;//时间系数
			float _Total;//sin函数的结果系数
			float _WaveWidth;//波纹的宽度
			float _WaveDis;//往外扩散的距离
			float3 _StartPos;//波纹开始的位置
			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//计算uv到中间点的向量，向外扩散
			//	float2 dv = float2(0.5,0.5) - i.uv;
			float dv = _StartPos.xy -i.uv;
			dv = dv*float2(_ScreenParams.x/_ScreenParams.y,1);
				//float dis = sqrt(dv.x * dv.x + dv.y *dv.y);
				float dis = distance(_StartPos.xy,i.uv);
				//用sin函数计算出波纹偏移值
				//dis的长度小于1,需要乘一个距离系数，使得波纹有多个波峰波谷
				//sin函数的值域是[-1,1],乘以结果系数是为了使波纹高低更明显，乘0.01是为了降低偏移值
				float sinFactor = sin(dis *_Distance + _Time.y * _TimeFactor)*_Total * 0.01;
				//距离当前波纹运动点的距离，如果小于宽度就保留，否则就丢弃
				float disFactor = clamp(_WaveWidth - abs(_WaveDis - dis),0,1);
				//归一化
				float2 dv1 = normalize(dv);
				//计算每个像素uv的偏移值
				float2 offset = dv1 * sinFactor * disFactor;
				float2 uv = offset + i.uv;
				return tex2D(_MainTex,uv);
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
