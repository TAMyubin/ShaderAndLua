
Shader "Custom/自发光" 
{
	//------------------------------------【属性值】------------------------------------
	Properties 
	{
			_MainTex ("Texture", 2D) = "white" {}
		//混合纹理
		_BumpMap("混合纹理",2D) = "bump"{}
		//边缘颜色
		_RimColor ("边缘颜色", Color) = (1.0, 1.0, 1.0, 1.0)
		//边缘颜色强度
		_RimPower("边缘颜色强度",Range(0.1,10)) = 3
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
		sampler2D _BumpMap;
		float4 _RimColor;
		float _RimPower;
		//表面输入结构
		struct Input 
		{
			float2 uv_MainTex;//纹理坐标
			float2 uv_BumpMap;//混合纹理
			float3 viewDir;//视线方向
		};
		void surf(Input IN, inout SurfaceOutputStandard o) 
		{
			//【1】漫反射颜色为主纹理对应的纹理坐标，并乘以主颜色
			half4 c= tex2D(_MainTex,IN.uv_MainTex);
			//【2】将准备好的颜色的rgb分量作为漫反射颜色
			o.Albedo = c.rgb;
			//【5】将准备好的颜色的alpha分量作为Alpha分量值
			o.Alpha = c.a;
			//获取法线值【UnpackNormal是unity自带的标准解压法线用的
			o.Normal = UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
			//viewDir点到相机的向量归一与该点的法线求点乘，得出余弦值【0-1】，如果两条线平行方向一样 值=1，相反等于-1，垂直为0
			//所有越靠近边缘值越小，saturate相当于mathf。clamp（value，0.1）
			//如果1-这个值，越靠近边缘，rim越大，自发光越强
			half rim = 1.0-saturate(dot(normalize(IN.viewDir),o.Normal));
			//pow是求幂函数，所以rim越大，效果越明显
			o.Emission = _RimColor.rgb * pow(rim,_RimPower);
		}

		//===========结束CG着色器语言编写模块===========
		ENDCG
	} 
	//备胎为漫反射
	FallBack "Diffuse"
}
