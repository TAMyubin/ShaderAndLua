Shader"Shader编程/3.可调漫反射光的Shader"
{
//变量
Properties{
	_MainColor("主颜色",color) = (1,1,1.5,1)
}
//字着色器
SubShader{
//通道
Pass{
	Material{
		//可调节的漫反射和环境光反射颜色
		Diffuse[_MainColor]
		Ambient[_MainColor]
	}
	Lighting On
}
}
}
