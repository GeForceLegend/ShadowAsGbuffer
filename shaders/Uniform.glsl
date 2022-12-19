uniform int worldTime;
uniform int renderStage;
uniform int frameCounter;
uniform int isEyeInWater;
uniform int blockEntityId;
uniform int heldBlockLightValue;
uniform int heldBlockLightValue2;
uniform float far;
uniform float near;
uniform float sunAngle;
uniform float blindness;
uniform float frameTime;
uniform float viewWidth;
uniform float viewHeight;
uniform float eyeAltitude;
uniform float nightVision;
uniform float alphaTestRef;
uniform float darknessFactor;
uniform float frameTimeCounter;
uniform float screenBrightness;
uniform float centerDepthSmooth;
uniform ivec2 atlasSize;
uniform ivec2 eyeBrightnessSmooth;
uniform vec3 fogColor;
uniform vec3 viewOffset;
uniform vec3 cameraPosition;
uniform vec3 previousCameraPosition;
uniform vec4 entityColor;

uniform sampler2D tex;
uniform sampler2D normals;
uniform sampler2D specular;
uniform sampler2D lightmap;
uniform sampler2D noisetex;
uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D colortex3;
uniform sampler2D colortex4;
uniform sampler2D colortex5;
uniform sampler2D colortex6;
uniform sampler2D colortex7;
uniform sampler2D colortex8;
uniform sampler2D colortex9;
uniform sampler2D colortex10;
uniform sampler2D colortex11;
uniform sampler2D colortex12;
uniform sampler2D colortex13;
uniform sampler2D colortex14;
uniform sampler2D colortex15;
uniform sampler2D depthtex0;
uniform sampler2D depthtex1;
uniform sampler2D depthtex2;
uniform sampler2D shadowtex0;
uniform sampler2D shadowtex1;
uniform sampler2D shadowcolor0;
uniform sampler2D shadowcolor1;

uniform mat4 shadowModelView;
uniform mat4 shadowProjection;
uniform mat4 shadowModelViewInverse;
uniform mat4 shadowProjectionInverse;
uniform mat4 gbufferModelView;
uniform mat4 gbufferProjection;
uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferPreviousModelView;
uniform mat4 gbufferPreviousProjection;

const float PI = 3.1415926535897;

#ifndef MC_SHADOW_QUALITY
    #define MC_SHADOW_QUALITY 1.0
#endif

#ifndef MC_HAND_DEPTH
    #define MC_HAND_DEPTH 0.125
#endif

#ifndef MC_RENDER_STAGE_NONE
    #define MC_RENDER_STAGE_NONE 0
#endif
#ifndef MC_RENDER_STAGE_SKY
    #define MC_RENDER_STAGE_SKY 1
#endif
#ifndef MC_RENDER_STAGE_SUNSET
    #define MC_RENDER_STAGE_SUNSET 2
#endif
#ifndef MC_RENDER_STAGE_CUSTOM_SKY
    #define MC_RENDER_STAGE_CUSTOM_SKY 3
#endif
#ifndef MC_RENDER_STAGE_SUN
    #define MC_RENDER_STAGE_SUN 4
#endif
#ifndef MC_RENDER_STAGE_MOON
    #define MC_RENDER_STAGE_MOON 5
#endif
#ifndef MC_RENDER_STAGE_STARS
    #define MC_RENDER_STAGE_STARS 6
#endif
#ifndef MC_RENDER_STAGE_VOID
    #define MC_RENDER_STAGE_VOID 7
#endif
#ifndef MC_RENDER_STAGE_TERRAIN_SOLID
    #define MC_RENDER_STAGE_TERRAIN_SOLID 8
#endif
#ifndef MC_RENDER_STAGE_TERRAIN_CUTOUT_MIPPED
    #define MC_RENDER_STAGE_TERRAIN_CUTOUT_MIPPED 9
#endif
#ifndef MC_RENDER_STAGE_TERRAIN_CUTOUT
    #define MC_RENDER_STAGE_TERRAIN_CUTOUT 10
#endif
#ifndef MC_RENDER_STAGE_ENTITIES
    #define MC_RENDER_STAGE_ENTITIES 11
#endif
#ifndef MC_RENDER_STAGE_BLOCK_ENTITIES
    #define MC_RENDER_STAGE_BLOCK_ENTITIES 12
#endif
#ifndef MC_RENDER_STAGE_DESTROY
    #define MC_RENDER_STAGE_DESTROY 13
#endif
#ifndef MC_RENDER_STAGE_OUTLINE
    #define MC_RENDER_STAGE_OUTLINE 14
#endif
#ifndef MC_RENDER_STAGE_DEBUG
    #define MC_RENDER_STAGE_DEBUG 15
#endif
#ifndef MC_RENDER_STAGE_HAND_SOLID
    #define MC_RENDER_STAGE_HAND_SOLID 16
#endif
#ifndef MC_RENDER_STAGE_TERRAIN_TRANSLUCENT
    #define MC_RENDER_STAGE_TERRAIN_TRANSLUCENT 17
#endif
#ifndef MC_RENDER_STAGE_TRIPWIRE
    #define MC_RENDER_STAGE_TRIPWIRE 18
#endif
#ifndef MC_RENDER_STAGE_PARTICLES
    #define MC_RENDER_STAGE_PARTICLES 19
#endif
#ifndef MC_RENDER_STAGE_CLOUDS
    #define MC_RENDER_STAGE_CLOUDS 20
#endif
#ifndef MC_RENDER_STAGE_RAIN_SNOW
    #define MC_RENDER_STAGE_RAIN_SNOW 21
#endif
#ifndef MC_RENDER_STAGE_WORLD_BORDER
    #define MC_RENDER_STAGE_WORLD_BORDER 22
#endif
#ifndef MC_RENDER_STAGE_HAND_TRANSLUCENT
    #define MC_RENDER_STAGE_HAND_TRANSLUCENT 23
#endif
