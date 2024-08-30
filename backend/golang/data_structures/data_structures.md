# Datastructures

- Array
- Linked List
- Stack
- Queue
- Binary Tree
- Hash Table
- Matrix
- Sparsr Matrix
- Heap

## Linear Data Structures

### Arrays

```go
var a [10]int
```

### Linked list

```go 
type Node struct {
 data int
 next *Node
}

type LinkedList struct {
 head *Node
}
```

### Stack

```go
// Stack represents a stack data structure
type Stack struct {
	items []int
}

// Push adds an item to the stack
func (s *Stack) Push(item int) {
	s.items = append(s.items, item)
}

// Pop removes and returns the top item from the stack
func (s *Stack) Pop() (int, bool) {
	if len(s.items) == 0 {
		return 0, false
	}
	index := len(s.items) - 1
	item := s.items[index]
	s.items = s.items[:index]
	return item, true
}

// Peek returns the top item from the stack without removing it
func (s *Stack) Peek() (int, bool) {
	if len(s.items) == 0 {
		return 0, false
	}
	return s.items[len(s.items)-1], true
}

// IsEmpty checks if the stack is empty
func (s *Stack) IsEmpty() bool {
	return len(s.items) == 0
}
```

### Queue

```go
// Queue represents a queue data structure
type Queue struct {
	items []int
}

// Enqueue adds an item to the back of the queue
func (q *Queue) Enqueue(item int) {
	q.items = append(q.items, item)
}

// Dequeue removes and returns the front item from the queue
func (q *Queue) Dequeue() (int, bool) {
	if len(q.items) == 0 {
		return 0, false
	}
	item := q.items[0]
	q.items = q.items[1:]
	return item, true
}

// Peek returns the front item from the queue without removing it
func (q *Queue) Peek() (int, bool) {
	if len(q.items) == 0 {
		return 0, false
	}
	return q.items[0], true
}

// IsEmpty checks if the queue is empty
func (q *Queue) IsEmpty() bool {
	return len(q.items) == 0
}
```

### Binary Tree

```go
type Node struct {
    data  int
    left  *Node
    right *Node
}
type Tree struct {
    root *Node
}
func (tree *Tree) Insert(val int) {
    tree.InsertRec(tree.root, val)
}
func (tree *Tree) InsertRec(node *Node, val int) *Node {
    if tree.root == nil {
        tree.root = &Node{val, nil, nil}
        return tree.root
    }
    if node == nil {
        return &Node{val, nil, nil}
    }
    if val <= node.data {
        node.left = tree.InsertRec(node.left, val)
    }
    if val > node.data {
        node.right = tree.InsertRec(node.right, val)
    }
    return node
}
func (tree *Tree) Search(val int) bool {
    found := tree.SearchRec(tree.root, val)
    return found
}
func (tree *Tree) SearchRec(node *Node, val int) bool {
    if node.data == val {
        return true
    }
    if node == nil {
        return false
    }
    if val < node.data {
        return tree.SearchRec(node.left, val)
    }
    if val > node.data {
        return tree.SearchRec(node.right, val)
    }
    return false
}
func (tree *Tree) Inorder(node *Node) {
    if node == nil {
        return
    } else {
        tree.Inorder(node.left)
        fmt.Print(node.data, " ")
        tree.Inorder(node.right)
    }
}
func (tree *Tree) Levelorder() {
    if tree.root == nil {
        return
    }    nodeList := make([](*Node), 0)
    nodeList = append(nodeList, tree.root)    for !(len(nodeList) == 0) {
        current := nodeList[0]
        fmt.Print(current.data, " ")
        if current.left != nil {
            nodeList = append(nodeList, current.left)
        }
        if current.right != nil {
            nodeList = append(nodeList, current.right)
        }
        nodeList = nodeList[1:]
    }
}
```

### List

```go
import (
    "fmt"
    "container/list"
)
func main() {
  var newList list.List
  newList.PushBack(123)
  newList.PushBack(456)
  newList.PushBack(789)

  for element := newList.Front(); element != nil; element = element.Next() {
    fmt.Println(element.Value(int))
   }
}
```

### Hash Table (=map)

```go 
map[KeyType]ValueType
```

### Heap

```go
type MaxHeap struct {
  arr []int
}
// Insert a new value into the heap.
func (hp *MaxHeap) Insert (key int){
   hp.arr = append(hp.arr, key)
   hp.heapifyMaxUp(len(hp.arr) - 1)
}
// heapifyMaxUp swaps nodes until the max value has reached the top of the
// heap
func (hp *MaxHeap) heapifyMaxUp (index int) {
   for hp.arr[parent(index)] < hp.arr[index] {
   hp.swap(parent(index), index)
   index = parent(index)
}
// parent returns the id of the parent of the given node.
func parent(i int) int{
   return (i - 1)/2
}
// left returns the left child of the node.
func left(i int) int{
   return 2*i + 2
}
// right returns the right child of the node.
func right(i int) int{
   return 2*i + 2
}
// swap the two given nodes
func (hp *MaxHeap) swap(int1, int2 int) {
  hp.arr[int1], hp.arr[int2] = hp.arr[int2], hp.arr[int1]
}
```
