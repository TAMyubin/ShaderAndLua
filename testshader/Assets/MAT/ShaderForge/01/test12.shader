// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3909,x:32719,y:32712,varname:node_3909,prsc:2|custl-7265-OUT,clip-1432-OUT;n:type:ShaderForge.SFN_Tex2d,id:1641,x:31110,y:32768,ptovrint:False,ptlb:node_1641,ptin:_node_1641,varname:node_1641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:1432,x:31353,y:33088,varname:node_1432,prsc:2|A-1641-R,B-3123-OUT;n:type:ShaderForge.SFN_Slider,id:3123,x:30951,y:33108,ptovrint:False,ptlb:node_3123,ptin:_node_3123,varname:node_3123,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6120689,max:1;n:type:ShaderForge.SFN_Subtract,id:1949,x:31845,y:33113,varname:node_1949,prsc:2|A-1888-OUT,B-1432-OUT;n:type:ShaderForge.SFN_Color,id:7404,x:32005,y:33240,ptovrint:False,ptlb:node_7404,ptin:_node_7404,varname:node_7404,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.8676471,c3:0.293205,c4:1;n:type:ShaderForge.SFN_Multiply,id:3924,x:32401,y:33120,varname:node_3924,prsc:2|A-1949-OUT,B-7404-RGB,C-1485-OUT;n:type:ShaderForge.SFN_Add,id:7265,x:32439,y:32728,varname:node_7265,prsc:2|A-1641-RGB,B-5314-OUT;n:type:ShaderForge.SFN_Slider,id:4126,x:31952,y:33483,ptovrint:False,ptlb:node_4126,ptin:_node_4126,varname:node_4126,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_RemapRange,id:3175,x:31353,y:33306,varname:node_3175,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.8|IN-3123-OUT;n:type:ShaderForge.SFN_Step,id:1888,x:31544,y:33288,varname:node_1888,prsc:2|A-1641-R,B-3175-OUT;n:type:ShaderForge.SFN_Multiply,id:5314,x:32610,y:33204,varname:node_5314,prsc:2|A-3924-OUT,B-4126-OUT;n:type:ShaderForge.SFN_Vector1,id:1485,x:32215,y:33284,varname:node_1485,prsc:2,v1:2;proporder:1641-3123-7404-4126;pass:END;sub:END;*/

Shader "Custom/test12" {
    Properties {
        _node_1641 ("node_1641", 2D) = "white" {}
        _node_3123 ("node_3123", Range(0, 1)) = 0.6120689
        [HDR]_node_7404 ("node_7404", Color) = (0,0.8676471,0.293205,1)
        _node_4126 ("node_4126", Range(0, 10)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1641; uniform float4 _node_1641_ST;
            uniform float _node_3123;
            uniform float4 _node_7404;
            uniform float _node_4126;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_1641_var = tex2D(_node_1641,TRANSFORM_TEX(i.uv0, _node_1641));
                float node_1432 = step(_node_1641_var.r,_node_3123);
                clip(node_1432 - 0.5);
////// Lighting:
                float3 finalColor = (_node_1641_var.rgb+(((step(_node_1641_var.r,(_node_3123*0.8+0.0))-node_1432)*_node_7404.rgb*2.0)*_node_4126));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1641; uniform float4 _node_1641_ST;
            uniform float _node_3123;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_1641_var = tex2D(_node_1641,TRANSFORM_TEX(i.uv0, _node_1641));
                float node_1432 = step(_node_1641_var.r,_node_3123);
                clip(node_1432 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
