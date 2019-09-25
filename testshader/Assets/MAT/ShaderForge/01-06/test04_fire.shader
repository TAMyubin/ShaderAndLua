// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8721,x:32719,y:32712,varname:node_8721,prsc:2|custl-6260-OUT,clip-2576-OUT;n:type:ShaderForge.SFN_Tex2d,id:4317,x:31914,y:32681,varname:node_4317,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|TEX-9912-TEX;n:type:ShaderForge.SFN_Color,id:6759,x:31942,y:32950,ptovrint:False,ptlb:node_6759,ptin:_node_6759,varname:node_6759,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6397059,c2:0.09877814,c3:0.09877814,c4:1;n:type:ShaderForge.SFN_Multiply,id:6267,x:32295,y:32815,varname:node_6267,prsc:2|A-4317-RGB,B-6759-RGB;n:type:ShaderForge.SFN_TexCoord,id:7029,x:30268,y:32543,varname:node_7029,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:610,x:31054,y:32366,varname:node_610,prsc:2,spu:0,spv:-0.5;n:type:ShaderForge.SFN_Tex2d,id:7899,x:31340,y:33028,varname:node_7899,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3992-OUT,TEX-9912-TEX;n:type:ShaderForge.SFN_Step,id:2574,x:31764,y:33232,varname:node_2574,prsc:2|A-8435-OUT,B-966-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8435,x:31588,y:33175,ptovrint:False,ptlb:node_8435,ptin:_node_8435,varname:node_8435,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:8430,x:31620,y:33464,varname:node_8430,prsc:2|A-8435-OUT,B-3250-OUT;n:type:ShaderForge.SFN_Vector1,id:3250,x:31446,y:33464,varname:node_3250,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:2576,x:31853,y:33434,varname:node_2576,prsc:2|A-8430-OUT,B-966-OUT;n:type:ShaderForge.SFN_Subtract,id:7917,x:32084,y:33347,varname:node_7917,prsc:2|A-2576-OUT,B-2574-OUT;n:type:ShaderForge.SFN_Color,id:422,x:32039,y:33617,ptovrint:False,ptlb:node_422,ptin:_node_422,varname:node_422,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8235294,c2:0.6691803,c3:0.02422148,c4:1;n:type:ShaderForge.SFN_Multiply,id:5318,x:32294,y:33464,varname:node_5318,prsc:2|A-7917-OUT,B-422-RGB;n:type:ShaderForge.SFN_Add,id:6260,x:32412,y:33151,varname:node_6260,prsc:2|A-6267-OUT,B-5318-OUT;n:type:ShaderForge.SFN_Tex2d,id:6711,x:30886,y:33406,ptovrint:False,ptlb:node_6711,ptin:_node_6711,varname:node_6711,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3a5a96df060a5cf4a9cc0c59e13486b7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:966,x:31281,y:33390,varname:node_966,prsc:2|A-7899-R,B-7041-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9912,x:30990,y:32930,ptovrint:False,ptlb:node_9912,ptin:_node_9912,varname:node_9912,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2440,x:30665,y:33776,varname:node_2440,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:9012,x:30508,y:33724,varname:node_9012,prsc:2,v1:0;n:type:ShaderForge.SFN_OneMinus,id:5182,x:31008,y:33746,varname:node_5182,prsc:2|IN-4872-OUT;n:type:ShaderForge.SFN_Multiply,id:819,x:31356,y:33705,varname:node_819,prsc:2;n:type:ShaderForge.SFN_Slider,id:8134,x:30851,y:33979,ptovrint:False,ptlb:node_8134,ptin:_node_8134,varname:node_8134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:11;n:type:ShaderForge.SFN_Power,id:7041,x:31371,y:33847,varname:node_7041,prsc:2|VAL-5182-OUT,EXP-8134-OUT;n:type:ShaderForge.SFN_Append,id:3992,x:30922,y:32602,varname:node_3992,prsc:2|A-7029-U,B-2577-OUT;n:type:ShaderForge.SFN_Vector2,id:4149,x:30642,y:33620,varname:node_4149,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4872,x:30844,y:33676,varname:node_4872,prsc:2|A-4149-OUT,B-2440-UVOUT;n:type:ShaderForge.SFN_Time,id:3112,x:30365,y:32796,varname:node_3112,prsc:2;n:type:ShaderForge.SFN_Add,id:2577,x:30701,y:32646,varname:node_2577,prsc:2|A-3348-OUT,B-9434-OUT;n:type:ShaderForge.SFN_OneMinus,id:3348,x:30471,y:32634,varname:node_3348,prsc:2|IN-7029-V;n:type:ShaderForge.SFN_Slider,id:5608,x:30377,y:32985,ptovrint:False,ptlb:node_5608,ptin:_node_5608,varname:node_5608,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:6.46971,max:10;n:type:ShaderForge.SFN_Multiply,id:9434,x:30627,y:32777,varname:node_9434,prsc:2|A-3112-TSL,B-5608-OUT;proporder:6759-8435-422-6711-9912-8134-5608;pass:END;sub:END;*/

Shader "Custom/test04_flre" {
    Properties {
        [HDR]_node_6759 ("node_6759", Color) = (0.6397059,0.09877814,0.09877814,1)
        _node_8435 ("node_8435", Float ) = 0.5
        [HDR]_node_422 ("node_422", Color) = (0.8235294,0.6691803,0.02422148,1)
        _node_6711 ("node_6711", 2D) = "white" {}
        _node_9912 ("node_9912", 2D) = "white" {}
        _node_8134 ("node_8134", Range(1, 11)) = 1
        _node_5608 ("node_5608", Range(-10, 10)) = 6.46971
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
            uniform float4 _node_6759;
            uniform float _node_8435;
            uniform float4 _node_422;
            uniform sampler2D _node_9912; uniform float4 _node_9912_ST;
            uniform float _node_8134;
            uniform float _node_5608;
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
                float4 node_3112 = _Time + _TimeEditor;
                float2 node_3992 = float2(i.uv0.r,((1.0 - i.uv0.g)+(node_3112.r*_node_5608)));
                float4 node_7899 = tex2D(_node_9912,TRANSFORM_TEX(node_3992, _node_9912));
                float node_966 = (node_7899.r*pow((1.0 - distance(float2(0.5,0.5),i.uv0)),_node_8134));
                float node_2576 = step((_node_8435-0.1),node_966);
                clip(node_2576 - 0.5);
////// Lighting:
                float4 node_4317 = tex2D(_node_9912,TRANSFORM_TEX(i.uv0, _node_9912));
                float3 finalColor = ((node_4317.rgb*_node_6759.rgb)+((node_2576-step(_node_8435,node_966))*_node_422.rgb));
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
            uniform float _node_8435;
            uniform sampler2D _node_9912; uniform float4 _node_9912_ST;
            uniform float _node_8134;
            uniform float _node_5608;
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
                float4 node_3112 = _Time + _TimeEditor;
                float2 node_3992 = float2(i.uv0.r,((1.0 - i.uv0.g)+(node_3112.r*_node_5608)));
                float4 node_7899 = tex2D(_node_9912,TRANSFORM_TEX(node_3992, _node_9912));
                float node_966 = (node_7899.r*pow((1.0 - distance(float2(0.5,0.5),i.uv0)),_node_8134));
                float node_2576 = step((_node_8435-0.1),node_966);
                clip(node_2576 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
