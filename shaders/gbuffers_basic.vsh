#version 450

flat out vec4 color;

const float lineWidth = 2.5;
const mat4 viewScale = mat4(mat3(1.0 - (1.0 / 256.0)));

#include "/Attribute.glsl"
#include "/Uniform.glsl"
#include "/Transform.glsl"

void main() {
    color = vaColor;
    vec3 viewPos = (modelViewMatrix * vec4(vaPosition, 1.0)).xyz;
    viewPos = prevWorldToViewPos(viewToWorldPos(viewPos)) + viewOffset;

    if (renderStage != MC_RENDER_STAGE_OUTLINE) {
        gl_Position = gbufferPreviousProjection * vec4(viewPos, 1.0);
    }
    else {
        vec4 linePosStart = gbufferPreviousProjection * viewScale * vec4(viewPos, 1.0);
        vec4 linePosEnd = gbufferPreviousProjection * viewScale * vec4(prevWorldToViewPos(viewToWorldPos((modelViewMatrix * vec4(vaPosition + vaNormal, 1.0)).xyz)) + viewOffset, 1.0);
        vec3 ndc1 = linePosStart.xyz / linePosStart.w;
        vec3 ndc2 = linePosEnd.xyz / linePosEnd.w;
        vec2 lineScreenDirection = normalize((ndc2.xy - ndc1.xy) * vec2(viewWidth, viewHeight));
        vec2 lineOffset = vec2(-lineScreenDirection.y, lineScreenDirection.x) * lineWidth / vec2(viewWidth, viewHeight);
        if (lineOffset.x < 0.0)
            lineOffset *= -1.0;
        if (gl_VertexID % 2 == 0)
            gl_Position = vec4((ndc1 + vec3(lineOffset, 0.0)) * linePosStart.w, linePosStart.w);
        else
            gl_Position = vec4((ndc1 - vec3(lineOffset, 0.0)) * linePosStart.w, linePosStart.w);
    }
}
