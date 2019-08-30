Shader"Shader编程/10.顶点光照+纹理Alpha自发光混合"
{
Properties
	{
	_IlluminCol("自发光颜色",Color) = (1,1,1,1)
	_Color("主颜色",Color) = (1,1,1,1)
	_SpecColor("高光颜色",Color) = (1,1,1,1)
	_Emission("光泽颜色",Color) = (0,0,0,0)
	_Shiniess("光泽度",Range(0.01,1)) = 0.7
	_MainTex("主纹理",2D) = "white"{}
	}
	//子着色器
SubShader
	{
	Pass{
	//1.设置顶点光照
		Material{
		Diffuse[_Color]
		Ambient[_Color]
		Shininess[_Shiniess]
		Specular[_SpecColor]
		Emission[_Emission]
		}
		//2.开启光照
		Lighting On
		//3.开启镜面反射
		SeparateSpecular On
		//4.将自发光颜色混合到纹理
		SetTexture[_MainTex]{
			//使颜色属性进入混合器
			constantColor[_IlluminCol]
			//使用纹理的Alpha通道插值混合顶点颜色
			combine constant lerp(texture) previous
		}
		//5.乘上纹理
		SetTexture[_MainTex]{combine previous * texture}
		//6.乘以顶点坐标
		SetTexture[_MainTex]{combine previous * primary DOUBLE,previous * primary}
	}
	}
}
