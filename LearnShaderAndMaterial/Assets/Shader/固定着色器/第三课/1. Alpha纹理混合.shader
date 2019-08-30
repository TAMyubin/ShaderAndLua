Shader"Shader编程/7.Alpha纹理混合"
{
	//属性
	Properties{
		_MainTex("主纹理",2D) = "white"{}
		_BlendTex("混合纹理",2D) = "white"{}
	}
	//子着色器
	SubShader{
		//通道
		Pass{
			//1.应用主纹理
			SetTexture[_MainTex]{combine texture}
			//2.使用相乘进行Alpha纹理混合
			SetTexture[_BlendTex]{combine texture * previous}
		}
	}
}