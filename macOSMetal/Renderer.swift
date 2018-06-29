//
//  Renderer.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 4/30/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

class Renderer: NSObject {
    var commandQueue: MTLCommandQueue!
    var scenes: [Scene] = []
    
    init(device: MTLDevice) {
        super.init()
        createCommandQueue(device: device)
        scenes.append(CubeScene(device: device))
    }
    
    //MARK: Builders
    func createCommandQueue(device: MTLDevice) {
        commandQueue = device.makeCommandQueue()
    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
    
    func draw(in view: MTKView) {
        // Get the current drawable and descriptor
        guard let drawable = view.currentDrawable,
            let renderPassDescriptor = view.currentRenderPassDescriptor else {
                return
        }
        // Create a buffer from the commandQueue
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
       
        let deltaTime = 1 / Float(view.preferredFramesPerSecond)
        
        scenes.forEach{ $0.render(commandEncoder: commandEncoder!,
                                  deltaTime: deltaTime) }
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
