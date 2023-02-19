# take a sequence of arbitrary types and converts them to string and then appends them to each other.
proc strConv*(list: varargs[string, `$`]): string =
    for item in list:
        result.add item
# run asserts
assert strConv(1, 2, 3) == "123"
assert strConv("1", "2", "3") == "123"
assert strConv(1, "2", 3) == "123"