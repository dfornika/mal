const pcre = @cImport({
    @cInclude("pcre.h");
});

const MalType = @import("types.zig").MalType;

const Reader = struct {
    string: []const u8,
    tokens: []usize,
    position: u32,

    pub fn init(string: []const u8, tokens: []usize) Reader {
        return Reader{
            .position = 0,
            .string = string,
            .tokens = tokens,
        };
    }

    pub fn next(self: *Reader) []const u8 {
        const this_token = self.peek();
        self.position += 1;
        return this_token;
    }

    pub fn peek(self: *Reader) []const u8 {
        while (!self.eol()) {
            const start = self.tokens[2 * self.position];
            const end = self.tokens[2 * self.position + 1];
            if (self.string[start] == ';') {
                self.position += 1;
                continue;
            }
            return self.string[start..end];
        }
        return "";
    }

    pub fn eol(self: *Reader) bool {
        return (2 * self.position >= self.tokens.len);
    }
};

pub fn read_str(input: []const u8) ?*MalType {
    var tokens = tokenize(input);
    var reader = Reader.init(input, tokens);
    var form = read_form(&reader);

    return form;
}

pub fn tokenize(input: []const u8) []usize {
    _ = input;
    var tokens = &[_]usize{};
    return tokens;
}

pub fn read_form(reader: *Reader) *MalType {
    var first_token = reader.peek();
    _ = first_token;
    var form = MalType.init();

    return &form;
}
