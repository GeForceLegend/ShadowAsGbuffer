#version 450

out vec4 fragColor;

in vec2 texcoord;

#include "/Uniform.glsl"

const int shadowMapResolution = 2048;

void main()
{
    fragColor = texture(shadowcolor0, texcoord);
}
