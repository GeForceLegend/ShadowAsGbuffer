#version 450

out vec4 fragColor;

in vec2 texcoord;

#include "/Uniform.glsl"

const int shadowMapResolution = 2048;

void main()
{
    vec2 shadowCoord = (floor(texcoord * shadowMapResolution) + 0.5) / shadowMapResolution;
    fragColor = texture(shadowcolor0, shadowCoord);
    if (texture(depthtex1, texcoord).r - 1e-4 < texture(shadowtex1, shadowCoord).r || texture(shadowtex0, shadowCoord).r == 1.0) {
        fragColor = texture(colortex0, texcoord);
    }
}
