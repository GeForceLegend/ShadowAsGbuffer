#version 450

out vec4 fragColor;

in vec2 texcoord;

#include "/Uniform.glsl"

const int shadowMapResolution = 2048;

void main()
{
    vec2 shadowCoord = (floor(texcoord * shadowMapResolution) + 0.5) / shadowMapResolution;
    float shadowDepth = texture(shadowtex0, shadowCoord).r;
    fragColor = texture(shadowcolor0, shadowCoord);
    if (texture(depthtex0, texcoord).r + 1e-6 < shadowDepth || shadowDepth == 1.0) {
        fragColor = texture(colortex0, texcoord);
    }
}
