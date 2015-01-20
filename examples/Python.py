#!/usr/bin/env python
# encoding: utf-8

class Foo():
    def __init__(self, name = "World!"):
        self.name = name

if __name__ == "__main__":
    instance = Foo()
    print "Hello, %s" % instance.name
#	print "Mixing tabs and spaces is bad"
