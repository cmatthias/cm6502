interface I6502
{
  enum AddrMode
  {
    imp, idx, zp, imm, acc, abs, rel, idy, zpx, aby, abx, ind, zpy
  }

  static AddrMode[256] addr_modes = [
    AddrMode.imp, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.acc, AddrMode.imp, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.imp, AddrMode.abs, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.acc, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.imp, AddrMode.imp, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.acc, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.imp, AddrMode.imp, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.acc, AddrMode.imp, AddrMode.ind, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.imp, AddrMode.imp, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.zpy, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.idx, AddrMode.imm, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.imp, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.zpy, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.aby, AddrMode.imp, AddrMode.imm, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.imp, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx, AddrMode.imp, AddrMode.imm, AddrMode.idx, AddrMode.imp, AddrMode.imp, AddrMode.zp, AddrMode.zp, AddrMode.zp, AddrMode.imp, AddrMode.imp, AddrMode.imm, AddrMode.imp, AddrMode.imp, AddrMode.abs, AddrMode.abs, AddrMode.abs, AddrMode.imp, AddrMode.rel, AddrMode.idy, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.zpx, AddrMode.zpx, AddrMode.imp, AddrMode.imp, AddrMode.aby, AddrMode.imp, AddrMode.imp, AddrMode.imp, AddrMode.abx, AddrMode.abx
  ];
  
static byte[256] data_lengths = [
    1, 2, 0, 0, 0, 2, 2, 0, 1, 2, 1, 0, 0, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3, 0, 3, 2, 0, 0, 2, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3, 0, 1, 2, 0, 0, 0, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3, 0, 1, 2, 0, 0, 0, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3, 0, 0, 2, 0, 0, 2, 2, 2, 0, 1, 0, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 2, 2, 2, 0, 1, 3, 1, 0, 0, 3, 0, 0, 2, 2, 2, 0, 2, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 2, 2, 2, 0, 1, 3, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 2, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3, 0, 2, 2, 0, 0, 2, 2, 2, 0, 1, 2, 1, 0, 3, 3, 3, 0, 2, 2, 0, 0, 0, 2, 2, 0, 1, 3, 0, 0, 0, 3, 3
  ];

  void _brk(AddrMode mode, int data);
  void _ora(AddrMode mode, int data);
  void _asl(AddrMode mode, int data);
  void _php(AddrMode mode, int data);
  void _bpl(AddrMode mode, int data);
  void _clc(AddrMode mode, int data);
  void _jsr(AddrMode mode, int data);
  void _and(AddrMode mode, int data);
  void _bit(AddrMode mode, int data);
  void _rol(AddrMode mode, int data);
  void _plp(AddrMode mode, int data);
  void _bmi(AddrMode mode, int data);
  void _sec(AddrMode mode, int data);
  void _rti(AddrMode mode, int data);
  void _eor(AddrMode mode, int data);
  void _lsr(AddrMode mode, int data);
  void _pha(AddrMode mode, int data);
  void _jmp(AddrMode mode, int data);
  void _bvc(AddrMode mode, int data);
  void _cli(AddrMode mode, int data);
  void _rts(AddrMode mode, int data);
  void _adc(AddrMode mode, int data);
  void _ror(AddrMode mode, int data);
  void _pla(AddrMode mode, int data);
  void _bvs(AddrMode mode, int data);
  void _sei(AddrMode mode, int data);
  void _sta(AddrMode mode, int data);
  void _sty(AddrMode mode, int data);
  void _stx(AddrMode mode, int data);
  void _dey(AddrMode mode, int data);
  void _txa(AddrMode mode, int data);
  void _bcc(AddrMode mode, int data);
  void _tya(AddrMode mode, int data);
  void _txs(AddrMode mode, int data);
  void _ldy(AddrMode mode, int data);
  void _lda(AddrMode mode, int data);
  void _ldx(AddrMode mode, int data);
  void _tay(AddrMode mode, int data);
  void _tax(AddrMode mode, int data);
  void _bcs(AddrMode mode, int data);
  void _clv(AddrMode mode, int data);
  void _tsx(AddrMode mode, int data);
  void _cpy(AddrMode mode, int data);
  void _cmp(AddrMode mode, int data);
  void _dec(AddrMode mode, int data);
  void _iny(AddrMode mode, int data);
  void _dex(AddrMode mode, int data);
  void _bne(AddrMode mode, int data);
  void _cld(AddrMode mode, int data);
  void _cpx(AddrMode mode, int data);
  void _sbc(AddrMode mode, int data);
  void _inc(AddrMode mode, int data);
  void _inx(AddrMode mode, int data);
  void _nop(AddrMode mode, int data);
  void _beq(AddrMode mode, int data);
  void _sed(AddrMode mode, int data);
}
abstract class C6502 : I6502
{
  void delegate(AddrMode, int)[256] ops;

