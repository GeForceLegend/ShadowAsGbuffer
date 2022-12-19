#version 450

in vec3 vaPosition;
in vec4 vaColor;
in vec2 vaUV0;
in ivec2 vaUV2;
in vec3 vaNormal;

in vec4 mc_Entity;
in vec4 mc_midTexCoord;
in vec4 at_tangent;

#include "/Uniform.glsl"

uniform mat4 textureMatrix = mat4(1.0);
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 chunkOffset;

const mat4 TEXTURE_MATRIX_2 = mat4(vec4(0.00390625, 0.0, 0.0, 0.0), vec4(0.0, 0.00390625, 0.0, 0.0), vec4(0.0, 0.0, 0.00390625, 0.0), vec4(0.03125, 0.03125, 0.03125, 1.0));

out vec4 color;
out vec3 normal;
out vec3 viewPos;
out vec2 texcoord;

vec3 prevViewToWorldPos(vec3 viewPos) {
    mat3 previousModelViewInverse = transpose(mat3(gbufferPreviousModelView));
    return previousModelViewInverse * viewPos - previousModelViewInverse * gbufferPreviousModelView[3].xyz;
}

vec3 prevWorldToViewPos(vec3 worldPos) {
    return mat3(gbufferPreviousModelView) * worldPos + gbufferPreviousModelView[3].xyz;
}

void main()
{
    color = vec4(mix(vaColor.rgb, entityColor.rgb, entityColor.a), vaColor.a);
    color.rgb *= texture(lightmap, (TEXTURE_MATRIX_2 * vec4(vaUV2, 0.0, 1.0)).st).rgb;
    texcoord = (textureMatrix * vec4(vaUV0, 0.0, 1.0)).st;
    normal = mat3(gbufferPreviousModelView) * mat3(shadowModelViewInverse) * normalMatrix * vaNormal;
    vec3 worldPos = (shadowModelViewInverse * modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0)).xyz;
    vec3 rotationOrigin = worldPos + vec3(0.0, 0.2, 0.0);
    viewPos = prevWorldToViewPos(worldPos);
    vec3 viewRotation = prevWorldToViewPos(vec3(0.0, 0.2, 0.0));
    float depthDiff = viewRotation.z;
    viewPos.z += depthDiff;
    viewPos.y -= 0.2 - sqrt(max(0.0, 0.2 * 0.2 - depthDiff * depthDiff));

    gl_Position = gbufferPreviousProjection * vec4(viewPos, 1.0);
}
