module cpu;

import interfaces;

class CPU : C6502
{
  short pc;
  byte sp;
  byte a;
  byte x;
  byte y;
  byte sr;

  this()
  {
    super();
  }

  void _brk(AddrMode mode, int data){}
  void _ora(AddrMode mode, int data){}
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

void main(){}
