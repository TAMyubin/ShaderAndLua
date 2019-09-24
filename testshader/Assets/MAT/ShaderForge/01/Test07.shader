// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:185,x:32765,y:32630,varname:node_185,prsc:2|custl-9512-OUT;n:type:ShaderForge.SFN_Tex2d,id:436,x:32131,y:32632,ptovrint:False,ptlb:3,ptin:_3,varname:node_436,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:66321cc856b03e245ac41ed8a53e0ecc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:6512,x:31837,y:32796,varname:node_6512,prsc:2|EXP-5937-OUT;n:type:ShaderForge.SFN_Add,id:9512,x:32376,y:32772,varname:node_9512,prsc:2|A-436-RGB,B-2509-OUT;n:type:ShaderForge.SFN_Color,id:3686,x:31868,y:33003,ptovrint:False,ptlb:node_3686,ptin:_node_3686,varname:node_3686,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.03568337,c2:0.04213093,c3:0.9705882,c4:1;n:type:ShaderForge.SFN_Multiply,id:5421,x:32131,y:32887,varname:node_5421,prsc:2|A-6512-OUT,B-3686-RGB;n:type:ShaderForge.SFN_Slider,id:5937,x:31512,y:32852,ptovrint:False,ptlb:01,ptin:_01,varname:node_5937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:7.482925,max:11;n:type:ShaderForge.SFN_Multiply,id:2509,x:32256,y:33069,varname:node_2509,prsc:2|A-5421-OUT,B-5155-OUT;n:type:ShaderForge.SFN_Slider,id:5155,x:31911,y:33232,ptovrint:False,ptlb:02,ptin:_02,varname:node_5155,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:11,max:11;proporder:436-3686-5937-5155;pass:END;sub:END;*/

Shader "Custom/Test07" {
    Properties {
        _3 ("3", 2D) = "white" {}
        _node_3686 ("node_3686", Color) = (0.03568337,0.04213093,0.9705882,1)
        _01 ("01", Range(1, 11)) = 7.482925
        _02 ("02", Range(0, 11)) = 11
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
            uniform sampler2D _3; uniform float4 _3_ST;
            uniform float4 _node_3686;
            uniform float _01;
            uniform float _02;
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
                float4 _3_var = tex2D(_3,TRANSFORM_TEX(i.uv0, _3));
                float3 finalColor = (_3_var.rgb+((pow(1.0-max(0,dot(normalDirection, viewDirection)),_01)*_node_3686.rgb)*_02));
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
