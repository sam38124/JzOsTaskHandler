//
//  callback.swift
//  JzOsTaskHandler
//
//  Created by Jianzhi.wang on 2020/5/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
public protocol callback{
       //取得碼表
       func clock()->JzClock
       //執行任務處理，並且同時間只能處理一次任務，必須等任務處理完才能進行下次的執行
       func runTaskOnce(_ tag:String,_ runner:@escaping()->Void)
       //執行任務處理，並且必須大於時間間隔才可以再次執行
       func runTaskDelay(_ tag:String,_ time:Double,_ runner:@escaping()->Void)
       //執行任務處理，並且限制可同時執行數量
       func runTaskMultiple(_ tag:String,_ count:Int,_ runner:@escaping()->Void)
       //開始執行timer，如沒有此tag則開始新任務，反之則不進行新任務處理
       func runTaskTimer(_ tag:String,_ delay:Double,_ runner:@escaping()->Void)
       //關閉timer的任務處理
       func closeTimer(_ tag:String)
       //將任務儲存於佇列當中
       func storeTask(tag:String,_ runner:@escaping()->Void)
       //執行所有tag相同的佇列
       func runTaskMultipe(tag:String)
       //執行儲存的佇列只執行最後添加的
       func executeOne(tag:String)
}
