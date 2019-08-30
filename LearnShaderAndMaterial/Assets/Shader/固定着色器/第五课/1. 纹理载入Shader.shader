Shader"Shader编程/18.基本纹理载入"
{
	//属性
	Properties{
		_MainTex("基本纹理",2D) = "white"{}
	}
	//子着色器
	SubShader{
	//标签
	Tags{"Queue" = "Geometry"}//子着色器的标签设为几何体
		//通道
		Pass
		{
		SetTexture[_MainTex]{combine texture}
		}
	}
}