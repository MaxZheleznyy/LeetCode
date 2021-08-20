/*
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:

MinStack() initializes the stack object.
void push(val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.

Example:
Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
*/

class MinStack {

    var minValue = 0
    var stack = [Int]()
    
    func push(_ x: Int) {
        if stack.isEmpty {
            stack.append(0)
            minValue = x
        } else {
            stack.append(x - minValue)
            if x < minValue {
                minValue = x
            }
        }
    }
    
    func pop() {
        guard stack.isEmpty == false else  { return }
        
        let removedValue = stack.removeLast()
        
        if removedValue < 0 {
            minValue -= removedValue
        }
    }
    
    func top() -> Int {
        guard let top = stack.last else { return 0 }
        
        if top > 0 {
            return top + minValue
        } else {
            return minValue
        }
    }
    
    func getMin() -> Int {
        return minValue
    }
}
