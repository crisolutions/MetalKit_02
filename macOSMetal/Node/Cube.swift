//
//  Cube.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 6/29/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

class Cube: Primitive {
    
    override func buildVertices() {
        vertices = [
            Vertex(position: float3(-1,1,1), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,1), color: float4(0,1,0,1)),
            Vertex(position: float3(1,1,1), color: float4(0,0,1,1)),
            Vertex(position: float3(1,-1,1), color: float4(1,0,1,1)),
            Vertex(position: float3(-1,1,-1), color: float4(1,1,0,1)),
            Vertex(position: float3(1,1,-1), color: float4(0,1,1,1)),
            Vertex(position: float3(-1,-1,-1), color: float4(0.5,0.5,0,1)),
            Vertex(position: float3(1,-1,-1), color: float4(1,0,0.5,1))
        ]
        indices = [
            0,1,2,  2,1,3, //Front
            5,2,3,  5,3,7,
            0,2,4,  2,5,4,
            0,1,4,  4,1,6,
            5,4,6,  5,6,7,
            3,1,6,  3,6,7
            
        ]
    }
}
