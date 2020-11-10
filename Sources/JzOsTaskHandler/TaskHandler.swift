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
    public func storeTask(tag: String, _ runner: @escaping () -> Void) {
        runnerTask.append(Task(tag: tag, runner: runner))
    }
    
    public func runTaskMultipe(tag: String) {
        var task = runnerTask.filter({$0.tag==tag})
               task.reverse()
               for i in task{
                   if(i.tag==tag){
                       i.runner()
                       runnerTask = runnerTask.filter({$0.objectId != i.objectId})
                   }
               }
    }
    
    public func executeOne(tag: String) {
        var task = runnerTask.filter({$0.tag==tag})
        task.reverse()
        for i in task{
            if(i.tag==tag){
                i.runner()
                runnerTask = runnerTask.filter({$0.objectId != i.objectId})
                return
            }
        }
    }
    
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
    var runnerTask=[Task]()
    public static func newInstance()->callback{
        if(instance==nil){
            instance=TaskHandler()
        }
        
        return instance!
    }
    open func clock() -> JzClock {
        return clockinstance
    }
    
    open func runTaskOnce(_ tag: String, _ runner: @escaping () -> Void) {
        if(runnerTask.filter({$0.tag == tag}).count>0){
            return
        }else{
          let timerTask=Task(tag: tag, runner: runner)
          runnerTask.append(timerTask)
          runner()
          runnerTask=runnerTask.filter({$0.objectId != timerTask.objectId})
        }
    }
    
    open func runTaskDelay(_ tag: String, _ time: Double, _ runner: @escaping () -> Void) {
        for i in runnerTask{
            if(i.tag==tag){
                if(i.timer.stop()<time){
                    return
                }
            }
        }
        runnerTask=runnerTask.filter({$0.tag != tag})
        let timerTask=Task(tag: tag, runner: runner)
        runnerTask.append(timerTask)
        runner()
    }
    
    open func runTaskMultiple(_ tag: String, _ count: Int, _ runner: @escaping () -> Void) {
        var havecount=0
        for i in runnerTask{
            if(i.tag==tag){havecount+=1}
        }
        if(havecount>=count){return}
        let task=Task(tag: tag, runner: runner)
        runnerTask.append(task)
        task.runner()
        runnerTask=runnerTask.filter({$0.objectId != task.objectId})
    }
    
    
}

open class Task{
    static var objectId=0
    var timer:JzClock=JzClock()
    var tag:String = ""
    var runner:() -> Void
    var objectId=0
    init(tag:String,runner:@escaping () -> Void){
        Task.objectId+=1
        self.tag=tag
        self.runner = runner
        self.objectId=Task.objectId
       }
}
open class TimerClass{
    var timer:Timer? = nil
    var tag = ""
}
