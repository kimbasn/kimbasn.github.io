---
title: "Intuition behind iterative implementation of DFS and BFS in tree traversal"
category: posts
date: 2024-12-30
last_modified_at: 2024-12-30
excerpt: "Understand the intuition behind using Stack and Queue to implement iterative DFS and BFS in tree traversal algorithms."
categories:
  - Blog
tags:
  - DSA
---


Depth-First Search (DFS) and Breadth-First Search (BFS) are two fundamental algorithms used to traverse or search through trees or graphs. While their recursive versions are more straightforward for many, iterative implementations can be more efficient in terms of space complexity and are often necessary when the recursion depth could potentially exceed the system’s call stack limits. By using auxiliary data structures such as stacks (for DFS) and queues (for BFS), we can achieve the traversal order and avoid recursion stack overflows.

In this article, we will discuss the intuition behind these data structures and how they contribute to the desired traversal order in both DFS and BFS algorithms.


## Tree Traversal Algorithms

Tree traversal refers to the process of visiting all the nodes in a tree data structure. There are several strategies for traversing a tree, but the two most common ones are: **Depth-First Search (DFS)** and **Breadth-First Search (BFS)**.

### 1. Depth-First Search (DFS)

Explore as far as possible down one branch before backtracking.
**illustration**

### 2. Breadth-First Search (BFS)

Explore all nodes at the present depth level before moving on to nodes at the next depth level.
**illustration**
In practice, these two traversals algorithms can be implemented either using **recursion** or **iteration**.

Why choose iteration over recursion?

The recursion call deepth equal to the deepth of the tree. Many programming language have a maximum recursion depth (1000 by default in python). When your program recursion call exceed this limit, a **stack overflow** exception is triggered. Even if the programmer can increase this limit, it is not generally a good practice. It is better to rewrite the algorithm in iterative way.<br />
So the main advantage of iteration is it ability to handle a theorical infinite tree depth (only memory availability could be a limititatio).
The iterative implementation versions of these algorithms use a stack (for DFS) and a queue (for BFS) to manage the nodes to be visited.

## Stack

### What is a Stack?

A **stack** is a linear data structure that follows the Last In First Out (LIFO) principle. In simple terms, the last element added to the stack is the first one to be removed. You can think of a stack as a stack of plates where you add and remove plates from the top.

### Stack Operations

- **Push:** Add an element to the top of the stack.
- **Pop:** Remove the top element from the stack.
- **Peek:** Look at the top element without removing it.
- **IsEmpty:** Check if the stack is empty.

### Stack Implementation

Here is a simple Python implementation of a stack:

```python
class Stack:
    def __init__(self):
        self.stack = []
    
    def push(self, value):
        self.stack.append(value)
    
    def pop(self):
        if not self.is_empty():
            return self.stack.pop()
    
    def peek(self):
        return self.stack[-1] if not self.is_empty() else None
    
    def is_empty(self):
        return len(self.stack) == 0
```

---

## Queue

### What is a Queue?

A **queue** is another linear data structure, but it follows the First In First Out (FIFO) principle. This means the first element added to the queue is the first one to be removed, much like a line at a checkout counter.

### Queue Operations

- **Enqueue:** Add an element to the rear of the queue.
- **Dequeue:** Remove an element from the front of the queue.
- **Front/Peek:** Look at the front element without removing it.
- **IsEmpty:** Check if the queue is empty.

### Queue Implementation

Here is a simple Python implementation of a queue:

```python
from collections import deque

class Queue:
    def __init__(self):
        self.queue = deque()
    
    def enqueue(self, value):
        self.queue.append(value)
    
    def dequeue(self):
        if not self.is_empty():
            return self.queue.popleft()
    
    def peek(self):
        return self.queue[0] if not self.is_empty() else None
    
    def is_empty(self):
        return len(self.queue) == 0
```

Which DS to what ?

## Stack to Implement DFS

### Intuition

In **Depth-First Search (DFS)**, we explore as deep as possible along one branch of the tree before backtracking. The key idea behind DFS is to keep pushing nodes onto a stack until we reach a leaf node or a node that has no children. When we encounter such a node, we backtrack by popping from the stack and moving to the next unvisited node.

The stack is crucial because it allows us to keep track of the nodes we need to revisit after finishing the current branch of the tree.

### DFS Implementation Using a Stack

1. **Push the root node** onto the stack.
2. **Pop the top node** from the stack, visit it, and add its unvisited children to the stack.
3. **Repeat** until the stack is empty.

```python
def iterative_dfs(root):
    if not root:
        return
    
    stack = [root]  # Initialize stack with the root node
    
    while stack:
        node = stack.pop()  # Pop the top element
        
        # Visit the node (print or store its value)
        print(node.val)
        
        # Push all children to the stack (right child first for correct order)
        if node.right:
            stack.append(node.right)
        if node.left:
            stack.append(node.left)
```

---

## Queue to Implement BFS

### Intuition

In **Breadth-First Search (BFS)**, we explore all nodes at the present depth level before moving on to nodes at the next depth level. To do this, we need a queue. The queue helps ensure that we visit nodes in a level-by-level manner: we add the children of the current node to the queue, then dequeue the nodes one by one to explore their children.

### BFS Implementation Using a Queue

1. **Enqueue the root node** onto the queue.
2. **Dequeue the front node** from the queue, visit it, and enqueue its children.
3. **Repeat** until the queue is empty.

```python
def iterative_bfs(root):
    if not root:
        return
    
    queue = Queue()  # Initialize queue
    queue.enqueue(root)
    
    while not queue.is_empty():
        node = queue.dequeue()  # Dequeue the front element
        
        # Visit the node (print or store its value)
        print(node.val)
        
        # Enqueue children
        if node.left:
            queue.enqueue(node.left)
        if node.right:
            queue.enqueue(node.right)
```

---

## Conclusion

The iterative versions of DFS and BFS provide efficient alternatives to recursion, avoiding potential stack overflow issues while still allowing us to explore all nodes in the tree. The stack in DFS helps manage the depth of the search, enabling us to backtrack and explore other branches as necessary. On the other hand, the queue in BFS ensures that we explore nodes level by level, moving outward from the root.

Both algorithms are essential for solving problems in trees and graphs, and understanding their iterative implementations provides a deeper insight into their underlying mechanics and the role of auxiliary data structures in controlling traversal order.
