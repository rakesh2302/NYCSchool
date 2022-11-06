# NYCSchool

### Xcode 13.4

## Introduction

This app shows a list of NYC High schools. Selecting any school navigates to more details screen.

 
 ## Architecture:

● Clean approach / loosely coupled architecture
● MVVM design pattern
● Combine FrameWork - Reactive programming
● Dependency Injection 
● Code is separated into three layers
        ○ Presentation layer - Model, View, ViewModel
        ○ Action layer - Interface and Service
        ○ Network layer - APIs
● Packages - Swift Package Manager
● Added SwiftLint script in build phases
        ○ Using this Project will always follow the clean code standard 

## Offline Support

When the application is used for the first time, data gets stored locally using CoreData. 
Whenever app is terminated and run again, use locally stored data instead of API response data.
If app is offline and have any data, app will operate smoothly.
TODO - refresh locally stored data by calling API and storing new response data.   

## Unit tests / Mock Tests

There is Mock Interface under Mock Group Project structure. These provides test inputs used to test.
● Here Code is separated into three layers
        ○ Presentation layer - Model, Screen, Data binding
        ○ Mock Action layer - Interface and Service
        ○ Mock layer
        
Mock data does not use services so there is no Network layer. 

## API:
● Display a list of NYC High Schools using https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2
● Display SAT data using
    https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4

## Programming Language/SDK Usage:
● Swift Language
● Native iOS UIKit
● Xcode tool - 13.4
● iOS 15.5
