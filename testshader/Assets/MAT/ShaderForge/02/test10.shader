// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8199,x:32719,y:32712,varname:node_8199,prsc:2|normal-6688-RGB,custl-5134-OUT;n:type:ShaderForge.SFN_Tex2d,id:8181,x:31594,y:32777,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_8181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Set,id:5695,x:32009,y:32694,varname:MainTex,prsc:2|IN-8181-RGB;n:type:ShaderForge.SFN_NormalVector,id:472,x:31201,y:33159,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:2295,x:31318,y:32965,varname:node_2295,prsc:2;n:type:ShaderForge.SFN_Dot,id:197,x:31493,y:32998,varname:node_197,prsc:2,dt:1|A-472-OUT,B-2295-OUT;n:type:ShaderForge.SFN_Vector1,id:2303,x:31523,y:32889,varname:node_2303,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9307,x:31879,y:32942,varname:node_9307,prsc:2|A-2303-OUT,B-9495-OUT;n:type:ShaderForge.SFN_Add,id:9495,x:31716,y:32969,varname:node_9495,prsc:2|A-2303-OUT,B-197-OUT;n:type:ShaderForge.SFN_Multiply,id:3417,x:32077,y:33037,varname:node_3417,prsc:2|A-9307-OUT,B-8022-OUT;n:type:ShaderForge.SFN_Slider,id:8022,x:31716,y:33173,ptovrint:False,ptlb:MainTexIntensity,ptin:_MainTexIntensity,varname:node_8022,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9439588,max:3;n:type:ShaderForge.SFN_Multiply,id:6784,x:32281,y:32906,varname:node_6784,prsc:2|A-8181-RGB,B-3417-OUT;n:type:ShaderForge.SFN_HalfVector,id:2877,x:31392,y:33291,varname:node_2877,prsc:2;n:type:ShaderForge.SFN_Dot,id:5509,x:31594,y:33245,varname:node_5509,prsc:2,dt:1|A-472-OUT,B-2877-OUT;n:type:ShaderForge.SFN_Power,id:2243,x:31844,y:33274,varname:node_2243,prsc:2|VAL-5509-OUT,EXP-3136-OUT;n:type:ShaderForge.SFN_Exp,id:3136,x:31697,y:33421,varname:node_3136,prsc:2,et:1|IN-8499-OUT;n:type:ShaderForge.SFN_Slider,id:8499,x:31325,y:33513,ptovrint:False,ptlb:SpecularRange,ptin:_SpecularRange,varname:node_8499,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.706895,max:10;n:type:ShaderForge.SFN_Multiply,id:9720,x:32074,y:33302,varname:node_9720,prsc:2|A-2243-OUT,B-1346-OUT;n:type:ShaderForge.SFN_Slider,id:1346,x:31634,y:33578,ptovrint:False,ptlb:specularIntensity,ptin:_specularIntensity,varname:node_1346,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:9.0259,max:10;n:type:ShaderForge.SFN_Add,id:5134,x:32464,y:33021,varname:node_5134,prsc:2|A-6784-OUT,B-7989-OUT,C-9836-OUT,D-3039-OUT;n:type:ShaderForge.SFN_Get,id:6997,x:31388,y:33681,varname:node_6997,prsc:2|IN-5695-OUT;n:type:ShaderForge.SFN_Desaturate,id:7138,x:31560,y:33742,varname:node_7138,prsc:2|COL-6997-OUT;n:type:ShaderForge.SFN_RemapRange,id:7255,x:31759,y:33702,varname:node_7255,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7138-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9569,x:31951,y:33727,varname:node_9569,prsc:2,min:0,max:1|IN-7255-OUT;n:type:ShaderForge.SFN_Multiply,id:7989,x:32217,y:33543,varname:node_7989,prsc:2|A-9720-OUT,B-9569-OUT,C-3323-RGB,D-342-OUT;n:type:ShaderForge.SFN_Color,id:3323,x:32060,y:33842,ptovrint:False,ptlb:node_3323,ptin:_node_3323,varname:node_3323,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:342,x:32118,y:33973,varname:node_342,prsc:2,v1:2;n:type:ShaderForge.SFN_RemapRange,id:2404,x:31614,y:33902,varname:node_2404,prsc:2,frmn:0,frmx:1,tomn:2,tomx:-2|IN-7138-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:8614,x:31776,y:33966,varname:node_8614,prsc:2,min:0,max:1|IN-2404-OUT;n:type:ShaderForge.SFN_Multiply,id:9836,x:32148,y:34081,varname:node_9836,prsc:2|A-8614-OUT,B-9626-RGB,C-4289-OUT,D-1464-OUT;n:type:ShaderForge.SFN_Color,id:9626,x:31712,y:34179,ptovrint:False,ptlb:node_9626,ptin:_node_9626,varname:node_9626,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07942256,c2:0.6132181,c3:0.8308824,c4:1;n:type:ShaderForge.SFN_Vector1,id:4289,x:31885,y:34279,varname:node_4289,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:1464,x:31882,y:34401,ptovrint:False,ptlb:Edge,ptin:_Edge,varname:node_1464,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Fresnel,id:3993,x:32743,y:33444,varname:node_3993,prsc:2|EXP-7350-OUT;n:type:ShaderForge.SFN_Slider,id:9203,x:32275,y:33454,ptovrint:False,ptlb:FresnelIntenstty,ptin:_FresnelIntenstty,varname:node_9203,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.429956,max:10;n:type:ShaderForge.SFN_Multiply,id:3039,x:32945,y:33421,varname:node_3039,prsc:2|A-3993-OUT,B-4280-RGB,C-9698-OUT;n:type:ShaderForge.SFN_Color,id:4280,x:32719,y:33636,ptovrint:False,ptlb:Fresnelcolor,ptin:_Fresnelcolor,varname:node_4280,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:9698,x:32859,y:33821,varname:node_9698,prsc:2,v1:2;n:type:ShaderForge.SFN_RemapRange,id:7350,x:32580,y:33524,varname:node_7350,prsc:2,frmn:0,frmx:10,tomn:10,tomx:1|IN-9203-OUT;n:type:ShaderForge.SFN_Tex2d,id:6688,x:32439,y:32712,ptovrint:False,ptlb:node_6688,ptin:_node_6688,varname:node_6688,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;proporder:8181-8022-8499-1346-3323-9626-1464-9203-4280-6688;pass:END;sub:END;*/

