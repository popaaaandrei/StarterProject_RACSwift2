# Swift 2 ReactiveCocoa starter project

*This repo supports XCode7, Swift 2 & iOS 9*


### Project contains

- Basic Swift 2 starter project with Alamofire & RAC
- RAC Signals example: SignalProducer definition & call
- Always open the project using `.xcworkspace` file, and **not the .xcodeproj file.**

### Cocoapods

- Please edit the `Podfile` to add libraries.
- If you decide to add something, check cocoapods.org first
- Always open the project using `.xcworkspace` file, and **not the .xcodeproj file.**
- RULE: ALWAYS check that new libs have set the following flag in the build settings: ONLY_ACTIVE_ARCH = NO;
- Set main project EMBEDDED_CONTENT_CONTAINS_SWIFT = YES from Build Settings

### Carthage

- Please edit the `Cartfile` to add libraries.
- Open Terminal and run `carthage update --platform iOS` to download and build only for iOS. If you don't add `--platform iOS` it will build for all platforms
- Carthage automatically downloads and build frameworks: downloads are available in `Checkouts` and builds in `Builds`

- In this project, Carthage is used just for ReactiveCocoa, which needs embedded dylibs/frameworks
- We use Carthage just to download the proper RAC Swift2 tree and it's requirement: Result framework


### Why ReactiveCocoa

> No matter what language you work in, programming in a functional style provides benefits. You should do it whenever it is convenient, and you should think hard about the decision when it isn’t convenient. - *John Carmack*

- ReactiveCocoa adds functional reactive programming to iOS and that translates into remarkable benefits to async calls processing, cleaner, better separated, error-less & safer code. And reduce state.
- Please read [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) docs to understand the framework and what does it offer
- 1) read these 2 great intros by Bob Spryn called [Why Reactive(Cocoa)?](http://www.sprynthesis.com/2014/06/15/why-reactivecocoa/) and [ReactiveCocoa and MVVM, an Introduction](http://www.sprynthesis.com/2014/12/06/reactivecocoa-mvvm-introduction/). It's very hard to provide better explanations than this.
- 2) buy [Ash Furrow's book - Functional Reactive Programming on iOS](https://leanpub.com/iosfrp) and take a week off from your work & girlfriend. Tell her that you're going on a business trip :D

#### This is already done:
- 1) ReactiveCocoa & Result .xcodeproj files are being dragged to the project
- 2) ReactiveCocoa & Result iOS frameworks are added in Embedded frameworks section


### Links

[CocoaPods](http://www.cocoapods.org)
[Carthage](https://github.com/Carthage/Carthage)
[ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
[Alamofire](https://github.com/Alamofire/Alamofire)

You can find me on Twitter [@popaaaandrei](https://twitter.com/popaaaandrei).

XOXO