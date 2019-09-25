// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:9823,x:32852,y:32706,varname:node_9823,prsc:2|custl-5872-OUT;n:type:ShaderForge.SFN_Tex2d,id:8900,x:32398,y:32948,ptovrint:False,ptlb:node_8900,ptin:_node_8900,varname:node_8900,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8dbdbf1f548763246b3ec069a8eecc9e,ntxv:0,isnm:False|UVIN-9945-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2851,x:31400,y:32823,varname:node_2851,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:973,x:31607,y:32896,varname:node_973,prsc:2|UVIN-2851-UVOUT,ANG-5743-OUT;n:type:ShaderForge.SFN_Slider,id:2238,x:31026,y:32991,ptovrint:False,ptlb:node_2238,ptin:_node_2238,varname:node_2238,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Pi,id:1805,x:31205,y:33073,varname:node_1805,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5743,x:31400,y:33008,varname:node_5743,prsc:2|A-2238-OUT,B-1805-OUT;n:type:ShaderForge.SFN_UVTile,id:9945,x:32281,y:33063,varname:node_9945,prsc:2|UVIN-973-UVOUT,WDT-232-X,HGT-232-Y,TILE-2247-OUT;n:type:ShaderForge.SFN_Vector4Property,id:232,x:32017,y:33062,ptovrint:False,ptlb:node_232,ptin:_node_232,varname:node_232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:6,v2:3,v3:0,v4:0;n:type:ShaderForge.SFN_Slider,id:2832,x:31674,y:33283,ptovrint:False,ptlb:node_2832,ptin:_node_2832,varname:node_2832,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:18;n:type:ShaderForge.SFN_Trunc,id:4016,x:31996,y:33283,varname:node_4016,prsc:2|IN-2832-OUT;n:type:ShaderForge.SFN_Time,id:691,x:31836,y:33538,varname:node_691,prsc:2;n:type:ShaderForge.SFN_Slider,id:7818,x:31697,y:33715,ptovrint:False,ptlb:node_7818,ptin:_node_7818,varname:node_7818,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:2.952393,max:10;n:type:ShaderForge.SFN_Multiply,id:4299,x:32067,y:33592,varname:node_4299,prsc:2|A-691-T,B-7818-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2247,x:32234,y:33317,ptovrint:False,ptlb:node_2247,ptin:_node_2247,varname:node_2247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-4016-OUT,B-578-OUT;n:type:ShaderForge.SFN_Trunc,id:578,x:32224,y:33592,varname:node_578,prsc:2|IN-4299-OUT;n:type:ShaderForge.SFN_Color,id:2001,x:32445,y:32557,ptovrint:False,ptlb:node_2001,ptin:_node_2001,varname:node_2001,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5872,x:32674,y:32655,varname:node_5872,prsc:2|A-2001-RGB,B-3052-OUT;n:type:ShaderForge.SFN_Vector1,id:9139,x:32455,y:32745,varname:node_9139,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector2,id:5609,x:31600,y:32791,varname:node_5609,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:8001,x:31787,y:32819,varname:node_8001,prsc:2|A-5609-OUT,B-973-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:557,x:31970,y:32673,varname:node_557,prsc:2|IN-8001-OUT;n:type:ShaderForge.SFN_RemapRange,id:4025,x:32119,y:32673,varname:node_4025,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:2|IN-557-OUT;n:type:ShaderForge.SFN_Clamp01,id:1772,x:32091,y:32855,varname:node_1772,prsc:2|IN-4025-OUT;n:type:ShaderForge.SFN_Multiply,id:3052,x:32566,y:32823,varname:node_3052,prsc:2|A-1772-OUT,B-8900-RGB;proporder:8900-2238-232-2832-7818-2247-2001;pass:END;sub:END;*/

Shader "Unlit/test09-01" {
    Properties {
        _node_8900 ("node_8900", 2D) = "white" {}
        _node_2238 ("node_2238", Range(0, 2)) = 0
        _node_232 ("node_232", Vector) = (6,3,0,0)
        _node_2832 ("node_2832", Range(0, 18)) = 0
        _node_7818 ("node_7818", Range(1, 10)) = 2.952393
        [MaterialToggle] _node_2247 ("node_2247", Float ) = 0
        _node_2001 ("node_2001", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 100
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
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_8900; uniform float4 _node_8900_ST;
            uniform float _node_2238;
            uniform float4 _node_232;
            uniform float _node_2832;
            uniform float _node_7818;
            uniform fixed _node_2247;
            uniform float4 _node_2001;
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
                float node_973_ang = (_node_2238*3.141592654);
                float node_973_spd = 1.0;
                float node_973_cos = cos(node_973_spd*node_973_ang);
                float node_973_sin = sin(node_973_spd*node_973_ang);
                float2 node_973_piv = float2(0.5,0.5);
                float2 node_973 = (mul(i.uv0-node_973_piv,float2x2( node_973_cos, -node_973_sin, node_973_sin, node_973_cos))+node_973_piv);
                float4 node_691 = _Time + _TimeEditor;
                float _node_2247_var = lerp( trunc(_node_2832), trunc((node_691.g*_node_7818)), _node_2247 );
                float2 node_9945_tc_rcp = float2(1.0,1.0)/float2( _node_232.r, _node_232.g );
                float node_9945_ty = floor(_node_2247_var * node_9945_tc_rcp.x);
                float node_9945_tx = _node_2247_var - _node_232.r * node_9945_ty;
                float2 node_9945 = (node_973 + float2(node_9945_tx, node_9945_ty)) * node_9945_tc_rcp;
                float4 _node_8900_var = tex2D(_node_8900,TRANSFORM_TEX(node_9945, _node_8900));
                float3 node_3052 = (saturate(((1.0 - distance(float2(0.5,0.5),node_973))*4.0+-2.0))*_node_8900_var.rgb);
                float3 finalColor = (_node_2001.rgb*node_3052);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
