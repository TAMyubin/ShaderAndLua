Shader"Shader编程/TheThirdLearn"
{Properties 
	{
         _IlluminCol ("自发光色", Color) = (1,1,1,1)
        _Color ("主颜色", Color) = (1,1,1,0)
        _SpecColor ("高光颜色", Color) = (1,1,1,1)
        _Emission ("光泽颜色", Color) = (0,0,0,0)
        _Shininess ("光泽度", Range (0.01, 1)) = 0.7
        _MainTex ("基础纹理 (RGB)-自发光(A)", 2D) = "white" { }
		
	_BlendTex ("混合纹理(RGBA) ", 2D) = "white" {}

    }

	SubShader{
		//标签	在所有不透明几何体之后绘制
		Tags{"Queue" = "Transparent"}
		//捕获对象后的屏幕到_GrabTexture中   GrabPass——捕获屏幕内容到纹理中
		GrabPass{}
	
		//通道
			//用前面捕获的纹理渲染对象并相反他的颜色
		Pass{
		// 写Shader实体内容
		SetTexture[_GrabTexture]{combine one - texture}
		}
	}
	//--------------------------------【子着色器】--------------------------------
	 SubShader 
	{
        Pass 
		{
			// 【1】应用主纹理
            SetTexture [_MainTex] {	combine texture }
			// 【2】使用相乘操作来进行Alpha纹理混合
            SetTexture [_BlendTex] {combine texture * previous}
        }
    }
	//--------------------------------【子着色器】----------------------------------
    SubShader 
	{
        Pass 
		{
			//【1】设置白色的顶点光照
            Material 
			{
                Diffuse (1,1,1,1)
                Ambient (1,1,1,1)
            }
 
			//【2】开光照
            Lighting On
 
			//【3】使用纹理的Alpha通道来插值混合颜色(1,1,1,1)
            SetTexture [_MainTex] 
			{
                constantColor (1,1,1,1)
                combine constant lerp(texture) previous
            }
 
			//【4】和纹理相乘
            SetTexture [_MainTex] 
			{
                combine previous * texture
            }
        }
    }	//--------------------------------【子着色器】--------------------------------
    SubShader 
	{
        Pass 
		{
			//【1】设置白色的顶点光照
            Material 
			{
                Diffuse (1,1,1,1)
                Ambient (1,1,1,1)
            }
 
			//【2】开启光照
            Lighting On
 
            // 【3】将自发光颜色混合上纹理
            SetTexture [_MainTex] 
			{
				// 使颜色属性进入混合器
                constantColor [_IlluminCol]
				// 使用纹理的alpha通道混合顶点颜色
                combine constant lerp(texture) previous
            }
 
            // 【4】乘以纹理
            SetTexture [_MainTex] {combine previous * texture }
 
        }
    }
	 SubShader 
	{
        Pass 
		{
			//【1】设置白色的顶点光照
            Material 
			{
                Diffuse (1,1,1,1)
                Ambient (1,1,1,1)
            }
 
			//【2】开启光照
            Lighting On
 
            // 【3】将自发光颜色混合上纹理
            SetTexture [_MainTex] 
			{
				// 使颜色属性进入混合器
                constantColor [_IlluminCol]
				// 使用纹理的alpha通道混合顶点颜色
                combine constant lerp(texture) previous
            }
 
            // 【4】乘以纹理
            SetTexture [_MainTex] {combine previous * texture }
 
        }
    }
	//--------------------------------【子着色器】--------------------------------
    SubShader 
	{
        Pass 
		{
			//【1】设置顶点光照值
            Material 
			{
                Diffuse [_Color]
                Ambient [_Color]
                Shininess [_Shininess]
                Specular [_SpecColor]
                Emission [_Emission]
            }
 
			//【2】开启光照
            Lighting On
 
			//【3】---------------------开启独立镜面反射----------------
            SeparateSpecular On
 
            // 【4】将自发光颜色混合上纹理
            SetTexture [_MainTex] 
			{
				// 使颜色属性进入混合器
                constantColor [_IlluminCol]
				// 使用纹理的alpha通道插值混合顶点颜色
                combine constant lerp(texture) previous
            }
 
            // 【5】乘上纹理
            SetTexture [_MainTex] {  combine previous * texture   }
 
			//【6】乘以顶点纹理
			 SetTexture [_MainTex] 	{  Combine previous * primary DOUBLE, previous * primary}
 
        }
 
    }//--------------------------------【子着色器】--------------------------------
    SubShader
	{
		//----------------通道---------------
        Pass
		{
			//【1】设置顶点光照值
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
 
			//【2】开启光照
            Lighting On
			//【3】--------------开启独立镜面反射--------------
            SeparateSpecular On
 
 
            //【4】将自发光颜色混合上纹理
            SetTexture [_MainTex] 
			{
				// 使颜色属性进入混合器
                constantColor [_IlluminCol]
				// 使用纹理的alpha通道插值混合顶点颜色
                combine constant lerp(texture) previous
            }
 
            //【5】乘上基本纹理
            SetTexture [_MainTex] { combine previous * texture  }
 
			//【6】使用差值操作混合Alpha纹理
            SetTexture [_BlendTex] { combine previous*texture }
 
			//【7】乘以顶点纹理
			SetTexture [_MainTex] {Combine previous * primary DOUBLE, previous * primary }
 
        }
    }
}