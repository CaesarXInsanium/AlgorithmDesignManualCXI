const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
pub fn LinkedList(comptime T: type) type {
    return struct {
        const Node = struct {
            const NodeSelf = @This();
            value: T,
            next: ?*Node,

            pub fn new(value: T, allocator: Allocator) !*NodeSelf {
                // create will create new unique instance of thing.
                // use alloc for multiple items
                // will return error union with pointer to thing
                // try statement will return pointer to return with error
                var node: *NodeSelf = try allocator.create(NodeSelf);
                node.value = value;
                node.next = null;
                // return NodeSelf{ .value = value, .next = null };
                return node;
            }
            // relevant allocator is supposed to be owned by the LinkedList structure
            pub fn destroy(self: *NodeSelf, allocator: Allocator) void {
                // destrpy can only deallocate a single instance of the pointer of the thing
                // use free for slice of items
                allocator.destroy(self);
            }

            // return null pointer to Node
            pub fn nil() ?*NodeSelf {
                return null;
            }
        };

        head: ?*Node,
        len: usize,
        allocator: Allocator,

        const ListSelf = @This();

        pub fn init(alloc: Allocator) ListSelf {
            return ListSelf{ .head = Node.nil(), .len = 0, .allocator = alloc };
        }

        pub fn push(self: *ListSelf, value: T) !void {
            var new_node = try Node.new(value, self.allocator);
            new_node.next = self.head;
            self.head = new_node;
            self.len = self.len + 1;
        }

        pub fn pop(self: *ListSelf) ?T {
            var head: *Node = self.head orelse return null;
            self.head = head.next;
            var val = head.value;
            head.destroy(self.allocator);
            self.len = self.len - 1;
            return val;
        }

        pub fn peek(self: *ListSelf) ?*T {
            var head: *Node = self.head orelse return null;
            return &head.value;
        }
    };
}

test "init_list" {
    const testing = std.testing;
    // default recomended zig allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit(); // destroy everything on program ending execution
    const allocator = arena.allocator();
    const List = LinkedList(i32); // defines LinkedList for i32
    var list = List.init(allocator);
    try testing.expect(@TypeOf(list) == List);
}

test "push and peek elements" {
    const testing = std.testing;
    // default recomended zig allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit(); // destroy everything on program ending execution
    const allocator = arena.allocator();
    const List = LinkedList(i32); // defines LinkedList for i32
    var list = List.init(allocator);
    try list.push(69);
    var wrong: i32 = 0;
    var peek: *i32 = list.peek() orelse @ptrCast(*i32, &wrong);
    try testing.expect(peek.* == 69);
}
