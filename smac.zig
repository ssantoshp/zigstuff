const std = @import("std");
const stdout = std.io.getStdOut().writer(); 

pub fn main() !void {
    var biglist = std.ArrayList(u8).init(std.heap.page_allocator);
    defer biglist.deinit();

    var index: u32 = 1;
    while (index < 1001) : (index += 1) {
        if(index % 10 == 7 or index % 7 == 0) {
            try biglist.writer().print("SMAC\n", .{});
        }
        else{
            try biglist.writer().print("{}\n", .{index});
        }
    }
    
    try print_list(&biglist);
}

fn print_list(list: *std.ArrayList(u8)) !void {
    var iter = std.mem.split(u8, list.items, "\n");
    while(iter.next()) |item|{
        try stdout.print("{s}\n", .{item});
    }
}

