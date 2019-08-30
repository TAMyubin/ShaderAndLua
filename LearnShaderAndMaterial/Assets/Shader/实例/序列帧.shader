
Shader "实例/序列帧" 
{
	//------------------------------------【属性值】------------------------------------
	Properties 
	{
		//主颜色
		_Color ("Color", Color) = (1,1,1,1)
		//主纹理
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		//行数
		_SizeX("列",Float) = 4
		_SizeY("行",Float) = 2
		_Speed("播放速度",Float) = 150
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
		#pragma surface surf Lambert alpha
		//编译指令: 指定着色器编译目标为Shader Model 3.0
		#pragma target 3.0

		//变量的声明
		sampler2D _MainTex;
		fixed4 _Color;
		uniform fixed _SizeX;
		uniform fixed _SizeY;
		uniform fixed _Speed;
		//表面输入结构
		struct Input 
		{
			float2 uv_MainTex;//纹理坐标
		};
		void surf(Input IN, inout SurfaceOutput o) 
		{
			//获取单元格UV
		float2 cellUV = float2(IN.uv_MainTex.x/_SizeX,IN.uv_MainTex.y/_SizeY);
		//UV坐标值范围为0-1，获取单元格宽度
		float deltaX = 1/_SizeX;//单元格增量宽度
		float deltaY = 1/_SizeY;//单元格增量高度
		//当前播放总索引
		int index = _Time * _Speed;
		//求列索引
		int col = fmod(index,_SizeX);
		//求行索引
		int row = index/_SizeX;
		//原始UV + 当前格增量
		cellUV.x +=col * deltaX;
		cellUV.y += row *deltaY;
		//创建tex2d（材质，uv）*主颜色
		fixed4 c = tex2D(_MainTex, cellUV)* _Color;

			//【2】将准备好的颜色的rgb分量作为漫反射颜色
			o.Albedo = c.rgb;
			//【5】将准备好的颜色的alpha分量作为Alpha分量值
			o.Alpha = c.a;
		}

		//===========结束CG着色器语言编写模块===========
		ENDCG
	} 
	//备胎为漫反射
	FallBack "Diffuse"
}
