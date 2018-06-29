//
//  Shaders.metal
//  macOSMetal
//
//  Created by Zach Eriksen on 4/30/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct VertexOut {
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstraints {
    float4x4 modelMatrix;
};

struct SceneConstraints {
    float4x4 projectionMatrix;
};

vertex VertexOut basic_vertex_function(VertexIn vIn [[ stage_in ]],
                                       constant ModelConstraints &modelConstants [[ buffer(1) ]],
                                       constant SceneConstraints &sceneConstants [[ buffer(2) ]]) {
    VertexOut vOut;
    vOut.position = sceneConstants.projectionMatrix * modelConstants.modelMatrix * float4(vIn.position,1);
    vOut.color = vIn.color;
    return vOut;
}

fragment float4 basic_fragment_function(VertexOut vIn [[ stage_in ]]) {
    return vIn.color;
}
