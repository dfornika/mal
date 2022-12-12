const std = @import("std");
const getline = @import("readline.zig").getline;
const allocator = @import("std").heap.c_allocator;

const MalType = @import("types.zig").MalType;
const reader = @import("reader.zig");
const printer = @import("printer.zig");

pub fn READ(line: []const u8) ?*MalType {
    var output = reader.read_str(line);
    return output;
}

pub fn EVAL(input: ?*MalType) ?*MalType {
    return input;
}

pub fn PRINT(writer: anytype, output: ?*MalType) !void {
    try printer.pr_str(writer, output);
}

pub fn rep(writer: anytype, input: []u8) !void {
    var ast = READ(input);
    var value = EVAL(ast);
    try PRINT(writer, value);
}

pub fn main() !void {
    // const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    while (true) {
        var input = (try getline(&allocator)).?;

        try rep(stdout, input);
    }
}
