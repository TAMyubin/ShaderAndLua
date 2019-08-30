
Shader "Unlit/Snow"
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
		//渲染类型设置：不透明
		Tags { "RenderType"="Transparent" "Queue" = "Transparent" "IgnoreProjector" = "True" }

		ZWrite Off 
		Blend SrcAlpha OneMinusSrcAlpha
		Cull Off
		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag

			// 着色器变体快捷编译指令：雾效。编译出几个不同的Shader变体来处理不同类型的雾效(关闭/线性/指数/二阶指数)
			#pragma multi_compile_fog

			//包含头文件
			#include "UnityCG.cginc"

			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//纹理坐标
			};

			//顶点着色器输出结构
			struct v2f
			{
				float2 uv : TEXCOORD0;//纹理坐标
				UNITY_FOG_COORDS(1)//雾数据
				float4 vertex : SV_POSITION;//像素位置
			};

			//变量声明
			sampler2D _MainTex;
					//声明_MainTex是一张采样图，进行UV运算，没有这句话不能进行TRANSFORM_TEX运算			
			float4 _MainTex_ST;		
			float3 _TargetPosition; //摄像机的正前方位置
			float _Range;
			float _RangeR; //范围的倒数
			float _Size;
			float3 _Move;
			float3 _CamUp; //摄像机的正上方
//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			v2f vert (appdata v)
			{
				float3 target = _TargetPosition;
				float3 mv = v.vertex.xyz;
				mv += _Move;
				float3 trip;
				//trip的范围是0~1， 为让雪花始终在摄像机的正前方
				trip = floor(((target - mv) * _RangeR + 1) * 0.5);
				trip *= (_Range * 2);
				mv += trip;

				//让顶点始终保持在摄像机的正上方
				float3 dis = _CamUp * _Size;
				float3 finalPos;
				float3 dv = mv;
				//从给定的局部坐标到摄像机坐标进行转换，目的是让顶点始终朝向摄像机
				float3 eyeVector = ObjSpaceViewDir(float4(dv,0));
				float3 side = normalize(cross(eyeVector,dis));

				dv += (v.vertex.x - 0.5) * side * _Size;
				dv += (v.vertex.y - 0.5) * dis;
				finalPos = dv;

				v2f o;
				o.vertex = UnityObjectToClipPos(float4(finalPos,1));
				//通过纹理变换矩阵 调整uv值  实现正常偏转
				o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0,v.vertex);

				return o;
			}
			
			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//采样主纹理在对应坐标下的颜色值
				fixed4 col = tex2D(_MainTex, i.uv);

				//返回最终的颜色值
				return tex2D(_MainTex, i.uv);
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
