const std = @import("std");
const getline = @import("readline.zig").getline;
const allocator = @import("std").heap.c_allocator;

pub fn READ() !?[]const u8 {
    var line = (try getline(&allocator)) orelse null;

    return line;
}

pub fn EVAL(input: []const u8) ![]const u8 {
    return input;
}

pub fn PRINT(writer: anytype, output: []const u8) !void {
    try writer.print(
        "{s}\n",
        .{output},
    );
}

pub fn rep(writer: anytype) !void {
    var ast = try READ() orelse "";
    var value = try EVAL(ast);
    try PRINT(writer, value);
}

pub fn main() !void {
    // const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    while (true) {
        try rep(stdout);
    }
}
