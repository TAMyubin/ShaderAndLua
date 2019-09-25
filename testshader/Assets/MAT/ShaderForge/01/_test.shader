// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6049,x:32991,y:32644,varname:node_6049,prsc:2|custl-4882-OUT,clip-8899-OUT;n:type:ShaderForge.SFN_Tex2d,id:3958,x:32066,y:32677,ptovrint:False,ptlb:node_3958,ptin:_node_3958,varname:node_3958,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7906-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5111,x:31304,y:32668,varname:node_5111,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7906,x:31481,y:32653,varname:node_7906,prsc:2,spu:0,spv:-1|UVIN-5111-UVOUT;n:type:ShaderForge.SFN_Multiply,id:919,x:32293,y:32781,varname:node_919,prsc:2|A-3958-RGB,B-8881-RGB,C-7923-OUT;n:type:ShaderForge.SFN_Color,id:8881,x:32004,y:32920,ptovrint:False,ptlb:node_8881,ptin:_node_8881,varname:node_8881,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5955882,c2:0.04817259,c3:0.04817259,c4:1;n:type:ShaderForge.SFN_Vector1,id:7923,x:32024,y:32840,varname:node_7923,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:7770,x:31484,y:33173,ptovrint:False,ptlb:node_7770,ptin:_node_7770,varname:node_7770,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7906-UVOUT;n:type:ShaderForge.SFN_Step,id:8899,x:31866,y:33263,varname:node_8899,prsc:2|A-9507-OUT,B-6253-OUT;n:type:ShaderForge.SFN_Vector1,id:6253,x:31636,y:33328,varname:node_6253,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:8441,x:31852,y:33440,varname:node_8441,prsc:2|A-6253-OUT,B-8135-OUT;n:type:ShaderForge.SFN_Vector1,id:8135,x:31650,y:33497,varname:node_8135,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:6294,x:32013,y:33398,varname:node_6294,prsc:2|A-9507-OUT,B-8441-OUT;n:type:ShaderForge.SFN_Subtract,id:1765,x:32183,y:33276,varname:node_1765,prsc:2|A-8899-OUT,B-6294-OUT;n:type:ShaderForge.SFN_Color,id:5695,x:32380,y:33478,ptovrint:False,ptlb:node_5695,ptin:_node_5695,varname:node_5695,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9558824,c2:0.8899594,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:491,x:32684,y:33352,varname:node_491,prsc:2|A-1765-OUT,B-5695-RGB,C-9709-OUT;n:type:ShaderForge.SFN_Add,id:4882,x:32748,y:32830,varname:node_4882,prsc:2|A-919-OUT,B-491-OUT;n:type:ShaderForge.SFN_Slider,id:9709,x:32577,y:33617,ptovrint:False,ptlb:node_9709,ptin:_node_9709,varname:node_9709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:9507,x:31636,y:33094,varname:node_9507,prsc:2|A-6462-OUT,B-7770-R;n:type:ShaderForge.SFN_TexCoord,id:1029,x:30535,y:33250,varname:node_1029,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:9220,x:30535,y:33158,varname:node_9220,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:286,x:30721,y:33198,varname:node_286,prsc:2|A-9220-OUT,B-1029-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:4242,x:30907,y:33209,varname:node_4242,prsc:2|IN-286-OUT;n:type:ShaderForge.SFN_Power,id:7959,x:31090,y:33170,varname:node_7959,prsc:2|VAL-4242-OUT,EXP-6091-OUT;n:type:ShaderForge.SFN_Slider,id:1376,x:30642,y:33403,ptovrint:False,ptlb:node_1376,ptin:_node_1376,varname:node_1376,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8845285,max:3;n:type:ShaderForge.SFN_Exp,id:6091,x:30953,y:33403,varname:node_6091,prsc:2,et:0|IN-1376-OUT;n:type:ShaderForge.SFN_Multiply,id:6462,x:31311,y:33231,varname:node_6462,prsc:2|A-7959-OUT,B-6615-OUT;n:type:ShaderForge.SFN_Slider,id:6615,x:31083,y:33419,ptovrint:False,ptlb:node_6615,ptin:_node_6615,varname:node_6615,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.542533,max:10;proporder:3958-8881-7770-5695-9709-1376-6615;pass:END;sub:END;*/

Shader "Custom/_test" {
    Properties {
        _node_3958 ("node_3958", 2D) = "white" {}
        _node_8881 ("node_8881", Color) = (0.5955882,0.04817259,0.04817259,1)
        _node_7770 ("node_7770", 2D) = "white" {}
        [HDR]_node_5695 ("node_5695", Color) = (0.9558824,0.8899594,0,1)
        _node_9709 ("node_9709", Range(0, 10)) = 1
        _node_1376 ("node_1376", Range(0, 3)) = 0.8845285
        _node_6615 ("node_6615", Range(0, 10)) = 3.542533
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_3958; uniform float4 _node_3958_ST;
            uniform float4 _node_8881;
            uniform sampler2D _node_7770; uniform float4 _node_7770_ST;
            uniform float4 _node_5695;
            uniform float _node_9709;
            uniform float _node_1376;
            uniform float _node_6615;
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
                float4 node_5270 = _Time + _TimeEditor;
                float2 node_7906 = (i.uv0+node_5270.g*float2(0,-1));
                float4 _node_7770_var = tex2D(_node_7770,TRANSFORM_TEX(node_7906, _node_7770));
                float node_9507 = ((pow((1.0 - distance(float2(0.5,0.5),i.uv0)),exp(_node_1376))*_node_6615)*_node_7770_var.r);
                float node_6253 = 0.5;
                float node_8899 = step(node_9507,node_6253);
                clip(node_8899 - 0.5);
////// Lighting:
                float4 _node_3958_var = tex2D(_node_3958,TRANSFORM_TEX(node_7906, _node_3958));
                float3 finalColor = ((_node_3958_var.rgb*_node_8881.rgb*2.0)+((node_8899-step(node_9507,(node_6253-0.1)))*_node_5695.rgb*_node_9709));
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_7770; uniform float4 _node_7770_ST;
            uniform float _node_1376;
            uniform float _node_6615;
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
                float4 node_4724 = _Time + _TimeEditor;
                float2 node_7906 = (i.uv0+node_4724.g*float2(0,-1));
                float4 _node_7770_var = tex2D(_node_7770,TRANSFORM_TEX(node_7906, _node_7770));
                float node_9507 = ((pow((1.0 - distance(float2(0.5,0.5),i.uv0)),exp(_node_1376))*_node_6615)*_node_7770_var.r);
                float node_6253 = 0.5;
                float node_8899 = step(node_9507,node_6253);
                clip(node_8899 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
