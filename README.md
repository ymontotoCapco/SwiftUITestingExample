# TestingExample

> This is an extension on the previously created [TestingExample](https://github.com/blakerhCapco/TestingExample) by Blake H. While ViewControllers are not used in SwiftUI, reference to them might still exist throughout this documentation - all content in this README is a copy paste from that repo.

## Description
This repository is meant to be referenced as a introductory to unit testing with view models using the Quick and Nimble testing framework.

### View Model
View models should only contain data that your view needs. View models can accept arguments of other pieces of data or models. Depending on what is passed to the view model,
it will update its properties in order to have data prepared for the view that needs it.

A simple example would be formatting a currency. A view model will accept a dollar amount as a double then the view model would contain logic to convert that double into 
a string and add a "$" to the front of it (You could also build a sperate currency formatter in a utilities class and apply it in the view model as well). The goal
is to remove as much logic as you can from the view controller and move it into your view model. Try and stay away from adding UIKit instances in your view model.

Refer to *MyAccountViewModel* in the project and how to utilize it in *MyAccountViewController*.

For additional information, read [different flavors of view models in swift by John Sundell](https://www.swiftbysundell.com/articles/different-flavors-of-view-models-in-swift/).

### View Models and Unit Testing 
Using view models makes testing much easier. When you have all the logic that transforms all the data that is going to be provided for your views, you can predict and guarantee
that the views will have the correct output if your tests are passing.

This makes *dependency injection* extremely easy.

If a view model accepts data from a server that is parsed and put into a model (also known as an entity), we're able to bypass the need for making a network call just 
to test data transformation. Instead, we can mock this by creating an instance of the model and passing that directly into the view model (check out the example
in *MyAccountViewModelTests* in the tests directory).

This can be taken a step further, you can have a local json file or a string that represents the json response, parse it, create a model out of it, and pass that
model to your view model.

The only thing to keep in mind with the second approach is to make sure that your mocked json responses are the same structure as what the server is providing you.
If a change happens on a server, you would need to make a change to your mocks as well to keep consistency.

### Quick and Nimble
Quick and Nimble is a testing framework that makes writing tests easier to read. The sections above can be done with XCTest but the sample provided in this project
is utilizing these frameworks.

An example on how to set this up can be seen in *MyAccountViewModelTests*. 

The steps to set this up in your project would be to import the quick and nimble framework after you install it with your dependency manager
```swift
import Quick
import Nimble
```

and override the spec method, this is where your tests will be executed.
```swift
override func spec() {
...
}
```

In the *MyAccountViewModelTests* file, it has the following funtions
```swift
      describe("My Account View Model") {
        ...
        context("account balance - positive") {
            ...
          it("should contain the following properties") {
            ...
          }
        }
```

These functions are strictly for reading purposes. Use as much detail as you can to provide clarity.

An example of a tests is the following,
```swift
expect(viewModel.amount).to(equal("$100.44"))
```
this code asserts that the amount in the view model is equal to the string on the right. If this is true, the test will pass, if not, it will fail.

To see more examples of different test assertions look through the read me in the [Quick/Nimble repository](https://github.com/Quick/Nimble).
