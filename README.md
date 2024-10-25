# LinkedListSwift 📚

[![Swift Version](https://img.shields.io/badge/Swift-5.7-orange.svg)](https://swift.org)  
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

A Swift package providing a lightweight, generic, and singly-linked list data structure with methods for list manipulation, including custom sorting, and easy conversion to arrays and dictionaries.

## Table of Contents 📖
- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
    - [Creating a LinkedList](#creating-a-linkedlist)
    - [Basic Operations](#basic-operations)
    - [Accessing and Manipulating Nodes](#accessing-and-manipulating-nodes)
    - [Converting to Array and Dictionary](#converting-to-array-and-dictionary)
    - [Sorting the List](#sorting-the-list)
- [Contributing](#contributing)
- [License](#license)

## Overview 📝
This package implements a simple, yet flexible LinkedList structure with basic list operations such as insertion, node retrieval, sorting, and conversions. LinkedList and Node structures conform to CustomStringConvertible for easy, readable print output.

## Installation ⚙️
### Swift Package Manager (SPM) 
To add this package to your project, open your Package.swift file and add the following line to your dependencies:
```swift
dependencies: [
    .package(url: "https://github.com/RizaMamedow/LinkedListSwift.git", from: "1.0.0")
]
```

## Usage 🚀

### Creating a LinkedList
**Create an empty list or initialize a list with an array of elements:**
```swift 
var list = LinkedList<Int>()
let listWithValues = LinkedList([1, 2, 3, 4, 5])
```
### Basic Operations ✨
* **Appending:** Add an element to the end of the list.
```swift 
list.append(10)
```
* **Pushing:** Insert an element at the beginning of the list.
```swift 
list.push(5)
```
### Accessing and Manipulating Nodes 🔍
* **Get a Node by Index:**
```swift
let node = list.getNode(at: 2) // retrieves the node at index 2
```
* **Count:** Retrieve the count of nodes in the list.
```swift
print("Node count: \(list.count)")
```
### Converting to Array and Dictionary 📋
* **To Array:**
```swift
let arrayRepresentation = list.toArray()
```
* **To Dictionary:**
```swift
let dictionaryRepresentation = list.toDictionary()
```
### Sorting the List 🔄
The list supports custom sorting:
```swift 
list.sort(by: <) // Sorts in ascending order
```

## Contributing 🤝
Contributions are welcome! Please fork this repository, make your changes, and open a pull request. Be sure to update documentation as needed.

## License 📜
Distributed under the MIT License. See `LICENSE` for more information.