//
//  Primitive.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 6/29/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

class Primitive: Node {
    // Buffers
    var vertexBuffer: MTLBuffer!
    var indexBuffer: MTLBuffer!
    // BufferData
    var vertices: [Vertex]!
    var indices: [UInt16]!
    // States
    var renderPipelineState: MTLRenderPipelineState!
    var depthStencilState: MTLDepthStencilState!
    // Constraints
    var modelConstraints = ModelContraints()
}
