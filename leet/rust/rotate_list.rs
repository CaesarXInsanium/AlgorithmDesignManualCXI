// Definition for singly-linked list.
#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

impl ListNode {
    #[inline]
    fn new(val: i32) -> Self {
        ListNode { next: None, val }
    }
}


pub fn rotate_right(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
    let mut cursor = head;
    let mut val = 0;
    while (match cursor {
        Some(x) => {
            val = x;
            true
        }
        None => False,
    }) {
        cursor = cursor.unwrap().next;
    }
}

fn main() {
    println!("Hello World!");
}
