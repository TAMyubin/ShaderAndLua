// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:1056,x:32921,y:32274,varname:node_1056,prsc:2|custl-5573-OUT;n:type:ShaderForge.SFN_Tex2d,id:4247,x:32325,y:32347,ptovrint:False,ptlb:node_4247,ptin:_node_4247,varname:node_4247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8dbdbf1f548763246b3ec069a8eecc9e,ntxv:0,isnm:False|UVIN-8406-UVOUT;n:type:ShaderForge.SFN_Rotator,id:4536,x:31971,y:32370,varname:node_4536,prsc:2|UVIN-4142-UVOUT,ANG-8201-OUT;n:type:ShaderForge.SFN_TexCoord,id:4142,x:31673,y:32353,varname:node_4142,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:8952,x:31932,y:32279,varname:node_8952,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Slider,id:2900,x:31521,y:32670,ptovrint:False,ptlb:node_2900,ptin:_node_2900,varname:node_2900,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0,max:2;n:type:ShaderForge.SFN_Pi,id:6581,x:31711,y:32842,varname:node_6581,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8201,x:31880,y:32648,varname:node_8201,prsc:2|A-2900-OUT,B-6581-OUT;n:type:ShaderForge.SFN_Multiply,id:8843,x:32537,y:32399,varname:node_8843,prsc:2|A-4247-RGB,B-4247-A;n:type:ShaderForge.SFN_UVTile,id:8406,x:32384,y:32652,varname:node_8406,prsc:2|UVIN-4536-UVOUT,WDT-8448-X,HGT-8448-Y,TILE-4350-OUT;n:type:ShaderForge.SFN_Vector4Property,id:8448,x:32046,y:32500,ptovrint:False,ptlb:node_8448,ptin:_node_8448,varname:node_8448,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:6,v2:3,v3:0,v4:0;n:type:ShaderForge.SFN_Slider,id:9367,x:31616,y:32994,ptovrint:False,ptlb:node_9367,ptin:_node_9367,varname:node_9367,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:8;n:type:ShaderForge.SFN_Trunc,id:4350,x:32189,y:33133,varname:node_4350,prsc:2|IN-3371-OUT;n:type:ShaderForge.SFN_Time,id:6329,x:31666,y:33108,varname:node_6329,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2773,x:31945,y:33150,varname:node_2773,prsc:2|A-6329-T,B-1329-OUT;n:type:ShaderForge.SFN_Slider,id:1329,x:31614,y:33377,ptovrint:False,ptlb:node_1329,ptin:_node_1329,varname:node_1329,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:7.211815,max:10;n:type:ShaderForge.SFN_SwitchProperty,id:3371,x:32071,y:32981,ptovrint:False,ptlb:node_3371,ptin:_node_3371,varname:node_3371,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9367-OUT,B-2773-OUT;n:type:ShaderForge.SFN_Color,id:5928,x:32509,y:32173,ptovrint:False,ptlb:node_5928,ptin:_node_5928,varname:node_5928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5573,x:32725,y:32260,varname:node_5573,prsc:2|A-5928-RGB,B-8843-OUT;proporder:4247-2900-8448-9367-1329-3371-5928;pass:END;sub:END;*/

Shader "Custom/test09" {
    Properties {
        _node_4247 ("node_4247", 2D) = "white" {}
        _node_2900 ("node_2900", Range(-2, 2)) = 0
        _node_8448 ("node_8448", Vector) = (6,3,0,0)
        _node_9367 ("node_9367", Range(0, 8)) = 0
        _node_1329 ("node_1329", Range(0, 10)) = 7.211815
        [MaterialToggle] _node_3371 ("node_3371", Float ) = 0
        _node_5928 ("node_5928", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_4247; uniform float4 _node_4247_ST;
            uniform float _node_2900;
            uniform float4 _node_8448;
            uniform float _node_9367;
            uniform float _node_1329;
            uniform fixed _node_3371;
            uniform float4 _node_5928;
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
////// Lighting:
                float4 node_6329 = _Time + _TimeEditor;
                float node_4350 = trunc(lerp( _node_9367, (node_6329.g*_node_1329), _node_3371 ));
                float2 node_8406_tc_rcp = float2(1.0,1.0)/float2( _node_8448.r, _node_8448.g );
                float node_8406_ty = floor(node_4350 * node_8406_tc_rcp.x);
                float node_8406_tx = node_4350 - _node_8448.r * node_8406_ty;
                float node_4536_ang = (_node_2900*3.141592654);
                float node_4536_spd = 1.0;
                float node_4536_cos = cos(node_4536_spd*node_4536_ang);
                float node_4536_sin = sin(node_4536_spd*node_4536_ang);
                float2 node_4536_piv = float2(0.5,0.5);
                float2 node_4536 = (mul(i.uv0-node_4536_piv,float2x2( node_4536_cos, -node_4536_sin, node_4536_sin, node_4536_cos))+node_4536_piv);
                float2 node_8406 = (node_4536 + float2(node_8406_tx, node_8406_ty)) * node_8406_tc_rcp;
                float4 _node_4247_var = tex2D(_node_4247,TRANSFORM_TEX(node_8406, _node_4247));
                float3 finalColor = (_node_5928.rgb*(_node_4247_var.rgb*_node_4247_var.a));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
