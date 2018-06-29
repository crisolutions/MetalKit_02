//
//  Math.swift
//  macOSMetal
//
//  Created by Zach Eriksen on 6/29/18.
//  Copyright © 2018 Zach Eriksen. All rights reserved.
//

import MetalKit

extension Float {
    var rads: Float {
        return (self / 180) * Float.pi
    }
}

extension matrix_float4x4 {
    
    init(degreesFov: Float, aspectRatio: Float, nearZ: Float, farZ: Float) {
        let fov = degreesFov.rads
        
        let y = 1 / tan(fov * 0.5)
        let x = y / aspectRatio
        let z1 = farZ / (nearZ - farZ)
        let w = (z1 * nearZ)
        
        columns = (
            float4(x,0,0,0),
            float4(0,y,0,0),
            float4(0,0,z1,-1),
            float4(0,0,w,0)
        )
    }
    
    mutating func scale(axis: float3) {
        var result = matrix_identity_float4x4
        
        let x,y,z :Float
        (x,y,z) = (axis.x,axis.y,axis.z)
        
        result.columns = (
            float4(x,0,0,0),
            float4(0,y,0,0),
            float4(0,0,z,0),
            float4(0,0,0,1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotate(angle: Float, axis: float3) {
        var result = matrix_identity_float4x4
        
        let x,y,z :Float
        (x,y,z) = (axis.x,axis.y,axis.z)
        let c: Float = cos(angle)
        let s: Float = sin(angle)
        
        let mc: Float = (1 - c)
        
        let r1c1 = x * x * mc + c
        let r2c1 = x * y * mc + z * s
        let r3c1 = x * z * mc - y * s
        let r4c1: Float = 0.0
        
        let r1c2 = y * x * mc - z * s
        let r2c2 = y * y * mc + c
        let r3c2 = y * z * mc + x * s
        let r4c2: Float = 0.0
        
        let r1c3 = z * x * mc + y * s
        let r2c3 = z * y * mc - x * s
        let r3c3 = z * z * mc + c
        let r4c3: Float = 0.0
        
        let r1c4: Float = 0.0
        let r2c4: Float = 0.0
        let r3c4: Float = 0.0
        let r4c4: Float = 1.0
        
        result.columns = (
            float4(r1c1,r2c1,r3c1,r4c1),
            float4(r1c2,r2c2,r3c2,r4c2),
            float4(r1c3,r2c3,r3c3,r4c3),
            float4(r1c4,r2c4,r3c4,r4c4)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func translate(direction: float3) {
        var result = matrix_identity_float4x4
        
        let x,y,z :Float
        (x,y,z) = (direction.x,direction.y,direction.z)
        
        result.columns = (
            float4(1,0,0,0),
            float4(0,1,0,0),
            float4(0,0,1,0),
            float4(x,y,z,1)
        )
        
        self = matrix_multiply(self, result)
    }
}
