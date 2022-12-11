const std = @import("std");

pub fn READ(reader: anytype, buffer: []u8) !?[]const u8 {
    // https://ziglearn.org/chapter-2/#readers-and-writers
    var line = (try reader.readUntilDelimiterOrEof(
        buffer,
        '\n',
    )) orelse return null;

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

pub fn rep(reader: anytype, input_buffer: []u8, writer: anytype) !void {
    var ast = try READ(reader, input_buffer) orelse "";
    var value = try EVAL(ast);
    try PRINT(writer, value);
}

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var input_buffer: [256]u8 = undefined;

    while (true) {
        try stdout.writeAll("user> ");
        try rep(stdin, &input_buffer, stdout);
    }
}
