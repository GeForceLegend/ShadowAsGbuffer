#version 450

out vec4 color;
out vec3 viewPos;

#include "/Attribute.glsl"
#include "/Uniform.glsl"
#include "/Transform.glsl"

void main() {
    color = vaColor;
    viewPos = (modelViewMatrix * vec4(vaPosition, 1.0)).xyz;
    viewPos = prevWorldToViewPos(viewToWorldPos(viewPos)) + viewOffset;
    gl_Position = gbufferPreviousProjection * vec4(viewPos, 1.0);
}
