class Cpu
{
  short pc;
  byte sp;
  byte a;
  byte x;
  byte y;
  byte flags;

  enum AddrMode
  {
    impl,
    acc,
    imm,
    zp,
    zpx,
    zpy,
    rel,
    abs,
    absx,
    absy,
    ind,
    idx,
    idy
  }

  struct Inst
  {
    string name;
    AddrMode mode;
    byte bytes;
    byte cycles;
    void delegate() handler;
  }

  this()
  {
    auto inst = [
      // $00
      Inst("brk", AddrMode.impl, 1, 7, &brk),
      Inst("ora", AddrMode.idx, 2, 6, &ora_idx),
      Inst(),
      Inst(),
      Inst(),
      Inst("ora", AddrMode.zp, 2, 3, &ora_zp),
      Inst("asl", AddrMode.zp, 2, 5, &asl_zp),
      Inst(),
      // $08
      Inst("php", AddrMode.impl, 1, 3, &php),
      Inst("ora", AddrMode.imm, 2, 2, &ora_imm)
    ];
  }

  void brk()
  {
  }

  void ora_imm()
  {
  }
  
  void ora_idx()
  {
  }

  void ora_zp()
  {
  }

  void asl_zp()
  {
  }

  void php()
  {
  }
}

void main(){}
