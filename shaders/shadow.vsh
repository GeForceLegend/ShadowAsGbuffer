#version 450

out vec4 color;
out vec3 normal;
out vec3 viewPos;
out vec2 texcoord;

#include "/Attribute.glsl"
#include "/Uniform.glsl"
#include "/Transform.glsl"

vec3 shadowViewToWorldPos(vec3 viewPos) {
    return mat3(shadowModelViewInverse) * viewPos + shadowModelViewInverse[3].xyz;
}

void main()
{
    color = vec4(mix(vaColor.rgb, entityColor.rgb, entityColor.a), vaColor.a);
    color.rgb *= texture(lightmap, (TEXTURE_MATRIX_2 * vec4(vaUV2, 0.0, 1.0)).st).rgb;
    texcoord = (textureMatrix * vec4(vaUV0, 0.0, 1.0)).st;
    normal = mat3(gbufferPreviousModelView) * mat3(shadowModelViewInverse) * normalMatrix * vaNormal;
    vec3 worldPos = (shadowModelViewInverse * (modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0))).xyz;
    viewPos = (gbufferPreviousModelView * vec4(worldPos, 1.0)).xyz + viewOffset;

    gl_Position = gbufferPreviousProjection * vec4(viewPos, 1.0);
}
