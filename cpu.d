module cpu;

import interfaces;
import std.stdio;
import core.time;

class SimpleMMU : MMU
{
  ubyte[] mem;

  this(ushort mem_size)
  {
    mem.length = mem_size;
    mem[] = 0;
  }

  ubyte read(ushort addr)
  {
    return mem[addr];
  }

  void write(ushort addr, ubyte val)
  {
    mem[addr] = val;
  }

  void write(ushort addr, ubyte[] val)
  {
    foreach (ubyte b; val)
    {
      write(addr++, b);
    }
  }
}

class CPU : C6502
{
  ushort pc;
  ubyte sp;
  ubyte a;
  ubyte x;
  ubyte y;
  ubyte sr;

  MMU mmu;

  bool running;
  ulong ticks;
  long sys_ticks;

  this(MMU m)
  {
    super();
    mmu = m;
    pc = 0;
    sp = 0;
    a = 0;
    x = 0;
    y = 0;
    sr = 0;
    running = false;
    ticks = 0L;
    sys_ticks = TickDuration.appOrigin.nsecs();
  }

  void run()
  {
    running = true;
    writefln("started at %d (%d ticks/sec)", sys_ticks, TickDuration.ticksPerSec);
    while(running)
    {
      byte op = mmu.read(pc);
      int data = 0;
      int data_length = data_lengths[op];
      for (int i = 0; i < data_length; i++)
      {
        data += (mmu.read(cast(short)(pc+i)) << 8*i);
      }
      ops[op](addr_modes[op], data);
      pc += data_length;
    }
  }

  void _brk(AddrMode mode, int data)
  {
    running = false;
  }
  void _ora(AddrMode mode, int data)
  {
    auto tick = TickDuration.currSystemTick.nsecs();
    writefln("_ora was called with data 0x%08X at offset %d", data, tick - sys_ticks);
  }
  void _asl(AddrMode mode, int data){}
  void _php(AddrMode mode, int data){}
  void _bpl(AddrMode mode, int data){}
  void _clc(AddrMode mode, int data){}
  void _jsr(AddrMode mode, int data){}
  void _and(AddrMode mode, int data){}
  void _bit(AddrMode mode, int data){}
  void _rol(AddrMode mode, int data){}
  void _plp(AddrMode mode, int data){}
  void _bmi(AddrMode mode, int data){}
  void _sec(AddrMode mode, int data){}
  void _rti(AddrMode mode, int data){}
  void _eor(AddrMode mode, int data){}
  void _lsr(AddrMode mode, int data){}
  void _pha(AddrMode mode, int data){}
  void _jmp(AddrMode mode, int data){}
  void _bvc(AddrMode mode, int data){}
  void _cli(AddrMode mode, int data){}
  void _rts(AddrMode mode, int data){}
  void _adc(AddrMode mode, int data){}
  void _ror(AddrMode mode, int data){}
  void _pla(AddrMode mode, int data){}
  void _bvs(AddrMode mode, int data){}
  void _sei(AddrMode mode, int data){}
  void _sta(AddrMode mode, int data){}
  void _sty(AddrMode mode, int data){}
  void _stx(AddrMode mode, int data){}
  void _dey(AddrMode mode, int data){}
  void _txa(AddrMode mode, int data){}
  void _bcc(AddrMode mode, int data){}
  void _tya(AddrMode mode, int data){}
  void _txs(AddrMode mode, int data){}
  void _ldy(AddrMode mode, int data){}
  void _lda(AddrMode mode, int data){}
  void _ldx(AddrMode mode, int data){}
  void _tay(AddrMode mode, int data){}
  void _tax(AddrMode mode, int data){}
  void _bcs(AddrMode mode, int data){}
  void _clv(AddrMode mode, int data){}
  void _tsx(AddrMode mode, int data){}
  void _cpy(AddrMode mode, int data){}
  void _cmp(AddrMode mode, int data){}
  void _dec(AddrMode mode, int data){}
  void _iny(AddrMode mode, int data){}
  void _dex(AddrMode mode, int data){}
  void _bne(AddrMode mode, int data){}
  void _cld(AddrMode mode, int data){}
  void _cpx(AddrMode mode, int data){}
  void _sbc(AddrMode mode, int data){}
  void _inc(AddrMode mode, int data){}
  void _inx(AddrMode mode, int data){}
  void _nop(AddrMode mode, int data){}
  void _beq(AddrMode mode, int data){}
  void _sed(AddrMode mode, int data){}
}

void main()
{
  SimpleMMU mmu = new SimpleMMU(4096);

  mmu.write(0x00, [0x01, 0x02, 0x01, 0x04, 0x01, 0x06, 0x01, 0x08]);
  CPU cpu = new CPU(mmu);

  cpu.run();
}
