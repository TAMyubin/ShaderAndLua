// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9976,x:32614,y:32632,varname:node_9976,prsc:2|custl-1530-OUT;n:type:ShaderForge.SFN_Tex2d,id:4260,x:32192,y:32774,ptovrint:False,ptlb:node_4260,ptin:_node_4260,varname:node_4260,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:66321cc856b03e245ac41ed8a53e0ecc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:8641,x:32264,y:33023,varname:node_8641,prsc:2|NRM-4807-OUT,EXP-9058-OUT;n:type:ShaderForge.SFN_NormalVector,id:4807,x:32050,y:32984,prsc:2,pt:False;n:type:ShaderForge.SFN_Add,id:1530,x:32417,y:32830,varname:node_1530,prsc:2|A-4260-RGB,B-7066-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9058,x:32071,y:33187,ptovrint:False,ptlb:node_9058,ptin:_node_9058,varname:node_9058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Color,id:9729,x:32222,y:33187,ptovrint:False,ptlb:node_9729,ptin:_node_9729,varname:node_9729,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9632353,c2:0.1345697,c3:0.3917416,c4:1;n:type:ShaderForge.SFN_Multiply,id:7066,x:32447,y:33064,varname:node_7066,prsc:2|A-8641-OUT,B-9729-RGB,C-4780-OUT;n:type:ShaderForge.SFN_Slider,id:4780,x:32211,y:33301,ptovrint:False,ptlb:node_4780,ptin:_node_4780,varname:node_4780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:4260-9058-9729-4780;pass:END;sub:END;*/

Shader "Custom/Test05" {
    Properties {
        _node_4260 ("node_4260", 2D) = "white" {}
        _node_9058 ("node_9058", Float ) = 3
        _node_9729 ("node_9729", Color) = (0.9632353,0.1345697,0.3917416,1)
        _node_4780 ("node_4780", Range(0, 1)) = 0
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
            uniform sampler2D _node_4260; uniform float4 _node_4260_ST;
            uniform float _node_9058;
            uniform float4 _node_9729;
            uniform float _node_4780;
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
                float4 _node_4260_var = tex2D(_node_4260,TRANSFORM_TEX(i.uv0, _node_4260));
                float3 finalColor = (_node_4260_var.rgb+(pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_9058)*_node_9729.rgb*_node_4780));
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
