// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1366,x:32719,y:32712,varname:node_1366,prsc:2|custl-9421-OUT;n:type:ShaderForge.SFN_Tex2d,id:3792,x:32206,y:32891,ptovrint:False,ptlb:node_3792,ptin:_node_3792,varname:node_3792,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9421,x:32467,y:32987,varname:node_9421,prsc:2|A-3792-RGB,B-3792-A,C-3397-OUT,D-845-OUT;n:type:ShaderForge.SFN_Color,id:4889,x:31940,y:33092,ptovrint:False,ptlb:node_4889,ptin:_node_4889,varname:node_4889,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:2977,x:31940,y:33281,ptovrint:False,ptlb:node_2977,ptin:_node_2977,varname:node_2977,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_VertexColor,id:5876,x:32314,y:33384,varname:node_5876,prsc:2;n:type:ShaderForge.SFN_Multiply,id:845,x:32495,y:33339,varname:node_845,prsc:2|A-5876-RGB,B-5876-A;n:type:ShaderForge.SFN_Multiply,id:3397,x:32182,y:33126,varname:node_3397,prsc:2|A-4889-RGB,B-2977-OUT;proporder:3792-4889-2977;pass:END;sub:END;*/

Shader "Custom/test06_particle" {
    Properties {
        _node_3792 ("node_3792", 2D) = "white" {}
        _node_4889 ("node_4889", Color) = (0.5,0.5,0.5,1)
        _node_2977 ("node_2977", Float ) = 2
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_3792; uniform float4 _node_3792_ST;
            uniform float4 _node_4889;
            uniform float _node_2977;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _node_3792_var = tex2D(_node_3792,TRANSFORM_TEX(i.uv0, _node_3792));
                float3 finalColor = (_node_3792_var.rgb*_node_3792_var.a*(_node_4889.rgb*_node_2977)*(i.vertexColor.rgb*i.vertexColor.a));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
