Shader"Shader编程/22.玻璃效果v2"
{
	//属性
	Properties{
		_Color("主颜色",Color) = (1,1,1,1)
		_MainTex("主纹理",2D) = "white"{}
		_Reflections("基础光",Cube) = "skybox"{TexGen CubeReflect}
	}
	//子着色器
	SubShader{
	Tags{"Queue" = "Transparent"}
	//通道
	Pass{
		//纹理混合
		Blend One One
		//材质
		Material{
			Diffuse[_Color]
		}
		//开启灯光
		Lighting On
		//纹理相乘
		SetTexture[_Reflections]{
			combine texture 
			Matrix[_Reflections]
		}
	}
	}
	
}