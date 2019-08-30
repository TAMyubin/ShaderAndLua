Shader "Hidden/SimpleBlur"
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
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				float2 uv4 : TEXCOORD4;
			};
			//变量的声明
			sampler2D _MainTex;
			//纹理像素的相关大小，width,height对应纹理的分辨率 x = 1 / width,y = 1 / height,z = width,w = height;
			float4 _MainTex_TexelSize;
			//模糊半径
			float _BlurRadius;
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			//顶点着色函数
			v2f vert (appdata_img v)
			{
				//实例化一个输入结构体
				v2f o;

				//将顶点坐标变换到裁剪空间中
				o.vertex = UnityObjectToClipPos(v.vertex);
				//输入的UV纹理坐标为顶点输出的坐标
				o.uv = v.texcoord.xy;

				o.uv1 = v.texcoord.xy + _BlurRadius * _MainTex_TexelSize * float2(1,1);
				o.uv2 = v.texcoord.xy + _BlurRadius * _MainTex_TexelSize * float2(-1,1);
				o.uv3 = v.texcoord.xy + _BlurRadius * _MainTex_TexelSize * float2(-1,-1);
				o.uv4 = v.texcoord.xy + _BlurRadius * _MainTex_TexelSize * float2(1,-1);
				//返回此输出结构对象
				return o;
			}

			

			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = fixed4(0,0,0,0);
				//采样主纹理在对应坐标下的颜色值
				col += tex2D(_MainTex, i.uv);
				col += tex2D(_MainTex, i.uv1);
				col += tex2D(_MainTex, i.uv2);
				col += tex2D(_MainTex, i.uv3);
				col += tex2D(_MainTex, i.uv4);
				//返回最终的颜色值
				return col * 0.2;
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
