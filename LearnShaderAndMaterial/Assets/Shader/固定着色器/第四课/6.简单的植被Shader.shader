Shader"Shader编程/17.简单的植被Shader"
{
	Properties{
		_Color("主颜色",Color) = (0.5,0.5,0.5,0.5)
		_MainTex("主纹理",2D) = "white"{}
		_Cutoff("Alpha透明度阈值",Range(0,1)) = 0.5
		}
		SubShader{
		//定义材质
		Material{
		Diffuse[_Color]
		Ambient[_Color]
		}
			//开启灯光
		Lighting On
		//关闭裁剪 渲染所有面 用于接下来渲染几何体的两面
		Cull Off
			//--------------------------【通道一】-------------------------------
		//		说明：渲染所有超过[_Cutoff] 不透明的像素
		//----------------------------------------------------------------------

			Pass{
			AlphaTest Greater [_Cutoff]
			SetTexture [_MainTex]{
				combine texture * primary, texture
			}
			}
			//----------------------------【通道二】-----------------------------
		//		说明：渲染半透明的细节
		//----------------------------------------------------------------------
		Pass{
		//不写到深度缓冲区内
			ZWrite Off
		//不写已经写过的像素
		ZTest Less
		//深度测试中，只渲染小于或等于的像素
		AlphaTest LEqual [_Cutoff]
		//设置透明混合
		Blend SrcAlpha OneMinusSrcAlpha
		//纹理混合
		SetTexture[_MainTex]{combine texture * primary, texture}
		}
		}
}