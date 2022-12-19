#version 450

layout(location = 0) out vec4 gbufferData0;

in vec4 color;
in vec3 viewPos;

#include "Uniform.glsl"

vec4 linear_fog(vec4 inColor, float vertexDistance, float fogStart, float fogEnd, vec4 fogColor) {
    if (vertexDistance <= fogStart) {
        return inColor;
    }

    float fogValue = vertexDistance < fogEnd ? smoothstep(fogStart, fogEnd, vertexDistance) : 1.0;
    return vec4(mix(inColor.rgb, fogColor.rgb, fogValue * fogColor.a), inColor.a);
}

void main() {
    if (color.w == 0.0) discard;
    gbufferData0 = linear_fog(color, length(viewPos), fogStart, fogEnd, vec4(fogColor, 1.0));
}
