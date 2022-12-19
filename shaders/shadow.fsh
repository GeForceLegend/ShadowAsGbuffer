#version 450

layout (location = 0) out vec4 fragColor0;

in vec4 color;
in vec3 normal;
in vec3 viewPos;
in vec2 texcoord;

#include "/Uniform.glsl"

void main()
{
    fragColor0 = texture(tex, texcoord) * color;
    if (fragColor0.w < alphaTestRef || dot(normalize(viewPos), normal) > 1e-5)
        discard;
}