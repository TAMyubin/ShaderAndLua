Shader"Shader编程/15.基本Alpha测试"
{
	Properties{
		_MainTex("基本纹理",2D) = "white"{}
		_A("基本值",Range(0.01,1)) =0.7 

	}
	SubShader{
	//----------------------------【通道】-------------------------------
		//		说明：进行Alpha测试操作，且只渲染透明度大于60%的像素
		//----------------------------------------------------------------------
	Pass{
		//只渲染透明度大于60%的像素
		AlphaTest Greater [_A]
		SetTexture[_MainTex]{combine texture}
	}
	}
}