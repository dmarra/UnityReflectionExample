Shader "Projector/Texture" {
	Properties {		
		_ShadowTex ("Cookie", 2D) = "" {}		
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
			#pragma vertex vert
			#pragma fragment frag			
			#include "UnityCG.cginc"
			
			struct v2f {
				float4 uvShadow : TEXCOORD0;
				float4 pos : SV_POSITION;
			};
			
			float4x4 _Projector;
			float4x4 _ProjectorClip;
			
			v2f vert (float4 vertex : POSITION)
			{
				v2f o;
				o.pos = mul (UNITY_MATRIX_MVP, vertex);
				o.uvShadow = mul (_Projector, vertex);							
				return o;
			}			
			
			sampler2D _ShadowTex;			
			
			fixed4 frag (v2f i) : SV_Target
			{
				if(i.uvShadow.x < 0.000001 || i.uvShadow.y <0.000001 || i.uvShadow.x > 0.999999 || i.uvShadow.y > 0.999999) {
					return fixed4(0,0,0,0);
				}
				fixed4 texS = tex2Dproj (_ShadowTex, UNITY_PROJ_COORD(i.uvShadow));													
				return texS;
			}
			ENDCG
		}
	}
}
