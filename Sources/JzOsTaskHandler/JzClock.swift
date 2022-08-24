//
//  JzClock.swift
//  JzOsTaskHandler
//
//  Created by Jianzhi.wang on 2020/5/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
open class JzClock{
    var pastTime = Date().timeIntervalSince1970
    
    open func GetTime(_ timeStamp: Double)-> Double{
        let currentTime = Date().timeIntervalSince1970
        let reduceTime : TimeInterval = currentTime - timeStamp
        return reduceTime
    }
    
    open  func zeroing()->JzClock{
        pastTime = Date().timeIntervalSince1970
        return self
    }
    
    open func stop()->Double{
        return GetTime(pastTime)
    }
}
