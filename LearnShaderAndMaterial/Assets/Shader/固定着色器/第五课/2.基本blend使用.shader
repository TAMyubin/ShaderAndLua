Shader"Shader编程/19.基本blend使用"
{
//属性
Properties{
	_MainTex("基本纹理",2D) = "white"{}

}
//子着色器
SubShader{
	//子着色器标签
	Tags{"Queue" = "Geometry"}//子着色器的标签设为几何体
	//通道
	Pass{
		//进行混合
		Blend DstColor Zero	//乘法
		//设置纹理
			SetTexture[_MainTex] { combine texture }
	}
}
}