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
       //Get Stopwatch
       func clock()->JzClock
       //Start a task if not finish can't run new one 
       func runTaskOnce(_ tag:String,_ runner:@escaping()->Void)
       //If you need to start a new task, the interval from the previous task must be greater than the input value
       func runTaskDelay(_ tag:String,_ time:Double,_ runner:@escaping()->Void)
       //Perform task processing and limit the number of simultaneous executions
       func runTaskMultiple(_ tag:String,_ count:Int,_ runner:@escaping()->Void)
       //Start to execute the timer, if there is no such tag, a new task will be started, otherwise, no new task will be processed
       func runTaskTimer(_ tag:String,_ delay:Double,_ runner:@escaping()->Void)
       //Turn off timer task processing
       func closeTimer(_ tag:String)
       //Store tasks in a queue
       func storeTask(tag:String,_ runner:@escaping()->Void)
       //Execute the same queue for all tags
       func runTaskMultipe(tag:String)
       //Execute the stored queue only execute the last added
       func executeOne(tag:String)
}

```

#### <font color="#0000dd"> Contact information: </font><br /> 
+  ##### line:sam38124<br /> 

+  ##### gmail:sam38124@gmail.com

