# Summary of Ruby Documentation

## Overview

Ruby is a dynamic, open-source, object-oriented programming language known for its simplicity, productivity, and focus on developer happiness. It is widely used for web development, scripting, and building scalable applications.

---

## Key Features

- **Object-Oriented**: Everything in Ruby is an object, including primitive data types.
- **Dynamic Typing**: Variables are not bound to a specific data type.
- **Duck Typing**: Behavior is determined by object methods rather than its class.
- **Rich Standard Library**: Includes tools for file handling, networking, and data manipulation.
- **Cross-Platform**: Runs on various operating systems.
- **Metaprogramming**: Supports dynamic method creation and modification.

---

## Core Concepts

### Syntax Basics

- **Hello World**:
  ```ruby
  puts "Hello, Ruby!"
  ```
- **Comments**:
  ```ruby
  # Single-line comment
  =begin
  Multi-line comment
  =end
  ```

### Variables

- No need to declare types:
  ```ruby
  name = "Ruby"
  version = 3.0
  is_active = true
  ```

### Data Types

- **Primitive**: `Integer`, `Float`, `String`, `Symbol`, `Boolean`
- **Collections**: `Array`, `Hash`, `Range`
- **Other**: `NilClass`, `Time`

---

## Control Structures

### Conditionals

```ruby
if age > 18
  puts "Adult"
elsif age > 12
  puts "Teenager"
else
  puts "Child"
end
```

### Loops

- **For Loop**:
  ```ruby
  for i in 1..5 do
    puts i
  end
  ```
- **While Loop**:
  ```ruby
  x = 0
  while x < 5
    puts x
    x += 1
  end
  ```
- **Iterators**:
  ```ruby
  (1..5).each do |i|
    puts i
  end
  ```

---

## Object-Oriented Programming

- **Class and Object**:

  ```ruby
  class Car
    attr_accessor :brand

    def initialize(brand)
      @brand = brand
    end

    def honk
      "Honk! I am a #{@brand}."
    end
  end

  car = Car.new("Toyota")
  puts car.honk
  ```

- **Inheritance**:

  ```ruby
  class ElectricCar < Car
    def charge
      "Charging the battery."
    end
  end
  ```

- **Modules**:

  ```ruby
  module Greetings
    def say_hello
      "Hello!"
    end
  end

  class Person
    include Greetings
  end

  person = Person.new
  puts person.say_hello
  ```

---

## Collections

### Arrays

- Ordered collection of elements:
  ```ruby
  colors = ["red", "green", "blue"]
  puts colors[0] # Outputs: red
  ```

### Hashes

- Key-value pairs:
  ```ruby
  ages = { "Alice" => 25, "Bob" => 30 }
  puts ages["Alice"] # Outputs: 25
  ```

### Ranges

- Continuous sequence of values:
  ```ruby
  (1..5).to_a # Converts range to an array: [1, 2, 3, 4, 5]
  ```

---

## Methods

- **Definition**:
  ```ruby
  def greet(name)
    "Hello, #{name}!"
  end
  puts greet("Ruby")
  ```
- **Default Parameters**:
  ```ruby
  def greet(name = "Guest")
    "Hello, #{name}!"
  end
  ```

---

## Error Handling

- Use `begin`, `rescue`, and `ensure`:
  ```ruby
  begin
    result = 10 / 0
  rescue ZeroDivisionError => e
    puts "Error: #{e.message}"
  ensure
    puts "Cleanup operations"
  end
  ```

---

## File Handling

- **Reading from a File**:

  ```ruby
  File.open("example.txt", "r") do |file|
    puts file.read
  end
  ```

- **Writing to a File**:
  ```ruby
  File.open("example.txt", "w") do |file|
    file.puts "Hello, Ruby!"
  end
  ```

---

## Blocks, Procs, and Lambdas

- **Block**:

  ```ruby
  3.times { puts "Hello" }
  ```

- **Proc**:

  ```ruby
  my_proc = Proc.new { |x| puts x }
  my_proc.call(10)
  ```

- **Lambda**:
  ```ruby
  my_lambda = ->(x) { puts x }
  my_lambda.call(20)
  ```

---

## Gems and Package Management

- Install a gem:
  ```bash
  gem install rails
  ```
- Require a gem in a script:
  ```ruby
  require 'rails'
  ```
- Manage dependencies using Bundler:
  ```bash
  bundle install
  ```

---

## Best Practices

- Use meaningful variable and method names.
- Follow Ruby's **convention over configuration** principle.
- Use built-in methods and libraries whenever possible.
- Leverage blocks and iterators for concise code.

---

## Resources

- **Official Documentation**: [https://www.ruby-lang.org/en/documentation/](https://www.ruby-lang.org/en/documentation/)
- **Ruby Gems**: [https://rubygems.org/](https://rubygems.org/)
- **Ruby on Rails**: Popular web framework ([https://rubyonrails.org/](https://rubyonrails.org/))

Ruby's clean syntax, powerful features, and extensive libraries make it an excellent choice for web development, scripting, and more.
