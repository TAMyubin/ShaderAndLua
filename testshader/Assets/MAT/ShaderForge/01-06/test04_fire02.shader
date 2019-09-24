// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8739,x:33144,y:32725,varname:node_8739,prsc:2|custl-8070-OUT,clip-8653-OUT;n:type:ShaderForge.SFN_Tex2d,id:3210,x:32114,y:32567,varname:_node_3210,prsc:2,ntxv:0,isnm:False|UVIN-4205-OUT,TEX-1462-TEX;n:type:ShaderForge.SFN_TexCoord,id:7944,x:30903,y:32363,varname:node_7944,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8070,x:32603,y:32880,varname:node_8070,prsc:2|A-3210-RGB,B-9330-RGB,C-2323-OUT;n:type:ShaderForge.SFN_Color,id:9330,x:32224,y:32996,ptovrint:False,ptlb:color,ptin:_color,varname:node_9330,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4926471,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3221,x:31436,y:33039,varname:node_3221,prsc:2,ntxv:0,isnm:False|UVIN-4205-OUT,TEX-1462-TEX;n:type:ShaderForge.SFN_Step,id:8653,x:32122,y:33164,varname:node_8653,prsc:2|A-8396-OUT,B-3634-OUT;n:type:ShaderForge.SFN_Vector1,id:3634,x:31881,y:33278,varname:node_3634,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector3,id:9945,x:32290,y:33659,varname:node_9945,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Subtract,id:873,x:32017,y:33433,varname:node_873,prsc:2|A-3634-OUT,B-9251-OUT;n:type:ShaderForge.SFN_Vector1,id:9251,x:31757,y:33406,varname:node_9251,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:8926,x:32220,y:33303,varname:node_8926,prsc:2|A-8396-OUT,B-873-OUT;n:type:ShaderForge.SFN_Subtract,id:7918,x:32430,y:33198,varname:node_7918,prsc:2|A-8653-OUT,B-8926-OUT;n:type:ShaderForge.SFN_Color,id:4095,x:32410,y:33358,ptovrint:False,ptlb:node_4095,ptin:_node_4095,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9411765,c2:0.4089249,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:2323,x:32700,y:33173,varname:node_2323,prsc:2|A-7918-OUT,B-4095-RGB;n:type:ShaderForge.SFN_TexCoord,id:2776,x:30786,y:33282,varname:node_2776,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:2539,x:30786,y:33149,varname:node_2539,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:2153,x:30985,y:33227,varname:node_2153,prsc:2|A-2539-OUT,B-2776-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:4221,x:31162,y:33271,varname:node_4221,prsc:2|IN-2153-OUT;n:type:ShaderForge.SFN_Power,id:3072,x:31332,y:33271,varname:node_3072,prsc:2|VAL-4221-OUT,EXP-7322-OUT;n:type:ShaderForge.SFN_Slider,id:7322,x:30985,y:33488,ptovrint:False,ptlb:node_7322,ptin:_node_7322,varname:node_7322,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:-0.2363108,max:10;n:type:ShaderForge.SFN_Multiply,id:8396,x:31729,y:33231,varname:node_8396,prsc:2|A-3221-RGB,B-3072-OUT;n:type:ShaderForge.SFN_Append,id:4205,x:31503,y:32492,varname:node_4205,prsc:2|A-7944-U,B-7993-OUT;n:type:ShaderForge.SFN_Time,id:1908,x:30919,y:32586,varname:node_1908,prsc:2;n:type:ShaderForge.SFN_Slider,id:4779,x:30722,y:32748,ptovrint:False,ptlb:timespeed,ptin:_timespeed,varname:node_4779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:7.128865,max:10;n:type:ShaderForge.SFN_Multiply,id:917,x:31140,y:32637,varname:node_917,prsc:2|A-1908-TSL,B-4779-OUT;n:type:ShaderForge.SFN_OneMinus,id:5734,x:31085,y:32467,varname:node_5734,prsc:2|IN-7944-V;n:type:ShaderForge.SFN_Add,id:7993,x:31303,y:32541,varname:node_7993,prsc:2|A-5734-OUT,B-917-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1462,x:31029,y:32837,ptovrint:False,ptlb:node_1462,ptin:_node_1462,varname:node_1462,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:9330-4095-7322-4779-1462;pass:END;sub:END;*/

Shader "Custom/test" {
    Properties {
        [HDR]_color ("color", Color) = (0.4926471,0,0,1)
        [HDR]_node_4095 ("node_4095", Color) = (0.9411765,0.4089249,0,1)
        _node_7322 ("node_7322", Range(-10, 10)) = -0.2363108
        _timespeed ("timespeed", Range(-10, 10)) = 7.128865
        _node_1462 ("node_1462", 2D) = "white" {}
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
            Cull Off
            
            
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
            uniform float4 _color;
            uniform float4 _node_4095;
            uniform float _node_7322;
            uniform float _timespeed;
            uniform sampler2D _node_1462; uniform float4 _node_1462_ST;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_1908 = _Time + _TimeEditor;
                float2 node_4205 = float2(i.uv0.r,((1.0 - i.uv0.g)+(node_1908.r*_timespeed)));
                float4 node_3221 = tex2D(_node_1462,TRANSFORM_TEX(node_4205, _node_1462));
                float3 node_8396 = (node_3221.rgb*pow((1.0 - distance(float2(0.5,0.5),i.uv0)),_node_7322));
                float node_3634 = 0.5;
                float3 node_8653 = step(node_8396,node_3634);
                clip(node_8653 - 0.5);
////// Lighting:
                float4 _node_3210 = tex2D(_node_1462,TRANSFORM_TEX(node_4205, _node_1462));
                float3 finalColor = (_node_3210.rgb+_color.rgb+((node_8653-step(node_8396,(node_3634-0.1)))*_node_4095.rgb));
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
            Cull Off
            
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
            uniform float _node_7322;
            uniform float _timespeed;
            uniform sampler2D _node_1462; uniform float4 _node_1462_ST;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_1908 = _Time + _TimeEditor;
                float2 node_4205 = float2(i.uv0.r,((1.0 - i.uv0.g)+(node_1908.r*_timespeed)));
                float4 node_3221 = tex2D(_node_1462,TRANSFORM_TEX(node_4205, _node_1462));
                float3 node_8396 = (node_3221.rgb*pow((1.0 - distance(float2(0.5,0.5),i.uv0)),_node_7322));
                float node_3634 = 0.5;
                float3 node_8653 = step(node_8396,node_3634);
                clip(node_8653 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
