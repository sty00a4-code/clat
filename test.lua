local lex = require "clat"

print(lex("hello there penis"))
print(lex("hello \"there penis\""))
print(lex("hello \"there penis\" \"joe bama\""))
print(lex("hello -name=joe there"))
print(lex("hello -name=\"joe\" there"))