Shader"Shader编程/12.用剔除操作渲染对象背面"
{
SubShader{
	Pass{
		Material{
		//1.设置顶点光照颜色
		Emission(0.3,0.3,0.3,0.3)
		Diffuse(1,1,1,1)
		}
		//2.开启光照
		Lighting On
		//【3】剔除正面（不绘制面向观察者的几何面）
		Cull Front
	}
}
}