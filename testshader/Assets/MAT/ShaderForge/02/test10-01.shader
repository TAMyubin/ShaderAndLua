// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2908,x:32719,y:32712,varname:node_2908,prsc:2|normal-405-RGB,custl-340-OUT;n:type:ShaderForge.SFN_Tex2d,id:3117,x:31324,y:32383,ptovrint:False,ptlb:node_3117,ptin:_node_3117,varname:node_3117,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:6767,x:31430,y:32598,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:1739,x:31430,y:32776,varname:node_1739,prsc:2;n:type:ShaderForge.SFN_Dot,id:947,x:31626,y:32661,varname:node_947,prsc:2,dt:1|A-6767-OUT,B-1739-OUT;n:type:ShaderForge.SFN_Add,id:7937,x:31798,y:32631,varname:node_7937,prsc:2|A-5447-OUT,B-947-OUT;n:type:ShaderForge.SFN_Vector1,id:5447,x:31626,y:32612,varname:node_5447,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:2209,x:32188,y:32494,varname:node_2209,prsc:2|A-3117-RGB,B-3753-OUT,C-8313-OUT;n:type:ShaderForge.SFN_Slider,id:8313,x:31932,y:32767,ptovrint:False,ptlb:MainTexIntensity,ptin:_MainTexIntensity,varname:node_8313,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7294327,max:5;n:type:ShaderForge.SFN_Exp,id:3358,x:31629,y:32999,varname:node_3358,prsc:2,et:0|IN-5989-OUT;n:type:ShaderForge.SFN_Slider,id:1222,x:31128,y:33086,ptovrint:False,ptlb:SpecularRage,ptin:_SpecularRage,varname:node_1222,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.315388,max:10;n:type:ShaderForge.SFN_HalfVector,id:8946,x:31430,y:32911,varname:node_8946,prsc:2;n:type:ShaderForge.SFN_Dot,id:3966,x:31614,y:32837,varname:node_3966,prsc:2,dt:1|A-6767-OUT,B-8946-OUT;n:type:ShaderForge.SFN_Power,id:7079,x:31809,y:32860,varname:node_7079,prsc:2|VAL-3966-OUT,EXP-3358-OUT;n:type:ShaderForge.SFN_RemapRange,id:5989,x:31461,y:33068,varname:node_5989,prsc:2,frmn:0,frmx:10,tomn:10,tomx:0|IN-1222-OUT;n:type:ShaderForge.SFN_Multiply,id:8609,x:32138,y:32911,varname:node_8609,prsc:2|A-7079-OUT,B-2390-OUT,C-1529-OUT;n:type:ShaderForge.SFN_Slider,id:2390,x:31763,y:33068,ptovrint:False,ptlb:SpecularIntensity,ptin:_SpecularIntensity,varname:node_2390,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:8.452153,max:10;n:type:ShaderForge.SFN_Multiply,id:3753,x:32022,y:32590,varname:node_3753,prsc:2|A-5447-OUT,B-7937-OUT;n:type:ShaderForge.SFN_Add,id:340,x:32405,y:32654,varname:node_340,prsc:2|A-2209-OUT,B-8609-OUT,C-6817-OUT,D-7860-OUT;n:type:ShaderForge.SFN_Set,id:6988,x:31563,y:32363,varname:MainTex,prsc:2|IN-3117-RGB;n:type:ShaderForge.SFN_Get,id:8031,x:31383,y:33209,varname:node_8031,prsc:2|IN-6988-OUT;n:type:ShaderForge.SFN_Desaturate,id:5367,x:31568,y:33209,varname:node_5367,prsc:2|COL-8031-OUT;n:type:ShaderForge.SFN_RemapRange,id:7626,x:31741,y:33209,varname:node_7626,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5367-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:1529,x:31892,y:33185,varname:node_1529,prsc:2,min:0,max:1|IN-7626-OUT;n:type:ShaderForge.SFN_RemapRange,id:9204,x:31645,y:33374,varname:node_9204,prsc:2,frmn:0,frmx:1,tomn:2,tomx:-2|IN-5367-OUT;n:type:ShaderForge.SFN_Multiply,id:4228,x:31929,y:33386,varname:node_4228,prsc:2|A-6259-OUT,B-3339-RGB,C-4788-OUT;n:type:ShaderForge.SFN_Color,id:3339,x:31741,y:33549,ptovrint:False,ptlb:node_3339,ptin:_node_3339,varname:node_3339,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3664809,c3:0.7279412,c4:1;n:type:ShaderForge.SFN_Vector1,id:4788,x:31741,y:33689,varname:node_4788,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6817,x:32185,y:33392,varname:node_6817,prsc:2|A-4228-OUT,B-7903-OUT;n:type:ShaderForge.SFN_Slider,id:7903,x:31929,y:33609,ptovrint:False,ptlb:edge,ptin:_edge,varname:node_7903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.495145,max:10;n:type:ShaderForge.SFN_ConstantClamp,id:6259,x:31784,y:33356,varname:node_6259,prsc:2,min:0,max:1|IN-9204-OUT;n:type:ShaderForge.SFN_Fresnel,id:5702,x:31839,y:33927,varname:node_5702,prsc:2;n:type:ShaderForge.SFN_Power,id:1065,x:32046,y:33927,varname:node_1065,prsc:2|VAL-5702-OUT,EXP-9055-OUT;n:type:ShaderForge.SFN_Exp,id:9055,x:31879,y:34095,varname:node_9055,prsc:2,et:0|IN-2612-OUT;n:type:ShaderForge.SFN_Slider,id:2612,x:31551,y:34196,ptovrint:False,ptlb:FresnelIntensity,ptin:_FresnelIntensity,varname:node_2612,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.838446,max:10;n:type:ShaderForge.SFN_Multiply,id:7860,x:32266,y:33927,varname:node_7860,prsc:2|A-1065-OUT,B-3077-RGB;n:type:ShaderForge.SFN_Color,id:3077,x:32084,y:34095,ptovrint:False,ptlb:Fresnalecolor,ptin:_Fresnalecolor,varname:node_3077,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07414825,c2:0.006596027,c3:0.8970588,c4:1;n:type:ShaderForge.SFN_Tex2d,id:405,x:32670,y:32476,ptovrint:False,ptlb:node_405,ptin:_node_405,varname:node_405,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;proporder:3117-8313-1222-2390-3339-7903-2612-3077-405;pass:END;sub:END;*/

