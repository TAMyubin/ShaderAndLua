Shader "Hidden/BrightnessSaturationAndContrast"//屏幕设置
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		//亮度
		_Brightness ("Brightness",Float) = 1
		//饱和度
		_Saturation ("Saturation",Float) = 1
		//对比度
		_Contrast ("Contrast",Float) = 1
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
			//变量的声明
			sampler2D _MainTex;
			float _Brightness;
			float _Saturation;
			float _Contrast;
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			//顶点着色函数
			v2f vert (appdata v)
			{
				//实例化一个输入结构体
				v2f o;

				//将顶点坐标变换到裁剪空间中
				o.vertex = UnityObjectToClipPos(v.vertex);
				//输入的UV纹理坐标为顶点输出的坐标
				o.uv = v.uv;

				//返回此输出结构对象
				return o;
			}

			

			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex,i.uv);
				//亮度 = 纹理颜色*亮度
				fixed3 finalColor = col.rgb * _Brightness;

				//饱和度 根据公式计算同等亮度下饱和度最低的值
				fixed min = 0.2125 * col.r + 0.7154 * col.g + 0.0721 * col.b;
				fixed3 minColor = fixed3(min,min,min);
				//让饱和度在最低和原图之间作插值
				finalColor = lerp(minColor,finalColor,_Saturation);
				//计算对比度最低的值
				fixed3 contColor = fixed3(0.5,0.5,0.5);
				finalColor = lerp(contColor,finalColor,_Contrast);

				return fixed4(finalColor,col.a);
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