Shader "Custom/test10" {
    Properties {
        _maintex ("maintex", 2D) = "white" {}
        _MainTexIntensity ("MainTexIntensity", Range(0, 3)) = 0.9439588
        _SpecularRange ("SpecularRange", Range(0, 10)) = 6.706895
        _specularIntensity ("specularIntensity", Range(0, 10)) = 9.0259
        _node_3323 ("node_3323", Color) = (0.5,0.5,0.5,1)
        [HDR]_node_9626 ("node_9626", Color) = (0.07942256,0.6132181,0.8308824,1)
        _Edge ("Edge", Range(0, 10)) = 0
        _FresnelIntenstty ("FresnelIntenstty", Range(0, 10)) = 2.429956
        _Fresnelcolor ("Fresnelcolor", Color) = (0.5,0.5,0.5,1)
        _node_6688 ("node_6688", 2D) = "bump" {}
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            uniform float _MainTexIntensity;
            uniform float _SpecularRange;
            uniform float _specularIntensity;
            uniform float4 _node_3323;
            uniform float4 _node_9626;
            uniform float _Edge;
            uniform float _FresnelIntenstty;
            uniform float4 _Fresnelcolor;
            uniform sampler2D _node_6688; uniform float4 _node_6688_ST;
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
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_6688_var = UnpackNormal(tex2D(_node_6688,TRANSFORM_TEX(i.uv0, _node_6688)));
                float3 normalLocal = _node_6688_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(i.uv0, _maintex));
                float node_2303 = 0.5;
                float3 MainTex = _maintex_var.rgb;
                float node_7138 = dot(MainTex,float3(0.3,0.59,0.11));
                float3 finalColor = ((_maintex_var.rgb*((node_2303*(node_2303+max(0,dot(normalDirection,lightDirection))))*_MainTexIntensity))+((pow(max(0,dot(normalDirection,halfDirection)),exp2(_SpecularRange))*_specularIntensity)*clamp((node_7138*2.0+-1.0),0,1)*_node_3323.rgb*2.0)+(clamp((node_7138*-4.0+2.0),0,1)*_node_9626.rgb*2.0*_Edge)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),(_FresnelIntenstty*-0.9+10.0))*_Fresnelcolor.rgb*2.0));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            uniform float _MainTexIntensity;
            uniform float _SpecularRange;
            uniform float _specularIntensity;
            uniform float4 _node_3323;
            uniform float4 _node_9626;
            uniform float _Edge;
            uniform float _FresnelIntenstty;
            uniform float4 _Fresnelcolor;
            uniform sampler2D _node_6688; uniform float4 _node_6688_ST;
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
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_6688_var = UnpackNormal(tex2D(_node_6688,TRANSFORM_TEX(i.uv0, _node_6688)));
                float3 normalLocal = _node_6688_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(i.uv0, _maintex));
                float node_2303 = 0.5;
                float3 MainTex = _maintex_var.rgb;
                float node_7138 = dot(MainTex,float3(0.3,0.59,0.11));
                float3 finalColor = ((_maintex_var.rgb*((node_2303*(node_2303+max(0,dot(normalDirection,lightDirection))))*_MainTexIntensity))+((pow(max(0,dot(normalDirection,halfDirection)),exp2(_SpecularRange))*_specularIntensity)*clamp((node_7138*2.0+-1.0),0,1)*_node_3323.rgb*2.0)+(clamp((node_7138*-4.0+2.0),0,1)*_node_9626.rgb*2.0*_Edge)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),(_FresnelIntenstty*-0.9+10.0))*_Fresnelcolor.rgb*2.0));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
