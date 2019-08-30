Shader"Shader编程/2.材质颜色设置&开启光照"
{
//子着色器
	SubShader{
	//通道
	Pass{
		//材质
		Material{
			//将漫反射和环境光反色颜色设为相同
			Diffuse(0.9,0.5,0.4,1)
			Ambient(0.9,0.5,0.4,1)
		}
		Lighting On
	}
	}
}