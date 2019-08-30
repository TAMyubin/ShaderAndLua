// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "实例/融合地球仪" 
{
	//------------------------------------【属性值】------------------------------------
	Properties 
	{
		//混合纹理
		_Cloud("混合图",2D) = "white"{}
		//主纹理
		_MainTex ("Albedo (RGB)", 2D) = "white" {}

	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader 
	{
		//【注意：Surface Shader不能使用Pass，直接在SubShader中实现即可】

		//渲染类型设置：透明
		Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" }

		AlphaTest Greater 0.1
		Pass{


		//===========开启CG着色器语言编写模块===========
		CGPROGRAM
		//使用Vertex and Fragment Shader可编程渲染管线
		#pragma vertex vert
		#pragma fragment frag
		//为了引入系统自带的结构体appdata_base
		#include "UnityCG.cginc"
		//变量的声明
		float4 _Color;
		sampler2D _MainTex;
		sampler2D _Cloud;
		//获取地球材质的纹理坐标
		float4 _MainTex_ST;
		//定义输出结构
		struct v2f{
			float4 pos:SV_POSITION;//视口位置
			float2 uv:TEXCOORD0;//贴图纹理坐标
		};
	//操作顶点
	v2f vert(appdata_base v){
		v2f o;
		///model从本地坐标到世界坐标
		//view从世界坐标到相机坐标
		//projection从相机坐标到屏幕空间
		//使用mul转化为投影坐标pos
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv = TRANSFORM_TEX(v.texcoord,_MainTex);
		return o;
	}
	half4 frag(v2f i) : COLOR{
		//移动地球材质的x
		float u_x = i.uv.x + -2 *_Time;
		float2 uv_earth = float2(u_x,i.uv.y);
		half4 texcolor_earth = tex2D(_MainTex,uv_earth);
		//移动白云材质的x
		u_x = i.uv.x + -4 * _Time;
		float2 uv_cloud = float2(u_x,i.uv.y);
		half4 tex_cloudDepth = tex2D(_Cloud,uv_cloud);
		//白色透明的点 *包含cloud纹理的R通道色值 = 带纹理的黑白点（RGB值一样，且值为x）
		//因为A是0，所有其实这里白云不可见的
		//写法等同于float4(tex_cloudDepth.x;tex_cloudDepth.x,tex_cloudDepth.x,0*tex_cloudDepth.x);
		half4 texcolor_cloud = float4(1,1,1,0) * (tex_cloudDepth.x);
		//地球与白云的纹理混合，很显然包括A通道，所以才能看到白云
		return lerp(texcolor_earth,texcolor_cloud,0.5f);
	}

		//===========结束CG着色器语言编写模块===========
		ENDCG
	}
	} 
	//备胎为漫反射
	FallBack "Diffuse"
}
