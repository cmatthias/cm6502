public import interfaces_autogen;

interface MMU
{
  ubyte read(ushort addr);
  void write(ushort addr, ubyte val);
}
