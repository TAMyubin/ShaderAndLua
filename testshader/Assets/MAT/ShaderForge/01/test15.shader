// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7227,x:32719,y:32712,varname:node_7227,prsc:2|custl-9560-OUT,alpha-8762-A;n:type:ShaderForge.SFN_TexCoord,id:9755,x:30376,y:32729,varname:node_9755,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Sin,id:9863,x:31275,y:32898,varname:node_9863,prsc:2|IN-6417-OUT;n:type:ShaderForge.SFN_RemapRange,id:3836,x:30834,y:32805,varname:node_3836,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-4135-OUT;n:type:ShaderForge.SFN_Power,id:8258,x:31471,y:32923,varname:node_8258,prsc:2|VAL-9863-OUT,EXP-6353-OUT;n:type:ShaderForge.SFN_Exp,id:6353,x:31304,y:33051,varname:node_6353,prsc:2,et:0|IN-4572-OUT;n:type:ShaderForge.SFN_Slider,id:4572,x:30934,y:33235,ptovrint:False,ptlb:node_4572,ptin:_node_4572,varname:node_4572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.4965,max:10;n:type:ShaderForge.SFN_Add,id:9560,x:32422,y:32812,varname:node_9560,prsc:2|A-8762-RGB,B-4622-OUT;n:type:ShaderForge.SFN_Color,id:6720,x:31864,y:33220,ptovrint:False,ptlb:node_6720,ptin:_node_6720,varname:node_6720,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:8401,x:31882,y:33372,varname:node_8401,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:5748,x:30692,y:33032,ptovrint:False,ptlb:node_5748,ptin:_node_5748,varname:node_5748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-3.2,cur:0,max:3.2;n:type:ShaderForge.SFN_Add,id:6417,x:31104,y:32783,varname:node_6417,prsc:2|A-3836-OUT,B-5748-OUT;n:type:ShaderForge.SFN_Clamp,id:1458,x:31758,y:32996,varname:node_1458,prsc:2|IN-8258-OUT,MIN-5582-OUT,MAX-2188-OUT;n:type:ShaderForge.SFN_Vector1,id:5582,x:31552,y:33051,varname:node_5582,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:2188,x:31552,y:33130,varname:node_2188,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:8762,x:32051,y:32834,ptovrint:False,ptlb:node_8762,ptin:_node_8762,varname:node_8762,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4622,x:32220,y:33110,varname:node_4622,prsc:2|A-9768-OUT,B-6720-RGB,C-8401-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9768,x:31782,y:32757,varname:node_9768,prsc:2,min:1E-05,max:1|IN-8258-OUT;n:type:ShaderForge.SFN_Lerp,id:4135,x:30590,y:32823,varname:node_4135,prsc:2|A-9755-U,B-9755-V,T-1487-OUT;n:type:ShaderForge.SFN_Slider,id:1487,x:30334,y:33037,ptovrint:False,ptlb:node_1487,ptin:_node_1487,varname:node_1487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:4572-6720-5748-8762-1487;pass:END;sub:END;*/

Shader "Custom/test15" {
    Properties {
        _node_4572 ("node_4572", Range(0, 10)) = 3.4965
        [HDR]_node_6720 ("node_6720", Color) = (0.5,0.5,0.5,1)
        _node_5748 ("node_5748", Range(-3.2, 3.2)) = 0
        _node_8762 ("node_8762", 2D) = "white" {}
        _node_1487 ("node_1487", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float _node_4572;
            uniform float4 _node_6720;
            uniform float _node_5748;
            uniform sampler2D _node_8762; uniform float4 _node_8762_ST;
            uniform float _node_1487;
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
                float4 _node_8762_var = tex2D(_node_8762,TRANSFORM_TEX(i.uv0, _node_8762));
                float node_8258 = pow(sin(((lerp(i.uv0.r,i.uv0.g,_node_1487)*3.14+0.0)+_node_5748)),exp(_node_4572));
                float node_8401 = 2.0;
                float3 finalColor = (_node_8762_var.rgb+(clamp(node_8258,1E-05,1)*_node_6720.rgb*node_8401));
                fixed4 finalRGBA = fixed4(finalColor,_node_8762_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
