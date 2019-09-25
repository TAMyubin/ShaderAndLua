// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6518,x:32719,y:32712,varname:node_6518,prsc:2|custl-2848-OUT;n:type:ShaderForge.SFN_Tex2d,id:2559,x:32296,y:32838,ptovrint:False,ptlb:node_2559,ptin:_node_2559,varname:node_2559,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2848,x:32522,y:32906,varname:node_2848,prsc:2|A-2559-RGB,B-2559-A,C-8227-OUT,D-549-OUT;n:type:ShaderForge.SFN_Color,id:56,x:32072,y:32984,ptovrint:False,ptlb:node_56,ptin:_node_56,varname:node_56,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:7779,x:32092,y:33158,ptovrint:False,ptlb:node_7779,ptin:_node_7779,varname:node_7779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:8227,x:32282,y:33039,varname:node_8227,prsc:2|A-56-RGB,B-7779-OUT,C-56-A;n:type:ShaderForge.SFN_VertexColor,id:4948,x:32237,y:33261,varname:node_4948,prsc:2;n:type:ShaderForge.SFN_Multiply,id:549,x:32436,y:33210,varname:node_549,prsc:2|A-4948-RGB,B-4948-A;proporder:2559-56-7779;pass:END;sub:END;*/

Shader "Custom/test06-" {
    Properties {
        _node_2559 ("node_2559", 2D) = "white" {}
        _node_56 ("node_56", Color) = (0.5,0.5,0.5,1)
        _node_7779 ("node_7779", Float ) = 0
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
            uniform sampler2D _node_2559; uniform float4 _node_2559_ST;
            uniform float4 _node_56;
            uniform float _node_7779;
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
                float4 _node_2559_var = tex2D(_node_2559,TRANSFORM_TEX(i.uv0, _node_2559));
                float3 finalColor = (_node_2559_var.rgb*_node_2559_var.a*(_node_56.rgb*_node_7779*_node_56.a)*(i.vertexColor.rgb*i.vertexColor.a));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
