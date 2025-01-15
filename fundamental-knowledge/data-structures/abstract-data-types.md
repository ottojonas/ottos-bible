---
modified: 2025-01-14T21:26:05.854Z
title: Abstract Data Types
---

# Abstract Data Types

## Primitive Data Types

Primitive data types form the foundation for building other data types, including abstract data types.

### Examples of Primitive Data Types

- **Integer**: Whole numbers (e.g., 1, -5, 42)
- **String**: Text or sequence of characters (e.g., "Hello", "123")
- **Float**: Decimal numbers (e.g., 3.14, -2.718)
- **Boolean**: Logical values (`True` or `False`)

---

## Primitive Abstract Data Types

Abstract data types (ADTs) are built using primitive data types and provide higher-level data structures.

### 1. **Array**
- **Definition**: A static data structure where elements are indexed.
- **Key Features**:
  - Elements must be of the same data type.
  - Uses [Random Access](/fundamental-knowledge/data-structures/access-types.md#random-access) via index keys.
  - **Constant Time Access**: Access time is unaffected by the array's size.
- **Usage**: Serves as a fundamental building block for other data types.

---

### 2. **List**
- **Definition**: A [Dynamic Data Structure](dynamic-data-structure.md) that adjusts size as needed.
- **Key Features**:
  - Can grow or shrink dynamically.
  - Supports elements of varying data types.
  - Provides sequential access to elements.

---

### 3. **Tuple**
- **Definition**: An immutable array.
- **Key Features**:
  - Elements cannot be modified after creation.
  - Can contain multiple data types.

---

### 4. **Dictionary**
- **Definition**: A key-value store for fast lookups.
- **Key Features**:
  - Keys are unique.
  - Values are accessed via their corresponding keys.
  - Allows efficient retrieval, insertion, and deletion.

---

### 5. **Queue**
- **Definition**: A First In, First Out (FIFO) structure.
- **Key Features**:
  - Elements are added at the end and removed from the front.
  - Useful for tasks where order matters (e.g., job scheduling).

---

### 6. **Stack**
- **Definition**: A Last In, First Out (LIFO) structure.
- **Key Features**:
  - Elements are added and removed from the top.
  - Suitable for undo operations, expression evaluation, etc.

---

### 7. **Track**
- **Definition**: A sequence of traversable elements.
- **Key Features**:
  - Often represents paths or ordered sequences in algorithms.

---

### 8. **Graph**
- **Definition**: A collection of nodes (vertices) and edges connecting them.
- **Key Features**:
  - Represents relationships or connections.
  - Used in network modeling, pathfinding, etc.

---

### 9. **Hash Table**
- **Definition**: A key-value mapping using a hash function.
- **Key Features**:
  - Provides fast insertion, deletion, and lookup.
  - Hashing determines the storage index for each key.

