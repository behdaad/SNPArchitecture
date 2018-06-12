# SNPArchitecture

Here lies the arcitectural foundation for the years to come, for the generations to come. Take a moment and pay respect to our fallen brothers and sisters, whom had been beaten, broken and scarred, but paved the way on which we tread today.

## Quick Start

There have been many efforts to implement [Uncle Bob](https://en.wikipedia.org/wiki/Robert_Cecil_Martin)'s [Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) such as [VIPER](https://www.objc.io/issues/13-architecture/viper/) and Uber's [RIBs](https://github.com/uber/RIBs) but none of them were suitable for Snapp's current situation. Therefore, we decided to come up with our own, not giving it a particular name merely calling it `SNPArchitecture`.

To put it in simple terms, it is a combination of VIPER and RIBs, so if you're familiar with VIPER, you should be able to grasp it comfortably. Reading [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture) is a good first step, because most of the notions are the same.
The key difference is SNPArchitecture's use of `VIP Cycle`.

![VIP Cycle](screens/VIP-Cycle.png)

## Components

An app is divided to modules based on screen/feature, which we'll call a `Scene`. A scene is comprised of these classes: View, Interactor, Presenter, Router and Configurator.

View handles view logic, Interactor handles business logic, Presenter handles presentation logic, Router handles routing logic and Configurator will act as the interface of the Scene. We'll discuss all of them shortly.

Keep in mind that all the interaction between classes in a scene happens through protocols and none of them are tightly coupled. 

### View

Unlike Apple's MVC, View in SNPArchitecture is both View and View Controller. Since View and View Controller are tightly coupled in iOS and UIKit, it doesn't make much sense to separate them. Because View Controller handles View's lifecycle, it is nearly impossible to write decoupled View and View Controllers, i.e. if you change one of them, you must change the other one.

View handles all the view logic, it knows how to show stuff on the screen and relays user's interactions to interactor. In order to better separate View and View Controller responsibilities, everything purely view-related stuff (such as setting static labels titles or setting colors) goes in UIView subclasses and lifecycle-related stuff (pretty much everything else) goes into UIViewController subclasses.

As you can see in the VIP Cycle, view directly notifies the Interactor of user interactions. Methods would be like `userTapped(on button:)`.

On the other hand, Presenter calls methods like `show(viewModel:)` on the View. Notice how Presenter passes a `View Model` to the view, which is a simple data structure comprised of primitive types such as `Int`, `String` and such. This is important, because view cannot and must not perform any logic on the received View Model. 

### Interactor

Interactor contains all the business logic of a scene. It knows how to fetch data, which scene must be displayed next and everything related to our business.

Interactor doesn't talk to the View directly, instead it asks the Presenter to present some stuff on the View with methods like `present(businessModel:)`. Notice how it passes a `Business Model` to Presenter, and Presenter itself translates this possibly complex data structure to a simple View Model. Remember, View Models are comprised of only primitive types that can be directly consumed by the view. 

On the other hand, it listens on user interactions coming from the View, such as `userTapped(on button:)`.

When a transition is needed to a new Scene, it calls a method on the Router. It will be discussed more in the Router section. 

### Presenter

Presenter is the class responsible for translating complex business models to simple view models. A good example of this would be converting a `Date` object to a human-readable `String`.

We've already talked about input and output interfaces of Presenter in View and Interactor sections, but here's a recap: Presenter listens on method calls from Interactor such as `present(businessModel:)`. It converts the incoming business model to a View Model understandable by the View, then calls `show(viewModel:)` on the View to complete the cycle.

### Configurator

Configurator acts as the interface for creating a scene. It has a static `build()` method which initializes a scene, provides each class its dependencies and returning the View, which is a subclass of UIViewController.

### Router

Router is responsible for routing logic, it knows how to build a Scene. It creates the next Scene and attaches its View to the View hierarchy. Interactor calls methods such as `routeToSomeScene(presentingViewController:)` on the Router, Router builds the next using its Configurator by calling `SomeSceneConfigurator.build()` and attaching the resulting View to the View hierarchy. Remember that the Router itself doesn't decide which Scene to build, but merely how to build it. Routing decisions are made by the Interactor. 

### Behind the Scenes: Managers

Although managers aren't usually behind the scenes and always want the spotlight, but in SNPArchitecture there are some classes that don't belong in Scenes: Model Managers. Will call them Managers for short. 

Each Manager is responsible for addressing issues related to that class. Fetching it from network, probably caching the result and providing it to anyone who asks for it later. Manager's methods will take the form of `model(parameters:completion:)`. They input required input and call a completion handler when data is ready or an error has occurred. Most of completion handlers will have only a `Error?` input, since providing data models will be mainly from a dispatch system.

### Dispatch System

Since we are developing SNPArchitecture for an eventful and stateful app, traditional delegation and callback patterns won't accomodate our needs. Consider the state of the `Ride` model. Every change in ride's state results in changes all over the application, so it's better to use the notification pattern. Since iOS's own NotificationCenter is a barebone framework, we'll use [SwiftNotificationCenter](https://cocoapods.org/pods/SwiftNotificationCenter) which provices a simple API to post and observe notifications in a protocol-friendly manner. 

## Installation

To install the Clean Swift Xcode templates, run:

```
make install_templates
```

To uninstall the Clean Swift Xcode templates, run:

```
make uninstall_templates
```

Every push to this repository sends an automatic message to `#ios_scrum_team` Slack channel. You need to pull changes and manually apply new templates by running `make install_templates`. This process can be automated by adding a git hook to your local installation of Git.

1. Create a file named `post-merge` under `.git/hooks` and fill it with:

```
#!/bin/sh
make install_templates
```

2. Add execution permissions to `post-merge` using:
```
chmod +x post-merge
```

3. Since it's not a remote possibility that you'll someday commit and push changes to this repository, you may want to add a `post-commit` hook too. It will be the same as `post-merge`. This can be simply done using

```
cp post-merge post-commit
```

Vilà! Every time you pull this repo, templates will be automatically installed in your Xcode templates folder.
