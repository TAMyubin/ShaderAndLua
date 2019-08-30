Shader"Shader编程/23.玻璃效果v3"
{
	//属性
	Properties{
		_Color("主颜色",Color) = (1,1,1,1)
		_MainTex("主纹理",2D) = "white"{}
		_Reflections("基础光",Cube) = "skybox"{TexGen CubeNormal}
	}
	//子着色器
	SubShader{
	Tags{"Queue" = "Transparent"}

		Pass{
	Blend SrcAlpha OneMinusSrcAlpha
	Material{
		Diffuse[_Color]
	}
	Lighting On

	SetTexture[_MainTex]{
		combine texture * primary double, texture * primary
	}
	}
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

	//通道2

	}
	
}