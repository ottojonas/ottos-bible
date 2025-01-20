---
modified: 2025-01-20T12:12:54.429Z
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
- **Behaviors**:
  - **Append**: Add an item to the list.
  - **Delete**: Remove an item from the list.
  - **Edit**: Change an item in the list.
  - **Output/Read**: Retrieve list items.
  - **Search**: Locate an item in the list.
- **Implementation**:
  - **Using Arrays**:
    - Predefined size.
    - Requires shifting items during deletions.
    - Functions include:
      - `append()` for adding items.
      - `isFull()` to check if the array is full.
      - `delete()` and `shuffle()` to handle item removal and rearrangement.
      - `linearSearch()` for finding an item sequentially.
  - **Using Memory**:
    - Composed of nodes containing data and pointers.
    - **Node Structure**:
      - `[Data][Next Pointer]`.
    - Pointers include:
      - **Head Pointer**: Points to the first item.
      - **Next Free Pointer**: Indicates the next available space.
    - **Dynamic Features**:
      - Supports growth and shrinkage.
      - Allows custom ordering (e.g., alphabetical, numerical).
    - Types of linked lists:
      - **Single Linked List**: One pointer per node.
      - **Doubly Linked List**: Two pointers per node.
      - **Circular List**: Tail pointer links back to the head for a continuous structure.

---

### 3. **String**

- **Definition**: A composite data type built from primitive characters.
- **Key Features**:
  - Encapsulation: Combines data (characters) with operations (functions).
  - Data Hiding: Restricts direct access to internal representation.
- **Functionalities**:
  - `string.upper()`: Converts text to uppercase.
  - `string.lower()`: Converts text to lowercase.
  - `string.len()`: Returns the string length.
  - **Substrings**: Extracts parts of the string.
- **Abstraction**:
  - Users interact with the interface (functions) without needing to know the underlying implementation.

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
  - **Push**: Add an item to the stack.
  - **Pop**: Remove the top item from the stack.
  - **Peek/Top**: View the top item without removing it.
- **Applications**:
  - Undo operations in text editors.
  - Expression evaluation and parsing.
  - Backtracking algorithms (e.g., solving mazes).

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
- **Types of Graphs**:
  - **Directed Graph**: Edges have a direction.
  - **Undirected Graph**: Edges do not have a direction.
  - **Weighted Graph**: Edges have associated weights.
  - **Unweighted Graph**: Edges have no weights.
- **Graph Traversal Methods**:
  - **Depth-First Search (DFS)**: Explores as far as possible along each branch before backtracking.
  - **Breadth-First Search (BFS)**: Explores all neighbors at the current depth before moving to the next level.

---

### 9. **Tree**

- **Definition**: A hierarchical data structure consisting of nodes, where each node has a parent (except the root) and zero or more children.
- **Key Features**:
  - One root node.
  - Nodes connected by edges.
  - Acyclic: No cycles exist.
- **Types of Trees**:
  - **Binary Tree**: Each node has at most two children.
  - **Binary Search Tree (BST)**: A binary tree where the left child contains values less than the parent, and the right child contains values greater than the parent.
  - **Balanced Trees**: Maintains a low height for efficient operations (e.g., AVL trees).
  - **Heap**: A tree-based structure satisfying the heap property.
- **Tree Traversal Methods**:
  - **Inorder Traversal**: Left, Root, Right.
  - **Preorder Traversal**: Root, Left, Right.
  - **Postorder Traversal**: Left, Right, Root.
  - **Level Order Traversal**: Traverses nodes level by level.

---

### 10. **Hash Table**

- **Definition**: A key-value mapping using a hash function.
- **Key Features**:
  - Provides fast insertion, deletion, and lookup.
  - Hashing determines the storage index for each key.

---

### 11. **Encapsulation and Data Hiding**

- **Encapsulation**:
  - Bundles data and functions that manipulate the data together.
- **Data Hiding**:
  - Restricts access to internal components to maintain control and prevent misuse.
