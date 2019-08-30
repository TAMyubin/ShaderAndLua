// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "Unlit/Dissovle"//消融效果
{
	//------------------------------------【属性值】------------------------------------
	Properties
	{
		//主纹理
		_MainTex ("Texture", 2D) = "white" {}
		_DissovleTex("噪声贴图",2D) = "white"{}
		_DissovleRim ("阈值", Range(0.0, 1.0)) = 0
		_ColorA ("ColorA", Color) = (1.0, 1.0, 1.0, 1.0)
		_ColorB ("ColorB", Color) = (1.0, 1.0, 1.0, 1.0)
		//控制模型溶解效果的边缘区间
		_LineWidth("线条宽度",Range(0,0.5)) = 0.5
	}
	//溶解效果：想让角色的身体一块块的消失，让角色身体上的部位不进行渲染，需要一张额外的贴图来控制
	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		//渲染类型设置：不透明
		Tags { "RenderType"="Opaque" }

		//细节层次设为：200
		LOD 100

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
			#include "Lighting.cginc"
			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//纹理坐标
				float3 normal :NORMAL;//法线
			};

			//顶点着色器输出结构
			struct v2f
			{
				float2 uv : TEXCOORD0;//纹理坐标
				UNITY_FOG_COORDS(1)//雾数据
				float4 vertex : SV_POSITION;//像素位置
				float3 worldNormal :TEXCOORD1;
			};

			//变量声明
			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _DissovleTex;
			float _DissovleRim;
			fixed4 _ColorA;
			fixed4 _ColorB;
			float _LineWidth;
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			v2f vert (appdata v)
			{
				//【1】实例化一个输入结构体
				v2f o;
				//【2】填充此输出结构
				//输出的顶点位置（像素位置）为模型视图投影矩阵乘以顶点位置，也就是将三维空间中的坐标投影到了二维窗口
				o.vertex = UnityObjectToClipPos(v.vertex);
				//【3】用UnityCG.cginc头文件中内置定义的宏,根据uv坐标来计算真正的纹理上对应的位置（按比例进行二维变换）			
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				//【5】返回此输出结构对象
				return o;
			}
			
			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
				//【1】采样主纹理在对应坐标下的颜色值
				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 diss = tex2D(_DissovleTex,i.uv);
				clip(diss.r - _DissovleRim);
				//计算环境光 + 漫反射
				float3 ambint = UNITY_LIGHTMODEL_AMBIENT.xyz * col;
				fixed3 worldNormal = normalize(i.worldNormal);
				//得到世界空间下光的方向
				float3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
				float3 diffuse = _LightColor0.xyz * col * max(0,dot(worldNormal,worldLightDir));
				float3 albedo = ambint + diffuse;
				//smoothstep (a,b,x)平滑过渡函数
				//如果 x < a 返回0，如果 x < b 返回1，如果 a<x<b,则返回3*pow(x,2)-2*pow(x,3)
				//如果t = 0则返回模型颜色,如果t = 1返回溶解的边界值

				fixed t = 1-smoothstep(0,_LineWidth,diss.r - _DissovleRim);
				//最终颜色，在消融和正常中插值
				fixed3 color = lerp(_ColorA,_ColorB,t);
				fixed3 finalColor  =lerp(albedo,color,t);
				//【3】返回最终的颜色值
				return fixed4(finalColor,1) ;
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
		Pass{
			//把光照模式定义为阴影
			Tags { "LightMode" = "ShadowCaster" }
			CGPROGRAM
				//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag
			// 着色器变体快捷编译指令：雾效。编译出几个不同的Shader变体来处理不同类型的雾效(关闭/线性/指数/二阶指数)
			#pragma multi_compile_shadowcaster

			//包含头文件
			#include "UnityCG.cginc"
			fixed _DissovleRim;
			sampler2D _DissovleTex;
			float4 _DissovleTex_ST;
			//输入结构
			struct appdata{
				float4 vertex :POSITION;//顶点位置
				float2 uv:TEXCOORD0;//纹理坐标
				float3 normal:NORMAL;
			};
			struct v2f{
				//定义阴影投影
				V2F_SHADOW_CASTER;
				float2 uvDissovle:TEXCOORD0;
			};
			v2f vert(appdata v){
				v2f o;
				//填充阴影投影变量
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				o.uvDissovle = TRANSFORM_TEX(v.uv,_DissovleTex);
				return o;
			}
			fixed4 frag(v2f i):SV_Target
			{
				fixed3 burn = tex2D(_DissovleTex,i.uvDissovle);
				clip(burn.r - _DissovleRim);
				SHADOW_CASTER_FRAGMENT(i);
			}
			ENDCG
		}
	}
}
