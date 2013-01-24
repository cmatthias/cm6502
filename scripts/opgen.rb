#!/usr/bin/env ruby

require 'csv'

opcodes = []
insts = {}
addr_modes = {}
CSV.foreach('data/opcodes.csv', :headers => true) do |row|
  opcodes[row[0].hex] = { :inst => row[1], :addr => row[2], :b => row[3].to_i, :cyc => row[4].to_i, :spec => row[5] == 'true'}
  insts[row[1]] = true
  addr_modes[row[2]] = true
end

File.open('interfaces_autogen.d','w') do |dfile|
  dfile.puts <<Q
interface I6502
{
  enum AddrMode
  {
    #{addr_modes.keys.join(", ")}
  }

  static AddrMode[256] addr_modes = [
    #{opcodes.map{|opc| ("AddrMode." + opc[:addr]) rescue "AddrMode.imp"}.join(", ")}
  ];
  
static byte[256] data_lengths = [
    #{opcodes.map{|opc| opc[:b] rescue 0}.join(", ")}
  ];

Q
  insts.each_key do |inst|
    dfile.puts "  void _#{inst}(AddrMode mode, int data);"
  end

  dfile.puts "}"

  dfile.puts <<Q
abstract class C6502 : I6502
{
  void delegate(AddrMode, int)[256] ops;

  this()
  {
    ops = [
Q

  #    #{opcodes.map{|opc| ("function(int data){ _"+ opc[:inst] + 
   #      "(AddrMode." + opc[:addr] + ", data); }") rescue "function(int data){}"}.join(",\n      ")}
  dfile.puts <<Q
      #{opcodes.map{|opc| ("&_"+ opc[:inst]) rescue "&_nop" }.join(",\n      ")}
    ];
  }
}
Q
end

