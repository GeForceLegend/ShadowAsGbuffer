#version 450

in vec3 vaPosition;
in vec2 vaUV0;

out vec2 texcoord;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

void main()
{
    texcoord = vaUV0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1.0);
}