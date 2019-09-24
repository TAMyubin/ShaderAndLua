// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:5466,x:32781,y:32747,varname:node_5466,prsc:2|custl-7499-RGB,voffset-6767-OUT;n:type:ShaderForge.SFN_Tex2d,id:7499,x:32422,y:32896,ptovrint:False,ptlb:node_7499,ptin:_node_7499,varname:node_7499,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_FragmentPosition,id:6482,x:31828,y:32971,varname:node_6482,prsc:2;n:type:ShaderForge.SFN_Transform,id:6056,x:31999,y:32971,varname:node_6056,prsc:2,tffrom:0,tfto:1|IN-6482-XYZ;n:type:ShaderForge.SFN_Lerp,id:1144,x:32340,y:33180,varname:node_1144,prsc:2|A-1934-OUT,B-5787-OUT,T-9975-OUT;n:type:ShaderForge.SFN_Vector1,id:5787,x:32072,y:33233,varname:node_5787,prsc:2,v1:0;n:type:ShaderForge.SFN_Negate,id:1934,x:32149,y:33067,varname:node_1934,prsc:2|IN-6056-XYZ;n:type:ShaderForge.SFN_Slider,id:423,x:31598,y:33462,ptovrint:False,ptlb:value,ptin:_value,varname:node_423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.7932859,max:1;n:type:ShaderForge.SFN_TexCoord,id:7048,x:31677,y:33291,varname:node_7048,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2105,x:31992,y:33392,varname:node_2105,prsc:2|A-7048-V,B-423-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9975,x:32273,y:33391,varname:node_9975,prsc:2,min:0,max:1|IN-2105-OUT;n:type:ShaderForge.SFN_Vector4Property,id:3910,x:31928,y:33641,ptovrint:False,ptlb:node_3910,ptin:_node_3910,varname:node_3910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Transform,id:1602,x:32161,y:33624,varname:node_1602,prsc:2,tffrom:0,tfto:1|IN-3910-XYZ;n:type:ShaderForge.SFN_Lerp,id:5457,x:32519,y:33391,varname:node_5457,prsc:2|A-1602-XYZ,B-5787-OUT,T-9975-OUT;n:type:ShaderForge.SFN_Add,id:6767,x:32694,y:33217,varname:node_6767,prsc:2|A-1144-OUT,B-5457-OUT;proporder:7499-423-3910;pass:END;sub:END;*/

Shader "Custom/test13" {
    Properties {
        _node_7499 ("node_7499", 2D) = "white" {}
        _value ("value", Range(-1, 1)) = 0.7932859
        _node_3910 ("node_3910", Vector) = (0,0,0,0)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            uniform sampler2D _node_7499; uniform float4 _node_7499_ST;
            uniform float _value;
            uniform float4 _node_3910;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float node_5787 = 0.0;
                float node_9975 = clamp((o.uv0.g+_value),0,1);
                v.vertex.xyz += (lerp((-1*mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb),float3(node_5787,node_5787,node_5787),node_9975)+lerp(mul( unity_WorldToObject, float4(_node_3910.rgb,0) ).xyz.rgb,float3(node_5787,node_5787,node_5787),node_9975));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _node_7499_var = tex2D(_node_7499,TRANSFORM_TEX(i.uv0, _node_7499));
                float3 finalColor = _node_7499_var.rgb;
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
            uniform float _value;
            uniform float4 _node_3910;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float node_5787 = 0.0;
                float node_9975 = clamp((o.uv0.g+_value),0,1);
                v.vertex.xyz += (lerp((-1*mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb),float3(node_5787,node_5787,node_5787),node_9975)+lerp(mul( unity_WorldToObject, float4(_node_3910.rgb,0) ).xyz.rgb,float3(node_5787,node_5787,node_5787),node_9975));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
