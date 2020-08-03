//
//  TaskHandler.swift
//  JzOsTaskHandler
//
//  Created by Jianzhi.wang on 2020/5/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
@available(iOS 10.0, *)
open class TaskHandler:callback{
    public func closeTimer(_ tag: String) {
        let needCancel=timer.filter({ $0.tag==tag })
        if(needCancel.count>0){
            for i in needCancel{
                i.timer!.invalidate()
            }
            timer=timer.filter({$0.tag != tag})
        }
        
    }
    public func runTaskTimer(_ tag: String, _ delay: Double, _ runner:@escaping () -> Void) {
        if(timer.filter({ $0.tag==tag }).count==0){
            let timerClass=TimerClass()
            timerClass.tag=tag
            timerClass.timer=Timer.scheduledTimer(withTimeInterval: delay, repeats: true, block: {_ in
                runner()
            })
            timer.append(timerClass)
        }
    }
    
    var timer=[TimerClass]()
    static var instance:callback? = nil
    var clockinstance=JzClock()
    var runtag=[String]()
    var runnerTimer=[TimerTask]()
    public static func newInstance()->callback{
        if(instance==nil){
            instance=TaskHandler()
        }
        
        return instance!
    }
    open func clock() -> JzClock {
        return clockinstance
    }
    
    open func runTaskOnce(_ tag: String, _ runner: () -> Void) {
        if(runtag.contains(tag)){
            return
        }else{
            runtag.append(tag)
            runner()
            var temptag=[String]()
            for i in 0..<runtag.count{
                if(runtag[i] != tag){
                    temptag.append(runtag[i])
                }
            }
            runtag=temptag
        }
    }
    
    open func runTaskDelay(_ tag: String, _ time: Double, _ runner: () -> Void) {
        for i in runnerTimer{
            if(i.tag==tag){
                if(i.timer.stop()<time){
                    return
                }
            }
        }
        var temptimer=[TimerTask]()
        for i in runnerTimer{
            if(i.tag != tag){
                temptimer.append(i)
            }
        }
        runnerTimer=temptimer
        let timerTask=TimerTask()
        timerTask.tag=tag
        timerTask.timer=JzClock()
        runnerTimer.append(timerTask)
        runner()
    }
    
    open func runTaskMultiple(_ tag: String, _ count: Int, _ runner: () -> Void) {
        var havecount=0
        for i in runtag{
            if(i==tag){havecount+=1}
        }
        if(havecount==count){return}
        runtag.append(tag)
        runner()
        for i in 0..<runtag.count{
            if(runtag[i]==tag){
                runtag.remove(at: i)
            }
        }
    }
    
    
}

open class TimerTask{
    var timer:JzClock=JzClock()
    var tag:String = ""
}
open class TimerClass{
    var timer:Timer? = nil
    var tag = ""
}
