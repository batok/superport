const std = @import("std");
const expect = @import("std").testing.expect;
const exit = std.process.exit;

pub fn main() anyerror!void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    while (true) {
        const left: u8 = stdin.readByte() catch |err| switch (err) {
            error.EndOfStream => continue,
            else => continue,
        };
        const right: u8 = stdin.readByte() catch |err| switch (err) {
            error.EndOfStream => break,
            else => continue,
        };

        var length = (@as(u16, left) << 8) | right;

        const command = stdin.readByte() catch {
            break;
        };
        const param = stdin.readByte() catch {
            break;
        };
        var param2: u8 = undefined;
        if (length > 2) param2 = stdin.readByte() catch {
            break;
        };
        var result: u8 =
            switch (command) {
            1 => foo(param),
            2 => bar(param),
            3 => baz(param),
            4 => sum(param, param2),
            else => 0,
        };

        // don't know why the next two lines are needed vs the c version
        try stdout.writeByte(@as(u8, 0x00));
        try stdout.writeByte(@as(u8, 0x01));
        try stdout.writeByte(result);
    }
}

fn foo(v: u8) u8 {
    return v + 1;
}

fn bar(v: u8) u8 {
    return v * 2;
}

fn baz(v: u8) u8 {
    return v - 3;
}

fn sum(x: u8, y: u8) u8 {
    return x + y;
}

test "test functions" {
    try expect(foo(3) == 4);
    try expect(bar(3) == 6);
    try expect(baz(3) == 0);
    try expect(sum(3, 2) == 5);
}
