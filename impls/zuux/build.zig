const std = @import("std");
const LibExeObjStep = @import("std").build.LibExeObjStep;

pub fn build(b: *std.build.Builder) void {

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exes = [_]*LibExeObjStep{
        b.addExecutable("step0_repl", "src/step0_repl.zig"),
    };

    for (exes) |exe| {
        exe.setBuildMode(mode);
        exe.linkSystemLibrary("c");
        exe.linkSystemLibrary("pcre");
        exe.linkSystemLibrary("readline");
        const run_cmd = exe.run();
        const step = b.step(exe.name, exe.name);
        step.dependOn(&run_cmd.step);
        b.default_step.dependOn(&exe.step);
        b.installArtifact(exe);
    }
}