  this()
  {
    ops = [
      &_brk,
      &_ora,
      &_nop,
      &_nop,
      &_nop,
      &_ora,
      &_asl,
      &_nop,
      &_php,
      &_ora,
      &_asl,
      &_nop,
      &_nop,
      &_ora,
      &_asl,
      &_nop,
      &_bpl,
      &_ora,
      &_nop,
      &_nop,
      &_nop,
      &_ora,
      &_asl,
      &_nop,
      &_clc,
      &_ora,
      &_nop,
      &_nop,
      &_nop,
      &_ora,
      &_asl,
      &_nop,
      &_jsr,
      &_and,
      &_nop,
      &_nop,
      &_bit,
      &_and,
      &_rol,
      &_nop,
      &_plp,
      &_and,
      &_rol,
      &_nop,
      &_bit,
      &_and,
      &_rol,
      &_nop,
      &_bmi,
      &_and,
      &_nop,
      &_nop,
      &_nop,
      &_and,
      &_rol,
      &_nop,
      &_sec,
      &_and,
      &_nop,
      &_nop,
      &_nop,
      &_and,
      &_rol,
      &_nop,
      &_rti,
      &_eor,
      &_nop,
      &_nop,
      &_nop,
      &_eor,
      &_lsr,
      &_nop,
      &_pha,
      &_eor,
      &_lsr,
      &_nop,
      &_jmp,
      &_eor,
      &_lsr,
      &_nop,
      &_bvc,
      &_eor,
      &_nop,
      &_nop,
      &_nop,
      &_eor,
      &_lsr,
      &_nop,
      &_cli,
      &_eor,
      &_nop,
      &_nop,
      &_nop,
      &_eor,
      &_lsr,
      &_nop,
      &_rts,
      &_adc,
      &_nop,
      &_nop,
      &_nop,
      &_adc,
      &_ror,
      &_nop,
      &_pla,
      &_adc,
      &_ror,
      &_nop,
      &_jmp,
      &_adc,
      &_ror,
      &_nop,
      &_bvs,
      &_adc,
      &_nop,
      &_nop,
      &_nop,
      &_adc,
      &_ror,
      &_nop,
      &_sei,
      &_adc,
      &_nop,
      &_nop,
      &_nop,
      &_adc,
      &_ror,
      &_nop,
      &_nop,
      &_sta,
      &_nop,
      &_nop,
      &_sty,
      &_sta,
      &_stx,
      &_nop,
      &_dey,
      &_nop,
      &_txa,
      &_nop,
      &_sty,
      &_sta,
      &_stx,
      &_nop,
      &_bcc,
      &_sta,
      &_nop,
      &_nop,
      &_sty,
      &_sta,
      &_stx,
      &_nop,
      &_tya,
      &_sta,
      &_txs,
      &_nop,
      &_nop,
      &_sta,
      &_nop,
      &_nop,
      &_ldy,
      &_lda,
      &_ldx,
      &_nop,
      &_ldy,
      &_lda,
      &_ldx,
      &_nop,
      &_tay,
      &_lda,
      &_tax,
      &_nop,
      &_ldy,
      &_lda,
      &_ldx,
      &_nop,
      &_bcs,
      &_lda,
      &_nop,
      &_nop,
      &_ldy,
      &_lda,
      &_ldx,
      &_nop,
      &_clv,
      &_lda,
      &_tsx,
      &_nop,
      &_ldy,
      &_lda,
      &_ldx,
      &_nop,
      &_cpy,
      &_cmp,
      &_nop,
      &_nop,
      &_cpy,
      &_cmp,
      &_dec,
      &_nop,
      &_iny,
      &_cmp,
      &_dex,
      &_nop,
      &_cpy,
      &_cmp,
      &_dec,
      &_nop,
      &_bne,
      &_cmp,
      &_nop,
      &_nop,
      &_nop,
      &_cmp,
      &_dec,
      &_nop,
      &_cld,
      &_cmp,
      &_nop,
      &_nop,
      &_nop,
      &_cmp,
      &_dec,
      &_nop,
      &_cpx,
      &_sbc,
      &_nop,
      &_nop,
      &_cpx,
      &_sbc,
      &_inc,
      &_nop,
      &_inx,
      &_sbc,
      &_nop,
      &_nop,
      &_cpx,
      &_sbc,
      &_inc,
      &_nop,
      &_beq,
      &_sbc,
      &_nop,
      &_nop,
      &_nop,
      &_sbc,
      &_inc,
      &_nop,
      &_sed,
      &_sbc,
      &_nop,
      &_nop,
      &_nop,
      &_sbc,
      &_inc
    ];
  }
}
