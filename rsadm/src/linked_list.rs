pub enum NodeValid {
    Null,
    Valid(),
}

#[derive(Copy, Clone, Debug)]
struct Node<T> {
    value: Option<T>,
    next: Option<usize>,
}

impl<T> Node<T>
where
    T: Copy,
{
    fn new(value: T) -> Self {
        Self {
            value: Some(value),
            next: None,
        }
    }

    fn set_next(&mut self, n: usize) {
        self.next = Some(n);
    }

    fn is_null(&self) -> bool {
        match self.value {
            Some(_) => false,
            None => match self.next {
                Some(_) => false,
                None => true,
            },
        }
    }

    fn value(&self) -> Option<T> {
        return self.value;
    }

    fn null() -> Self{
        Self{
            value: None,
            next: None
        }
    }

    fn set_null(&mut self){
        self.value = None;
        self.next = None;
    }
}

#[derive(Debug)]
pub struct LinkedList<T> {
    head: Option<usize>,
    len: usize,
    mem: Vec<Node<T>>,
}

impl<T> LinkedList<T>
where
    T: Copy,
{
    pub fn new() -> Self {
        Self {
            head: None,
            len: 0,
            mem: Vec::new(),
        }
    }

    pub fn find_empty_spot(&self) -> usize {
        for (index, node) in self.mem.iter().enumerate() {
            if node.is_null() {
                return index as usize;
            }
        }
        return self.mem.len() as usize;
    }

    fn node_at(&self, index: usize) -> Node<T> {
        if self.mem.len() as usize > index {
            self.mem[index as usize].clone()
        } else {
            Node::null()
        }
    }

    pub fn size(&self) -> usize {
        return self.len;
    }

    pub fn push(&mut self, value: T) {
        let mut node = Node::new(value);
        let new_index = self.find_empty_spot();
        if let Some(head_index) = self.head {
            node.set_next(head_index);
            self.head = Some(new_index);
            if self.mem.len() as usize > new_index{
                self.mem[new_index as usize] = node;
            }else{
                self.mem.push(node);
            }
        } else {
            self.head = Some(new_index);
            self.mem.push(node);
        }
    }

    pub fn peek(&self) -> Option<T> {
        if let Some(head_index) = self.head {
            let n = self.mem[head_index as usize];
            n.value()
        } else {
            None
        }
    }

    pub fn pop(&mut self) -> Option<T> {
        if let Some(head_index) = self.head{
            let head_node = self.node_at(head_index);
            if head_node.is_null(){
                panic!("Head Index points to null node");
                return None;
            }
            let next_index = head_node.next;
            self.head = next_index;
            head_node.value() 
        }else{
            None
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn push_peek() {
        let mut ll: LinkedList<usize> = LinkedList::new();
        assert_eq!(ll.size(), 0);
        ll.push(69);
        assert_eq!(ll.peek().unwrap(), 69);
        ll.push(78);
        ll.push(45);
        ll.push(420);
        assert_eq!(ll.peek().unwrap(), 420);
    }

    #[test]
    fn popped() {
        let mut l: LinkedList<i32> = LinkedList::new();
        for i in 0..10 {
            l.push(i);
        }
        assert_eq!(l.pop().unwrap(), 9);
        assert_eq!(l.pop().unwrap(), 8);

        let mut l2: LinkedList<i8> = LinkedList::new();
        assert!(l2.pop().is_none());
    }
}
