// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2722,x:32719,y:32712,varname:node_2722,prsc:2|custl-6644-OUT;n:type:ShaderForge.SFN_Tex2d,id:8641,x:32261,y:32738,ptovrint:False,ptlb:node_8641,ptin:_node_8641,varname:node_8641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a08960dd6e8274e7f8fca616e09c48ed,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:203,x:32196,y:33056,varname:node_203,prsc:2|EXP-8449-OUT;n:type:ShaderForge.SFN_Add,id:6644,x:32490,y:33001,varname:node_6644,prsc:2|A-8641-RGB,B-2459-OUT;n:type:ShaderForge.SFN_Color,id:4800,x:32159,y:33230,ptovrint:False,ptlb:node_4800,ptin:_node_4800,varname:node_4800,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1089144,c2:0.04119808,c3:0.9338235,c4:1;n:type:ShaderForge.SFN_Multiply,id:2459,x:32389,y:33171,varname:node_2459,prsc:2|A-203-OUT,B-4800-RGB,C-2370-OUT;n:type:ShaderForge.SFN_Slider,id:9733,x:32055,y:33479,ptovrint:False,ptlb:01,ptin:_01,varname:node_9733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:8449,x:31771,y:33144,ptovrint:False,ptlb:node_8449,ptin:_node_8449,varname:node_8449,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:11;n:type:ShaderForge.SFN_RemapRange,id:2370,x:32378,y:33438,varname:node_2370,prsc:2,frmn:0,frmx:1,tomn:0.1,tomx:11|IN-9733-OUT;n:type:ShaderForge.SFN_NormalVector,id:4330,x:31479,y:32602,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:1705,x:31479,y:32779,varname:node_1705,prsc:2;n:type:ShaderForge.SFN_Dot,id:6928,x:31674,y:32669,varname:node_6928,prsc:2,dt:1|A-4330-OUT,B-1705-OUT;n:type:ShaderForge.SFN_OneMinus,id:9873,x:31855,y:32701,varname:node_9873,prsc:2|IN-6928-OUT;n:type:ShaderForge.SFN_Power,id:5222,x:32068,y:32790,varname:node_5222,prsc:2|VAL-9873-OUT,EXP-4706-OUT;n:type:ShaderForge.SFN_Slider,id:4706,x:31684,y:32928,ptovrint:False,ptlb:node_4706,ptin:_node_4706,varname:node_4706,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:11,max:11;proporder:8641-4800-9733-8449-4706;pass:END;sub:END;*/

Shader "Custom/test02" {
    Properties {
        _node_8641 ("node_8641", 2D) = "white" {}
        _node_4800 ("node_4800", Color) = (0.1089144,0.04119808,0.9338235,1)
        _01 ("01", Range(0, 1)) = 1
        _node_8449 ("node_8449", Range(0, 11)) = 0
        _node_4706 ("node_4706", Range(0, 11)) = 11
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
            uniform sampler2D _node_8641; uniform float4 _node_8641_ST;
            uniform float4 _node_4800;
            uniform float _01;
            uniform float _node_8449;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _node_8641_var = tex2D(_node_8641,TRANSFORM_TEX(i.uv0, _node_8641));
                float3 finalColor = (_node_8641_var.rgb+(pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_8449)*_node_4800.rgb*(_01*10.9+0.1)));
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
