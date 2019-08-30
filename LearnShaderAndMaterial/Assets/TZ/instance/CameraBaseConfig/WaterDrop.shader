// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/WaterDrop"
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		//屏幕水滴效果贴图
		_WaterDropTex("水滴效果",2D) = "white"{}
		//X坐标上的水滴尺寸
		_SizeX("X坐标",Float)= 1
		_SizeY("Y坐标",Float) = 1
		//时间
		_CurTime("时间",Float) = 1
		//水滴流动速度
		_DropSpeed("速度",Float) = 1
		//溶解度
		_Distor("溶解度",Float) =0.7
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
			sampler2D _WaterDropTex;
			float _CurTime;
			float _DropSpeed;
			float _SizeX;
			float _SizeY;
			float _Distor;//溶解度
			float4 _MainTex_TexelSize;//纹理坐标
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
				float2 uv = i.uv;
				//设置多层水流效果,按照一定的规律在水滴纹理上分别进行采样
				float3 rainTex1 = tex2D(_WaterDropTex,float2(uv.x * _SizeX * 1.2,uv.y*_SizeY*1.1)+ _CurTime*_DropSpeed *0.2).rgb/_Distor;
				float3 rainTex2 = tex2D(_WaterDropTex,float2(uv.x*_SizeY*1.3,uv.y*_SizeY*1.2)+_CurTime*_DropSpeed*0.25).rgb/_Distor;
				float3 rainTex3 = tex2D(_WaterDropTex,float2(uv.x*_SizeY*1.4,uv.y*_SizeY*1.3)+_CurTime*_DropSpeed*0.3).rgb/_Distor;
				float3 rainTex4 = tex2D(_WaterDropTex,float2(uv.x*_SizeY*1.1,uv.y*_SizeY*0.9)+_CurTime*_DropSpeed*0.15).rgb/_Distor;
				//整合水流效果
				float2 finalRainTex = uv.xy -(rainTex1.xy - rainTex2.xy - rainTex3.xy - rainTex4.xy)/4;
				float3 finalColor = tex2D(_MainTex,float2(finalRainTex.x,finalRainTex.y)).rgb;
				return fixed4(finalColor,1);

			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
