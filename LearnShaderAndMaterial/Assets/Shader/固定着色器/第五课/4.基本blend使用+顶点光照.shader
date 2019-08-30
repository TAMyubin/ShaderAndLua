Shader"Shader编程/21.基本blend使用+顶点光照"
{
//属性
	Properties{
	_MainTex("主纹理",2D) = "white"{}
	_Color("主颜色",Color) = (1,1,1,0)
	}
	//子着色器
	SubShader{
	//标签	
		Tags{"Queue" = "Transparent"}
		//通道
		Pass{
			//1.设置材质
			Material{
				Diffuse[_Color]
				Ambient[_Color]
			}
			//2.开启光照
			Lighting On
			Blend One OneMinusDstColor //加法
			SetTexture[_MainTex]{
				//使颜色进入混合器
				constantColor[_Color]
				//使用纹理的alpha通道插值混合顶点颜色
				combine constant lerp(texture)previous
			}
		SetTexture[_MainTex] { combine texture * primary }
		}
	}
}