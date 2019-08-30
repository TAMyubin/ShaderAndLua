Shader"Shader编程/16.顶点光照+可调透明度"
{
	Properties{
		_Color("主颜色",Color) = (0,0,0,0)
		_SpecColor("高光",Color) = (0,0,0,0)
		_Emission("光泽颜色",Color) = (0,0,0,0)
		_Shininess("光泽度",Range(0.01,1)) = 0.7
		_MainTex("主贴图",2D) = "white"{}
		_Cutoff("Alpha阈值",Range(0,1)) = 0
	}
	SubShader{

		Pass{
		//使用Cutoff参数定义能被渲染的透明度阈值
				AlphaTest Greater [_Cutoff]
				//2.设置顶点光照参数值
				Material{
					Diffuse[_Color]
					Ambient[_Color]
					Shininess[_Shininess]
					Specular[_SpecColor]
					Emission[_Emission]
				}
				//3.开启灯光
				Lighting On
				//4.纹理混合
				SetTexture[_MainTex]{combine texture * primary}
		}
	}
}