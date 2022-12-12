const MalType = @import("types.zig").MalType;

pub fn pr_str(writer: anytype, input: ?*MalType) !void {
    try writer.print(
        "{}\n",
        .{input.?},
    );
}
