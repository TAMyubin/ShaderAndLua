Shader "Shader编程/TheSecondLearn"
{

/*把shader编程2的所有效果都写在了一起*/
    Properties
    {
        //水着色器属性
		_WaveScale("Wave Scale",Range(0.03,0.15)) = 0.07//滑动条
		_ReflDistort("ReflDistort dishort",Range(0,1.5)) = 0.5
		_RefrDistort("RefrDistort dishort",Range(0,1.5)) = 0.4
		_ReftColor("Refraction color",Color) = (0.34,0.84,0.92,1)//颜色
		_ReflectionTex("Environment Reflection",2D) = ""{}//纹理
		_Fresnel("Fresnel(A)",2D) = ""{}
		_BumpMap("Bumpmap(RGB)",2D) = ""{}
		
		_MainColor ("主颜色", Color) = (1,.1,.5,1)


		 _Color ("主颜色", Color) = (1,1,1,0)
		 _SpecColor ("反射高光颜色", Color) = (1,1,1,1)
		 _Emission ("自发光颜色", Color) = (0,0,0,0)
		 _Shininess ("光泽度", Range (0.01, 1)) = 0.7

		  //纹理
		 _MainTex("基本纹理",2D)="White"{TexGen SphereMap}


    }
	//---------------------------------【单色Shader子着色器】----------------------------------
	SubShader
	{
		//----------------通道---------------
		Pass
		{
			//设为蓝色单色
			Color(0,0,0.6,0)
		}
	}
   //---------------------------------【材质颜色&开启光照的Shader子着色器1】----------------------------------
	SubShader
	{	
		//----------------通道---------------
		Pass
		{
			//----------材质------------
			Material
			{
				//将漫反射和环境光反射颜色设为相同
				Diffuse(0.9,0.5,0.4,1)
				Ambient(0.9,0.5,0.4,1)
			}
			//开启光照
			Lighting On
		}
	}
	//---------------------------------【可调漫反射光的Shader子着色器】----------------------------------
    SubShader 
	{
		//----------------通道---------------
        Pass 
		{
			//-----------材质------------
            Material 
			{
				//可调节的漫反射光和环境光反射颜色
                Diffuse [_MainColor]
				Ambient[_MainColor]
            }
            Lighting On
        }
    }
	//---------------------------------【光照材质完备beta版Shader子着色器】----------------------------------
    SubShader 
	{
		//----------------通道---------------
        Pass 
		{
			//-----------材质------------
            Material 
			{
				//可调节的漫反射光和环境光反射颜色
                Diffuse [_Color]
                Ambient [_Color]
				//光泽度
                Shininess [_Shininess]
				//高光颜色
                Specular [_SpecColor]
				//自发光颜色
                Emission [_Emission]
            }
			//开启光照
            Lighting On
        }
    }
	 //---------------------------------【简单的纹理载入Shader子着色器1】----------------------------------
       SubShader
       {
              //----------------通道---------------
              Pass
              {
                     //设置纹理为属性中选择的纹理
                     SetTexture[_MainTex]{combine texture}
              }
       }
   //--------------------------------【光照材质完备正式版Shader子着色器】--------------------------------
    SubShader
	{
		//----------------通道---------------
        Pass
		{
			//-----------材质------------
            Material
			{
				//可调节的漫反射光和环境光反射颜色
                Diffuse [_Color]
                Ambient [_Color]
				//光泽度
                Shininess [_Shininess]
				//高光颜色
                Specular [_SpecColor]
				//自发光颜色
                Emission [_Emission]
            }
			//开启光照
            Lighting On
			//开启独立镜面反射
            SeparateSpecular On
			//设置纹理并进行纹理混合
            SetTexture [_MainTex] 
			{
                Combine texture * primary DOUBLE, texture * primary
            }
        }
    }
    FallBack "Diffuse"
}
