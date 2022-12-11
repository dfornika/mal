const std = @import("std");
const getline = @import("readline.zig").getline;
const allocator = @import("std").heap.c_allocator;

pub fn READ(line: []const u8) []const u8 {
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

pub fn rep(input: []u8, writer: anytype) !void {
    var ast = READ(input);
    var value = try EVAL(ast);
    try PRINT(writer, value);
}

pub fn main() !void {
    // const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    while (true) {
        var input = (try getline(&allocator)) orelse null;
        if (input != null) {
            try rep(input.?, stdout);
        }
    }
}
