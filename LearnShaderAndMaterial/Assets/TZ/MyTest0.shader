
Shader "Custom/MyTest0" 
{
	//------------------------------------【属性值】------------------------------------
	Properties 
	{
	
		//主纹理
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Bump("法线",2D) = "white"{}
		_RimColor("高光颜色",Color) = (1,1,1,1)
		_RimPower("亮度",Range(2,10)) = 2
	
	}

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader 
	{
		//【注意：Surface Shader不能使用Pass，直接在SubShader中实现即可】

		//渲染类型设置：不透明
		Tags{ "RenderType" = "Opaque" }

		//细节层次设为：200
		LOD 200

		//===========开启CG着色器语言编写模块===========
		CGPROGRAM

		//编译指令：告知编译器表明着色函数的名称为surf
		//Standard表示光照模型为Unity标准版光照模型
		//fullforwardshadows表示在正向渲染路径中支持所有阴影类型
		#pragma surface surf Standard fullforwardshadows

		//编译指令: 指定着色器编译目标为Shader Model 3.0
		#pragma target 3.0

		//变量的声明
		sampler2D _MainTex;
		sampler2D _Bump;
		float4 _RimColor;
		float _RimPower;
		//表面输入结构
		struct Input 
		{
			float2 uv_MainTex;//纹理坐标
			float2 uv_Bump;
			float3 viewDir;//视线
		};



		//--------------------------------【表面着色函数】-----------------------------
		// 输入：表面输入结构体
		// 输出：Unity内置的SurfaceOutputStandard结构体
		// SurfaceOutputStandard原型如下：
		/*
			struct SurfaceOutputStandard
			{
				fixed3 Albedo;			// 漫反射颜色
				fixed3 Normal;			// 切线空间法线
				half3 Emission;			//自发光
				half Metallic;				// 金属度；取0为非金属, 取1为金属
				half Smoothness;		// 光泽度；取0为非常粗糙, 取1为非常光滑
				half Occlusion;			// 遮挡(默认值为1)
				fixed Alpha;				// 透明度
			};
		*/
		//---------------------------------------------------------------------------------
		void surf(Input IN, inout SurfaceOutputStandard o) 
		{

			//采样
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
			//获取法线信息
			o.Normal = UnpackNormal(tex2D(_Bump, IN.uv_Bump));
			//计算边缘光照的原理：通过视线与法线的夹角来找到模型的边缘，再根据距离的远近来控制光照的强度
			//saturate把值限制在[0-1]之间 ====clamp(2,3)
			half rim =1.0- saturate( dot(normalize(IN.viewDir),o.Normal));
			//边缘颜色强度	pow函数 pow(2,3)====2的3次方
			o.Emission  = _RimColor.rgb * pow(rim,_RimPower);
	
		}

		//===========结束CG着色器语言编写模块===========
		ENDCG
	} 
	//备胎为漫反射
	FallBack "Diffuse"
}
