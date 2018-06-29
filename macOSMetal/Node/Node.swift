//
//  Node.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 6/29/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

class Node {
    var childern: [Node] = []
    
    func add(child: Node) {
        childern.append(child)
    }
    
    func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        childern.forEach{ $0.render(commandEncoder: commandEncoder, deltaTime: deltaTime) }
    }
}

