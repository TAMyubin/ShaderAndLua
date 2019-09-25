// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2709,x:32719,y:32712,varname:node_2709,prsc:2|custl-2177-OUT;n:type:ShaderForge.SFN_Fresnel,id:1552,x:31869,y:33082,varname:node_1552,prsc:2|EXP-5146-OUT;n:type:ShaderForge.SFN_Tex2d,id:9485,x:31923,y:32816,ptovrint:False,ptlb:node_9485,ptin:_node_9485,varname:node_9485,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Add,id:6851,x:32273,y:32872,varname:node_6851,prsc:2|A-1552-OUT,B-4636-OUT;n:type:ShaderForge.SFN_Exp,id:5146,x:31693,y:33159,varname:node_5146,prsc:2,et:0|IN-2621-OUT;n:type:ShaderForge.SFN_Slider,id:2621,x:31329,y:33201,ptovrint:False,ptlb:node_2621,ptin:_node_2621,varname:node_2621,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.384616,max:2;n:type:ShaderForge.SFN_DepthBlend,id:3346,x:31974,y:33251,varname:node_3346,prsc:2|DIST-1302-OUT;n:type:ShaderForge.SFN_Slider,id:1302,x:31558,y:33396,ptovrint:False,ptlb:node_1302,ptin:_node_1302,varname:node_1302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_OneMinus,id:4636,x:32197,y:33229,varname:node_4636,prsc:2|IN-3346-OUT;n:type:ShaderForge.SFN_Color,id:205,x:32253,y:32649,ptovrint:False,ptlb:node_205,ptin:_node_205,varname:node_205,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2177,x:32467,y:32735,varname:node_2177,prsc:2|A-205-RGB,B-6851-OUT;proporder:9485-2621-1302-205;pass:END;sub:END;*/

Shader "Custom/test07" {
    Properties {
        _node_9485 ("node_9485", 2D) = "black" {}
        _node_2621 ("node_2621", Range(0, 2)) = 1.384616
        _node_1302 ("node_1302", Range(0, 1)) = 1
        _node_205 ("node_205", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float _node_2621;
            uniform float _node_1302;
            uniform float4 _node_205;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float node_1552 = pow(1.0-max(0,dot(normalDirection, viewDirection)),exp(_node_2621));
                float3 finalColor = (_node_205.rgb*(node_1552+(1.0 - saturate((sceneZ-partZ)/_node_1302))));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
