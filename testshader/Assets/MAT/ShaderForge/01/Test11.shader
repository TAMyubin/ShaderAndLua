// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8568,x:32719,y:32712,varname:node_8568,prsc:2|custl-650-OUT;n:type:ShaderForge.SFN_SceneColor,id:4109,x:32376,y:32969,varname:node_4109,prsc:2|UVIN-5257-UVOUT;n:type:ShaderForge.SFN_Parallax,id:5257,x:32191,y:32948,varname:node_5257,prsc:2|UVIN-506-OUT,HEI-952-OUT;n:type:ShaderForge.SFN_Slider,id:952,x:31867,y:33051,ptovrint:False,ptlb:node_952,ptin:_node_952,varname:node_952,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:-3.400566,max:10;n:type:ShaderForge.SFN_Lerp,id:506,x:31597,y:32875,varname:node_506,prsc:2|A-1275-UVOUT,B-54-OUT,T-7137-OUT;n:type:ShaderForge.SFN_ScreenPos,id:1275,x:31271,y:32776,varname:node_1275,prsc:2,sctp:0;n:type:ShaderForge.SFN_Tex2d,id:8022,x:31144,y:32947,ptovrint:False,ptlb:node_8022,ptin:_node_8022,varname:node_8022,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:7137,x:31287,y:33147,ptovrint:False,ptlb:node_7137,ptin:_node_7137,varname:node_7137,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3931624,max:1;n:type:ShaderForge.SFN_Append,id:54,x:31423,y:32949,varname:node_54,prsc:2|A-8022-R,B-8022-G;n:type:ShaderForge.SFN_Fresnel,id:4835,x:32295,y:32722,varname:node_4835,prsc:2|EXP-7249-OUT;n:type:ShaderForge.SFN_Add,id:650,x:32498,y:32760,varname:node_650,prsc:2|A-4835-OUT,B-4109-RGB;n:type:ShaderForge.SFN_Exp,id:7249,x:32118,y:32745,varname:node_7249,prsc:2,et:1|IN-4589-OUT;n:type:ShaderForge.SFN_Slider,id:4589,x:31770,y:32819,ptovrint:False,ptlb:node_4589,ptin:_node_4589,varname:node_4589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.613327,max:10;proporder:952-8022-7137-4589;pass:END;sub:END;*/

Shader "Custom/Test11" {
    Properties {
        _node_952 ("node_952", Range(-10, 10)) = -3.400566
        _node_8022 ("node_8022", 2D) = "white" {}
        _node_7137 ("node_7137", Range(0, 1)) = 0.3931624
        _node_4589 ("node_4589", Range(0, 10)) = 2.613327
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
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
            uniform sampler2D _GrabTexture;
            uniform float _node_952;
            uniform sampler2D _node_8022; uniform float4 _node_8022_ST;
            uniform float _node_7137;
            uniform float _node_4589;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float node_4835 = pow(1.0-max(0,dot(normalDirection, viewDirection)),exp2(_node_4589));
                float4 _node_8022_var = tex2D(_node_8022,TRANSFORM_TEX(i.uv0, _node_8022));
                float4 node_4109 = tex2D( _GrabTexture, (0.05*(_node_952 - 0.5)*mul(tangentTransform, viewDirection).xy + lerp(i.screenPos.rg,float2(_node_8022_var.r,_node_8022_var.g),_node_7137)).rg);
                float3 finalColor = (node_4835+node_4109.rgb);
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
