//
//  Scene.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 6/29/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

class Scene: Node {
    var device: MTLDevice!
    var sceneConstraints = SceneConstraints()
    var objects: [Primitive] = []
    
    init(device: MTLDevice) {
        self.device = device
        super.init()
        sceneConstraints.projectionMatrix = matrix_float4x4(degreesFov: 45, aspectRatio: 1, nearZ: 0.1, farZ: 100)
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        commandEncoder.setVertexBytes(&sceneConstraints, length: MemoryLayout<SceneConstraints>.stride, index: 2)
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
    }
}
