[![Platform](https://img.shields.io/badge/平台-%20IOS%20-brightgreen.svg)](https://github.com/sam38124)
[![characteristic](https://img.shields.io/badge/特點-%20輕量級%20%7C%20簡單易用%20%20%7C%20穩定%20-brightgreen.svg)](https://github.com/sam38124)
# JzOsTaskHandler
This is a task handler framework for ios can very easily  to manage task execution
<br><br>
[android version](https://github.com/sam38124/JzTaskHandler)
## List
* [How to import to project?](#Import)
* [Quick Start](#Use)
* [Exposure method](#All)
* [About me](#About)


<a name="Import"></a>
## How to introduce to the project?
> Support Swift Package。 <br/>

#### 1.Open xcode and paste link for Swift Package
+ > ##### https://github.com/sam38124/JzOsTaskHandler
<a name="Use"></a>
## Quick Start

### 1.Single task
####  Only accept one task can't run tasks simultaneously
```kotlin
     TaskHandler.newInstance.runTaskOnce("TAG", runner{
                Log.e("runner","run")
            })
```
### 2.Mutiple task
#### Can run tasks simultaneously on specific quantity what you define
```kotlin
//This sample can run tasks simultaneously up to five
TaskHandler.newInstance.runTaskMultiple("TAG",5, runner{
                Log.e("runner","run")
            })
```
### 3.Delay task
#### When before task is ending you need to wait a moment for run new task
```kotlin
//This example shows that you need to wait 2.5 seconds before starting a new task
       TaskHandler.newInstance.runTaskTimer("s",2.5, runner{
                Log.e("runner","run")
            })
```
## Stopwatch

### 1.Define Stopwatch
```kotlin
val clock=TaskHandler.newInstance.clock()
```
### 2.Zeroing your stopwatch
```kotlin
 clock.Zeroing()
```
### 3.Stop and return sec
```kotlin
clock.stop()
```
### 4.example
```kotlin
//Delay  2 sec
sleep(2)
//Stop clock
var time=clock.stop()
//Returns an approximate value of 2
```
<a name="All"></a>
### All protocol function
```swift
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

```

<a name="About"></a>
# About me
#### <font color="#0000dd"> Work for: </font><br /> 
+ ##### <font color="#660000">【Orange Electronic】</font><br /> 
#### <font color="#0000dd"> Position: </font><br /> 
+ ##### Full stack engineer<br/>  
#### <font color="#0000dd"> Main defense range: </font><br /> 
+ ##### Android and IOS(4 years)<br/>  
+ ##### Jsp(2 years)<br/> 
+ ##### Javascript and Jquery and Ktor(1 years)<br /> 
#### <font color="#0000dd"> Contact information: </font><br /> 
+  ##### line:sam38124<br /> 

+  ##### gmail:sam38124@gmail.com
