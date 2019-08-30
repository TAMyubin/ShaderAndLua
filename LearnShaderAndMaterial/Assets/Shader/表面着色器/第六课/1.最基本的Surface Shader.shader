Shader"表面着色器/24.最基本的SurfaceShader"
{
	//子着色器
	SubShader
	{
		//子着色器标签
		Tags{"RenderType" = "Queue"}
		//开启CG着色器编程语言段
		CGPROGRAM
		//1.光照模式声明，开启兰伯特光照模式
		#pragma surface surf Lambert
		//2.输入结构
		struct Input
	{
		//四元素的颜色值(RGBA)
		float4 color : COLOR;
	};
	//3.表面着色器的编写
	void surf(Input IN, inout SurfaceOutput o)
	{
		//反射率
		o.Albedo = float3(0.5, 0.8, 0.3);//分别对应RGB分量
		//o.Albedo = 0.6；等效于o.Albedo = float3(0.6,0.6,0.6)
	}
	//结束CG着色器编程语言段
	ENDCG
	}
		//备胎
		Fallback"Diffuse"
}