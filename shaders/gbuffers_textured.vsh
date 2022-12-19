#version 450

out vec4 color;
out vec3 viewPos;
out vec2 texcoord;

#include "/Attribute.glsl"
#include "/Uniform.glsl"
#include "/Transform.glsl"

void main() {
    color = vaColor;
    color.rgb *= texture(lightmap, (TEXTURE_MATRIX_2 * vec4(vaUV2, 0.0, 1.0)).st).rgb;
    texcoord = (textureMatrix * vec4(vaUV0, 0.0, 1.0)).st;
    viewPos = (modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0)).xyz;
    viewPos = prevWorldToViewPos(viewToWorldPos(viewPos)) + viewOffset;
    gl_Position = gbufferPreviousProjection * vec4(viewPos, 1.0);
}
