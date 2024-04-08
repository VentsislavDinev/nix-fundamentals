## This is a sample usage of lib.fix module
{
  a = self: {
    foo = "foo";
    bar = "bar";
    foobar = self.foo + self.bar;
  };
}