Shader "Custom/test10-1" {
    Properties {
        _node_3117 ("node_3117", 2D) = "white" {}
        _MainTexIntensity ("MainTexIntensity", Range(0, 5)) = 0.7294327
        _SpecularRage ("SpecularRage", Range(0, 10)) = 6.315388
        _SpecularIntensity ("SpecularIntensity", Range(0, 10)) = 8.452153
        _node_3339 ("node_3339", Color) = (0,0.3664809,0.7279412,1)
        _edge ("edge", Range(0, 10)) = 3.495145
        _FresnelIntensity ("FresnelIntensity", Range(0, 10)) = 1.838446
        _Fresnalecolor ("Fresnalecolor", Color) = (0.07414825,0.006596027,0.8970588,1)
        _node_405 ("node_405", 2D) = "bump" {}
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
            uniform sampler2D _node_3117; uniform float4 _node_3117_ST;
            uniform float _MainTexIntensity;
            uniform float _SpecularRage;
            uniform float _SpecularIntensity;
            uniform float4 _node_3339;
            uniform float _edge;
            uniform float _FresnelIntensity;
            uniform float4 _Fresnalecolor;
            uniform sampler2D _node_405; uniform float4 _node_405_ST;
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
                float3 _node_405_var = UnpackNormal(tex2D(_node_405,TRANSFORM_TEX(i.uv0, _node_405)));
                float3 normalLocal = _node_405_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_3117_var = tex2D(_node_3117,TRANSFORM_TEX(i.uv0, _node_3117));
                float node_5447 = 0.5;
                float3 MainTex = _node_3117_var.rgb;
                float node_5367 = dot(MainTex,float3(0.3,0.59,0.11));
                float3 finalColor = ((_node_3117_var.rgb*(node_5447*(node_5447+max(0,dot(normalDirection,lightDirection))))*_MainTexIntensity)+(pow(max(0,dot(normalDirection,halfDirection)),exp((_SpecularRage*-1.0+10.0)))*_SpecularIntensity*clamp((node_5367*2.0+-1.0),0,1))+((clamp((node_5367*-4.0+2.0),0,1)*_node_3339.rgb*2.0)*_edge)+(pow((1.0-max(0,dot(normalDirection, viewDirection))),exp(_FresnelIntensity))*_Fresnalecolor.rgb));
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
            uniform sampler2D _node_3117; uniform float4 _node_3117_ST;
            uniform float _MainTexIntensity;
            uniform float _SpecularRage;
            uniform float _SpecularIntensity;
            uniform float4 _node_3339;
            uniform float _edge;
            uniform float _FresnelIntensity;
            uniform float4 _Fresnalecolor;
            uniform sampler2D _node_405; uniform float4 _node_405_ST;
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
                float3 _node_405_var = UnpackNormal(tex2D(_node_405,TRANSFORM_TEX(i.uv0, _node_405)));
                float3 normalLocal = _node_405_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_3117_var = tex2D(_node_3117,TRANSFORM_TEX(i.uv0, _node_3117));
                float node_5447 = 0.5;
                float3 MainTex = _node_3117_var.rgb;
                float node_5367 = dot(MainTex,float3(0.3,0.59,0.11));
                float3 finalColor = ((_node_3117_var.rgb*(node_5447*(node_5447+max(0,dot(normalDirection,lightDirection))))*_MainTexIntensity)+(pow(max(0,dot(normalDirection,halfDirection)),exp((_SpecularRage*-1.0+10.0)))*_SpecularIntensity*clamp((node_5367*2.0+-1.0),0,1))+((clamp((node_5367*-4.0+2.0),0,1)*_node_3339.rgb*2.0)*_edge)+(pow((1.0-max(0,dot(normalDirection, viewDirection))),exp(_FresnelIntensity))*_Fresnalecolor.rgb));
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
