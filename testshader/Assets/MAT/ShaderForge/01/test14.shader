// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9524,x:32786,y:32625,varname:node_9524,prsc:2|custl-8873-OUT;n:type:ShaderForge.SFN_Tex2d,id:9639,x:32214,y:32721,ptovrint:False,ptlb:node_9639,ptin:_node_9639,varname:node_9639,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:3817,x:31568,y:32941,varname:node_3817,prsc:2;n:type:ShaderForge.SFN_Color,id:8717,x:31619,y:33246,ptovrint:False,ptlb:node_8717,ptin:_node_8717,varname:node_8717,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8681,x:31931,y:33167,varname:node_8681,prsc:2|A-8717-RGB,B-8668-OUT;n:type:ShaderForge.SFN_Vector1,id:8668,x:31582,y:33459,varname:node_8668,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:3522,x:32229,y:33085,varname:node_3522,prsc:2|A-4906-OUT,B-8681-OUT,C-3230-OUT;n:type:ShaderForge.SFN_Depth,id:4323,x:32306,y:32544,varname:node_4323,prsc:2;n:type:ShaderForge.SFN_If,id:8873,x:32592,y:32576,varname:node_8873,prsc:2|A-3747-OUT,B-4323-OUT,GT-9639-RGB,EQ-9639-RGB,LT-286-OUT;n:type:ShaderForge.SFN_ScreenPos,id:4033,x:32049,y:32436,varname:node_4033,prsc:2,sctp:2;n:type:ShaderForge.SFN_SceneDepth,id:3747,x:32306,y:32395,varname:node_3747,prsc:2;n:type:ShaderForge.SFN_Power,id:4906,x:31807,y:32963,varname:node_4906,prsc:2|VAL-3817-OUT,EXP-2908-OUT;n:type:ShaderForge.SFN_Exp,id:2908,x:31606,y:33067,varname:node_2908,prsc:2,et:1|IN-1873-OUT;n:type:ShaderForge.SFN_Slider,id:1873,x:31201,y:33190,ptovrint:False,ptlb:node_1873,ptin:_node_1873,varname:node_1873,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.293036,max:10;n:type:ShaderForge.SFN_Slider,id:3230,x:31838,y:33422,ptovrint:False,ptlb:node_3230,ptin:_node_3230,varname:node_3230,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.378739,max:10;n:type:ShaderForge.SFN_Add,id:286,x:32464,y:32937,varname:node_286,prsc:2|A-9639-RGB,B-3522-OUT;proporder:8717-9639-1873-3230;pass:END;sub:END;*/

Shader "Custom/test14" {
    Properties {
        _node_8717 ("node_8717", Color) = (0.5,0.5,0.5,1)
        _node_9639 ("node_9639", 2D) = "white" {}
        _node_1873 ("node_1873", Range(0, 10)) = 2.293036
        _node_3230 ("node_3230", Range(0, 10)) = 3.378739
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
            ZTest Always
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _node_9639; uniform float4 _node_9639_ST;
            uniform float4 _node_8717;
            uniform float _node_1873;
            uniform float _node_3230;
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
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float node_8873_if_leA = step(sceneZ,partZ);
                float node_8873_if_leB = step(partZ,sceneZ);
                float4 _node_9639_var = tex2D(_node_9639,TRANSFORM_TEX(i.uv0, _node_9639));
                float3 finalColor = lerp((node_8873_if_leA*(_node_9639_var.rgb+(pow((1.0-max(0,dot(normalDirection, viewDirection))),exp2(_node_1873))*(_node_8717.rgb*2.0)*_node_3230)))+(node_8873_if_leB*_node_9639_var.rgb),_node_9639_var.rgb,node_8873_if_leA*node_8873_if_leB);
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
