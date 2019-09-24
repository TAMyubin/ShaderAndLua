// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9118,x:32656,y:32676,varname:node_9118,prsc:2|diff-7976-OUT,custl-7976-OUT;n:type:ShaderForge.SFN_Tex2d,id:5080,x:32235,y:32712,ptovrint:False,ptlb:node_5080,ptin:_node_5080,varname:node_5080,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:66321cc856b03e245ac41ed8a53e0ecc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:8311,x:31951,y:32939,varname:node_8311,prsc:2;n:type:ShaderForge.SFN_Add,id:7976,x:32399,y:32917,varname:node_7976,prsc:2|A-5080-RGB,B-2521-OUT;n:type:ShaderForge.SFN_Multiply,id:2801,x:32072,y:33059,varname:node_2801,prsc:2|A-8311-OUT,B-4315-RGB;n:type:ShaderForge.SFN_Color,id:4315,x:31749,y:33246,ptovrint:False,ptlb:node_4315,ptin:_node_4315,varname:node_4315,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9779412,c2:0,c3:0.9509637,c4:1;n:type:ShaderForge.SFN_Multiply,id:2521,x:32296,y:33188,varname:node_2521,prsc:2|A-2801-OUT,B-4061-OUT;n:type:ShaderForge.SFN_Slider,id:4061,x:32008,y:33341,ptovrint:False,ptlb:node_4061,ptin:_node_4061,varname:node_4061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10.07562,max:11;proporder:5080-4315-4061;pass:END;sub:END;*/

Shader "Custom/Test06" {
    Properties {
        _node_5080 ("node_5080", 2D) = "white" {}
        _node_4315 ("node_4315", Color) = (0.9779412,0,0.9509637,1)
        _node_4061 ("node_4061", Range(0, 11)) = 10.07562
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _node_5080; uniform float4 _node_5080_ST;
            uniform float4 _node_4315;
            uniform float _node_4061;
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
                float4 _node_5080_var = tex2D(_node_5080,TRANSFORM_TEX(i.uv0, _node_5080));
                float3 node_7976 = (_node_5080_var.rgb+(((1.0-max(0,dot(normalDirection, viewDirection)))*_node_4315.rgb)*_node_4061));
                float3 finalColor = node_7976;
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
