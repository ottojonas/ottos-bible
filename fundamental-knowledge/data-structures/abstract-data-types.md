---
modified: 2025-01-14T21:26:05.854Z
title: Abstract Data Types
---

# Abstract Data Types

## Primative Data Types

Primative data types can be used to make other data types which therefore leads to the creation of abstract data types

#### Examples of Primative Data Types

- Integer
  - Whole number
- String
  - Letters
- Float
  - Decimal
- Boolean
  - True or False

#### Primative Abstract Data Types

- **Array**

  - Creates the initial building block to create other abstract data types.
    - An Array is a static data structure and therefore cannot grow or shrink once created.
    - Arrays must consist of only a single data type.
    - Use [Random Access](/fundamental-knowledge/data-structures/access-types.md#random-access) while using an index key.
    - Has constant time access.
      - The amount of time to access a piece of data is not affected by the size of the array.
  - Basic primitive abstract data type.

- **List**

  - A [Dynamic Data Structure](dynamic-data-structure.md) that can grow or shrink in size.
  - Lists can contain elements of different data types.
  - Provides sequential access to elements.

- **Tuple**

  - Immutable Array.
  - Once created, the elements of a tuple cannot be changed.
  - Can contain elements of different data types.

- **Dictionary**

  - Array that uses a value as a lookup key.
  - Stores key-value pairs, allowing for fast retrieval based on the key.
  - Keys must be unique within a dictionary.

- **Queue**

  - First in First Out Structure (FIFO).
  - Elements are added to the end and removed from the front.
  - Used in scenarios where order of processing is important.

- **Stack**

  - Last in First Out Structure (LIFO).
  - Elements are added and removed from the top.
  - Used in scenarios where the most recently added element is processed first.

- **Track**

  - A sequence of elements that can be traversed.
  - Often used to represent paths or sequences in algorithms.

- **Graph**

  - A collection of nodes (vertices) and edges connecting them.
  - Used to represent relationships and connections between entities.

- **Hash Table**
  - A data structure that maps keys to values using a hash function.
  - Provides fast insertion, deletion, and lookup operations.
  - Keys are hashed to determine the index for storing the value.
