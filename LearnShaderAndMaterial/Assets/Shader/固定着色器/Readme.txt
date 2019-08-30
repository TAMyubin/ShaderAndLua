固定功能Shader暂告一段落，总结一下前面所学的内容
第一课学习创建项目和shader文件并拖动到材质上进行应用，最后提供了一个凹凸纹理和边缘发光的shader效果


第二课学习了shader的最基本框架的写法，Shader""{		
	Properties{ //属性}		
	SubShader{//子着色器			
				Pass{//通道		
				Material{ //材质	}
					 }
					 Fallback//备胎
			 }
}
打在对象上的完整光照颜色最终是：
FinalColor=Ambient * RenderSettings ambientsetting + (Light Color * Diffuse + Light Color *Specular) + Emission
翻译过来的中文式子便是：
最终颜色=环境光反射颜色* 渲染设置环境设置 *（灯光颜色*漫反射颜色+灯光颜色*镜面反射颜色）+自发光

然后第一个项目是赋予材质单色的shader（Color），
第二个是设置反射光并开启灯光(Diffuse[],Ambient[])，//漫反射光颜色，环境光颜色
第三个进行扩展可调节的反射光(Diffuse[_Color],Ambient[_Color])，
第四个实现了光照材质基本完备的条件(Diffuse[_Color1],Ambient[_Color1]，Emission[_Color2],Shininess[_Shininess],Specular[_SpecColor])//漫反射光颜色，环境光颜色，自发光颜色，光泽度，高光颜色
第五个进行纹理加载（SetTexture[_MainTex]{combine texture}）
最后是总结
Shader"Shader编程/6.光照材质完备正式版Shader"
{
	Properties{
		_Color("主颜色",Color) = (0,0,0,0)
		_SpecColor("高光颜色",Color) = (1,1,1,1)
		_Emission("自发光颜色",Color) = (0,0,0,0)
		_Shininess("光泽度",Range(0.01,1)) = 0.7
		_MainTex("基本纹理",2D) ="white"{}
	}
	//子着色器
	SubShader{
	//通道
	Pass{
	Material{
		//漫反射和环境光反射颜色
		Diffuse[_Color]
		Ambient[_Color]
		//光泽度
		Shininess[_Shininess]
		//高光颜色
		Specular[_SpecColor]
		//自发光颜色
		Emission[_Emission]
	}
	//开启光照
	Lighting On
	//开启镜面反射
	SeparateSpecular On
	//设置纹理并进行纹理混合
	SetTexture[_MainTex]{
		Combine texture * primary DOUBLE,texture*primary
	}
	}
	}
}


第三课学的是子着色器，通道和纹理的概念
1. Alpha纹理混合（SetTexture[_MainTex]{combine texture}//应用主纹理，SetTexture[_BlendTex]{combine texture * previous}//应用相乘操作进行纹理混合）

2.纹理的Alpha通道与自发光相混合
在前者基础上增加了漫反射光和环境光（Diffuse[_Color1],Ambient[_Color1]）(记得开灯(Lighting On))并进行混合
其中混合分为 先进行取色(SetTexture[_MainTex]{constantColor[_Color2]//把颜色放进混合器,combine constant lerp(texture) previous//取出混合器中的alpha值})
然后混合（SetTexture[_MainTex]{combine previous * texture}//乘法混合） 两个步骤

4. 顶点光照+纹理Alpha自发光混合
如名 只需要在通道中开启镜面反射（SeparateSpecular On）即可

小提示若进行乘法混合后亮度不够可以使用	SetTexture [_MainTex] {  Combine previous * primary DOUBLE, previous * primary}替代乘法混合提高亮度

5. 顶点光照+自发光混合+纹理混合
同样的进行了功能的迭代和增加把第二课的功能与第三课前面的功能进行融合
总结
Shader""
{
	//属性
	Properties{
		_IlluminCol("自发光",Color) =(0,0,0,0)
		_Color("主颜色"，Color) = (1,1,1,0)
		_SpecColor("高光颜色",Color) = (1,1,1,1)
		_Emission("光泽颜色",Color) = （0,0,0,0）
		_Shininess("光泽度",Range(0.01,1)) = 0.7
		_MainTex("主纹理",2D) = "white"{}
		_BlendTex("混合纹理",2D) = "white"{}
	}
	//子着色器
	SubShader{
	//通道
	Pass{
	//1.设置顶点光颜色
	Material{
	Diffuse[_Clolr]//漫反射光
	Ambient[_Color]//环境光
	Emission[_Emission]//自发光颜色
	Shininess[_Shininess]//光泽度
	Specular[_SpecColor]//高光颜色
	}
	Lighting On//2.开启灯光
	SeparateSpecular On//3.开启镜面反射
	//4.纹理混合
	SetTexture[_MainTex]{
		constantColor[_IllumiCol]//把颜色放进混合器
		combine constant lerp(texture) previous//取颜色的Alpha通道插值进行混合顶点颜色
	}
	//5.设置基本纹理
	SetTexture[_BlandTex]{combine previous * texture }
	//6.设置混合纹理
	SetTexture[_BlendTex]{combine previous * texture}
	//7.乘法混合
	SetTexture[_MainTex]{Combine previous * primary DOUBLE, previous * primary}
	}
	}
}

第四课学习的是剔除，深度测试 Alpha测试和基本雾效
1.用剔除操作渲染对象背面（Cull Front）
2. 用剔除操作渲染对象背面（第二版）这个版本定义了两个通道，一个通道渲染正面（前面），第二个通道进行剔除正面面
Pass1{	Material{环境光，漫反射光，高光，自发光}	Lighting On SetTexture[_MainTex]{乘法混合}}
Pass2{Color(),Cull Front}

3.用剔除实现玻璃效果 先在子着色器开始定义好Material{环境光，漫反射光，高光，自发光}	Lighting On, SeparateSpecular On, Blend SrcAlpha OneMinusSrcAlpha() 
同样定义了2个通道，一个通道渲染背面并剔除正面，第二个通道渲染背面并剔除背面
Pass1{Cull Front	 SetTexture[_MainTex]{乘法混合}}
Pass2{  Cull Back SetTexture[_MainTex]{乘法混合}}

4.基本Alpha测试，使用一张带有透明度通道的纹理。对象只会在透明度大于a值时显示( AlphaTest Greater [_Alpha])

6.简单的植被Shader
当渲染树和植物时，透明度测试使许多游戏中出现尖锐的边缘。
解决这个问题的方法之一是渲染对象两次。首次通道中，我们只渲染超过50%透明度的像素。
在第二次通道中，我们使用透明度混合上次我们切除的部分，而不记录像素的深度。我们可能会使一些树枝覆盖近的其他树枝，以实现逼真的效果（直接复制的....）
最后放出总结的代码
Shader""
{
//属性
	Properties{
	_Color("主颜色",Color) = (0.5,0.5,0.5,0.5)
	_MainTex("主纹理",2D) = "white"{}
	_Cutoff("Alpha透明度阈值",Range(0,0.9)) = 0.5
	}
	//子着色器
	SubShader{
	//材质
	Material{
	Diffuse[_Color]
	Ambient[_Color]
	}
	//2.开启光照
	Lighting On
	//3.关闭裁剪，渲染所有面，用于接下来的渲染几何体的两面
	Cull Off
		//--------------------------【通道一】-------------------------------
		//		说明：渲染所有超过[_Cutoff] 不透明的像素
		//----------------------------------------------------------------------
	Pass{
	AlphaTest Greater [_Cutoff]
	SetTexture[_MainTex]{combine texture * primary,texture}
	}
	}
		//----------------------------【通道二】-----------------------------
		//		说明：渲染半透明的细节
		//----------------------------------------------------------------------
	Pass{
	//不写入缓冲区内
	ZWrite off
	//不写已经写过的像素
	ZTest Less
	//深度测试中，只渲染小于或者等于的像素值
	AlphaTest LEqual [_Cutoff]
	//设置透明度混合
	Blend SrcTexture OneMinusSrcAlpha
	//纹理混合
	SetTexture[_MainTex]{combine texture * primary, texture}
	}
}

第五课复习和进一步了解了Unity中Shader的三种形态，然后讲解了固定功能Shader中混合操作的方方面面
固定功能Shader特征是里面的核心是下面Material材质属性块、没有CGPROGRAM和ENDCG块，以及各种顶点着色和片段着色的宏命令
表面着色器SurfaceShader 特征是在SubShader里出现CGPROGRAM和ENDCG块。（而不是出现在Pass里。因为SurfaceShader自己会编译成多个Pass。）
可编程Shader功能最强大、最自由的形态。特征是在Pass里出现CGPROGRAM和ENDCG块
二、混合操作（Blending）
Blend SrcAlpha OneMinusSrcAlpha    // Alpha混合
Blend One One                       // 相加
Blend One OneMinusDstColor         // 比较柔和的相加（SoftAdditive）
Blend DstColor Zero                  // 乘法
Blend DstColor SrcColor              // 2倍乘法

1. 纹理载入Shader（SetTexture [_MainTex] { combine texture }）
2.基本blend使用（  Blend DstColor Zero // 乘法）
3.基本blend使用+颜色可调(Blend One OneMinusDstColor// 柔性相加 SetTexture [_MainTex]{ // 使颜色属性进入混合器 constantColor [_Color]// 使用纹理的alpha通道插值混合顶点颜色  combine constant lerp(texture) previous })
4.基本blend使用+顶点光照
5.实现玻璃效果第二版载入一个cubemap(	//和纹理相乘    SetTexture [_Reflections] {  combine texture Matrix [_Reflection]})
6. 实现玻璃效果第三版
总代码
Shader "浅墨Shader编程/Volume5/23.玻璃效果v3" 
{
	//-------------------------------【属性】-----------------------------------------
    Properties 
	{
        _Color ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Base (RGB) Transparency (A)", 2D) = "white" {}
        _Reflections ("Base (RGB) Gloss (A)", Cube) = "skybox" { TexGen CubeReflect }
    }
 
	//--------------------------------【子着色器】----------------------------------
    SubShader 
	{
		//-----------子着色器标签----------
        Tags { "Queue" = "Transparent" }
 
		//----------------通道1--------------
        Pass 
		{
            Blend SrcAlpha OneMinusSrcAlpha
 
            Material 
			{
				Diffuse [_Color]
			}
 
            Lighting On
            SetTexture [_MainTex] {
                combine texture * primary double, texture * primary
            }
        }
 
		//----------------通道2--------------
        Pass 
		{
			//进行纹理混合
            Blend One One
 
			//设置材质
            Material 
			{
                Diffuse [_Color]
            }
 
			//开光照
            Lighting On
 
			//和纹理相乘
            SetTexture [_Reflections] 
			{
                combine texture
                Matrix [_Reflection]
            }
        }
    }
} 