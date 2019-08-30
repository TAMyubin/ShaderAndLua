// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/GaussionBlur"
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		//模糊采样距离
		_BlurSize("模糊采样距离",Float) = 1
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
		//头文件 公有变量
		CGINCLUDE
		#include "UnityCG.cginc"
		sampler2D _MainTex;
		float4 _MainTex_TexelSize;
		float _BlurSize;
		//输出结构
		struct v2f{
			float4 pos:SV_POSITION;//纹理坐标
			float2 uv[5]:TEXCOORD0;
		};
		//顶点着色器
		v2f vertBlurVertical(appdata_img v){
			v2f o;
			o.pos = UnityObjectToClipPos(v.vertex);

			float2 uv = v.texcoord;
			//采样
			o.uv[0] = uv;
			o.uv[1] = uv+ float2(0,_MainTex_TexelSize.y*1)*_BlurSize;
			o.uv[2] = uv- float2(0,_MainTex_TexelSize.y*1)*_BlurSize;
			o.uv[3] = uv+ float2(0,_MainTex_TexelSize.y*2)*_BlurSize;
			o.uv[4] = uv- float2(0,_MainTex_TexelSize.y*2)*_BlurSize;
			return o;
		}
		v2f vertBlurHorizontal(appdata_img v){
				v2f o;
			o.pos = UnityObjectToClipPos(v.vertex);
			float2 uv = v.texcoord;
			//采样
			o.uv[0] = uv;
			o.uv[1] = uv+ float2(_MainTex_TexelSize.x*1,0)*_BlurSize;
			o.uv[2] = uv- float2(_MainTex_TexelSize.x*1,0)*_BlurSize;
			o.uv[3] = uv+ float2(_MainTex_TexelSize.x*2,0)*_BlurSize;
			o.uv[4] = uv- float2(_MainTex_TexelSize.x*2,0)*_BlurSize;
			return o;
		}

		//片段着色器
		fixed4 fragBlur(v2f i):SV_Target
		{
			//标准方差为1的高斯核的权重分布
			float weight[3] = {0.4026,0.2442,0.0545};
			//中心点
			fixed3 sum = tex2D(_MainTex,i.uv[0]).rgb * weight[0];
			//周围4个点
			for(int j=1;j<3;j++){
				sum+=tex2D(_MainTex,i.uv[j*2-1]).rgb*weight[j];
				sum+=tex2D(_MainTex,i.uv[j*2]).rgb*weight[j];
			}
			return fixed4(sum,1);
		}
		ENDCG
		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vertBlurVertical
			#pragma fragment fragBlur
			

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
				Pass
		{
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vertBlurHorizontal
			#pragma fragment fragBlur
			
			
			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
