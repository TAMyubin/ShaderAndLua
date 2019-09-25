// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9634,x:32719,y:32712,varname:node_9634,prsc:2|custl-647-OUT;n:type:ShaderForge.SFN_Fresnel,id:6149,x:32218,y:32881,varname:node_6149,prsc:2|EXP-8220-OUT;n:type:ShaderForge.SFN_Slider,id:8220,x:31878,y:32929,ptovrint:False,ptlb:node_8220,ptin:_node_8220,varname:node_8220,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Depth,id:7645,x:31984,y:33238,varname:node_7645,prsc:2;n:type:ShaderForge.SFN_Add,id:1507,x:32362,y:33047,varname:node_1507,prsc:2|A-6149-OUT,B-9847-OUT;n:type:ShaderForge.SFN_Multiply,id:647,x:32540,y:33152,varname:node_647,prsc:2|A-1507-OUT,B-4295-OUT;n:type:ShaderForge.SFN_Color,id:3883,x:32292,y:33285,ptovrint:False,ptlb:node_3883,ptin:_node_3883,varname:node_3883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:3673,x:32303,y:33561,varname:node_3673,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4295,x:32444,y:33342,varname:node_4295,prsc:2|A-3883-RGB,B-3673-OUT;n:type:ShaderForge.SFN_Slider,id:6475,x:31713,y:33134,ptovrint:False,ptlb:node_6475,ptin:_node_6475,varname:node_6475,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:9847,x:32153,y:33063,varname:node_9847,prsc:2|A-6475-OUT,B-7645-OUT;proporder:8220-3883-6475;pass:END;sub:END;*/

Shader "Custom/test08-01" {
    Properties {
        _node_8220 ("node_8220", Range(0, 10)) = 0
        _node_3883 ("node_3883", Color) = (0.5,0.5,0.5,1)
        _node_6475 ("node_6475", Range(0, 10)) = 0
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
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_8220;
            uniform float4 _node_3883;
            uniform float _node_6475;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float3 finalColor = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_8220)+(_node_6475*partZ))*(_node_3883.rgb*2.0));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
