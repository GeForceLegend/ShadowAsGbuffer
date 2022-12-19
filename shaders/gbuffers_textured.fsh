#version 450

layout(location = 0) out vec4 gbufferData0;

in vec4 color;
in vec3 viewPos;
in vec2 texcoord;

#include "/Uniform.glsl"

void main() {
    vec4 albedo = texture(tex, texcoord) * color;
    if (albedo.w < alphaTestRef) discard;
    gbufferData0 = albedo;
}

/* DRAWBUFFERS:0 */
