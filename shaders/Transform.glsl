vec3 viewToWorldPos(vec3 viewPos) {
    return mat3(gbufferModelViewInverse) * viewPos + gbufferModelViewInverse[3].xyz;
}

vec3 prevViewToWorldPos(vec3 viewPos) {
    mat3 previousModelViewInverse = transpose(mat3(gbufferPreviousModelView));
    return previousModelViewInverse * viewPos - previousModelViewInverse * gbufferPreviousModelView[3].xyz;
}

vec3 prevWorldToViewPos(vec3 worldPos) {
    return mat3(gbufferPreviousModelView) * worldPos + gbufferPreviousModelView[3].xyz;
}
