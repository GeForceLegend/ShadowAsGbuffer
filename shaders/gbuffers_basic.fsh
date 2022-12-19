#version 450

layout(location = 0) out vec4 gbufferData0;

flat in vec4 color;

#include "Uniform.glsl"

void main() {
    if (color.w < alphaTestRef) discard;
    gbufferData0 = color;
}
