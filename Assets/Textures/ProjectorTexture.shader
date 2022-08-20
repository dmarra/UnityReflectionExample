// Upgrade NOTE: replaced '_Projector' with 'unity_Projector'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Projector/Texture" {
	Properties {		
		_ProjectedTexture ("Cookie", 2D) = "" {}		
	}
	
	Subshader {
		Tags {"Queue"="Transparent"}
		Pass {
			ZWrite Off
			ColorMask RGBA
			// NOTE: Edit this to adjust how the projection appears on the
			//       surface. This setting makes it appear (more or less)
			//       as the object being projected itself is rendered on
			//       screen. Blend One would make it appear as if it is
			//       glowing on the surface. Play with this as you see fit.
			Blend SrcAlpha OneMinusSrcAlpha
			Offset -1, -1
	
			CGPROGRAM
			#pragma enable_d3d11_debug_symbols
			#pragma vertex vert
			#pragma fragment frag			
			#include "UnityCG.cginc"
			

			float4x4  unity_Projector;	
			sampler2D _ProjectedTexture;		


			struct v2f {
				float4 uvProjected : TEXCOORD0;				
				float4 pos : SV_POSITION;
			};					
			

			v2f vert (float4 vertex : POSITION)
			{
				v2f o;
				o.pos = UnityObjectToClipPos (vertex);
				o.uvProjected = mul (unity_Projector, vertex);										
				return o;
			}
						
			
			fixed4 frag (v2f i) : SV_Target
			{
				float xnormalized = i.uvProjected.x / i.uvProjected.w;
				float ynormalized = i.uvProjected.y / i.uvProjected.w;

				if(i.uvProjected.w < 0 || xnormalized < 0 || xnormalized > 1 || ynormalized < 0 || ynormalized > 1) {
					return float4(0,0,0,0);
				} else {
					fixed4 texS = tex2Dproj (
						_ProjectedTexture, 
						UNITY_PROJ_COORD(i.uvProjected)
					);					
					return texS;
				}
			}
			ENDCG
		}
	}
}
