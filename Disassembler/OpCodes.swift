//
//  OpCodePrototypes.swift
//  Disassembler
//
//  Created by Jacques Légaré on 2020-03-13.
//  Copyright © 2020 Jacques Legare. All rights reserved.
//

import Foundation

enum ArgumentType {
    case address
    case relative
    case value
    case none
}

typealias AddressingMode = ( size: UInt8, type: ArgumentType, template: String )
typealias OpCodePrototype = ( name: String, mode: AddressingMode )

let defaultAddressingModes: [ String: AddressingMode ] = [ "absolute" :    ( size: 3, type: .address,  template: "%@" ),
                                                           "absoluteX" :   ( size: 3, type: .address,  template: "%@,X" ),
                                                           "absoluteY" :   ( size: 3, type: .address,  template: "%@,Y" ),
                                                           "accumulator" : ( size: 1, type: .none,     template: "" ),
                                                           "immediate" :   ( size: 2, type: .value,    template: "#$%02x" ),
                                                           "implied" :     ( size: 1, type: .none,     template: "" ),
                                                           "indirect" :    ( size: 3, type: .address,  template: "(%@)" ),
                                                           "indirectX" :   ( size: 2, type: .address,  template: "(%@,X)" ),
                                                           "indirectY" :   ( size: 2, type: .address,  template: "(%@),Y" ),
                                                           "relative" :    ( size: 3, type: .relative, template: "%@" ),
                                                           "zeroPage" :    ( size: 2, type: .address,  template: "%@" ),
                                                           "zeroPageX" :   ( size: 2, type: .address,  template: "%@" ),
                                                           "zeroPageY" :   ( size: 2, type: .address,  template: "%@" ), ]

let defaultOpCodePrototypes: [ UInt8 : OpCodePrototype ] = [ 0x00 : ( name: "BRK", mode: defaultAddressingModes["implied"]! ),
                                                             0x01 : ( name: "ORA", mode: defaultAddressingModes["indirectX"]! ),
                                                             0x05 : ( name: "ORA", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x06 : ( name: "ASL", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x08 : ( name: "PHP", mode: defaultAddressingModes["implied"]! ),
                                                             0x09 : ( name: "ORA", mode: defaultAddressingModes["immediate"]! ),
                                                             0x0a : ( name: "ASL", mode: defaultAddressingModes["accumulator"]! ),
                                                             0x0d : ( name: "ORA", mode: defaultAddressingModes["absolute"]! ),
                                                             0x0e : ( name: "ASL", mode: defaultAddressingModes["absolute"]! ),
                                                             0x10 : ( name: "BPL", mode: defaultAddressingModes["relative"]! ),
                                                             0x11 : ( name: "ORA", mode: defaultAddressingModes["indirectY"]! ),
                                                             0x15 : ( name: "ORA", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x16 : ( name: "ASL", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x18 : ( name: "CLC", mode: defaultAddressingModes["implied"]! ),
                                                             0x19 : ( name: "ORA", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0x1d : ( name: "ORA", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x1e : ( name: "ASL", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x20 : ( name: "JSR", mode: defaultAddressingModes["absolute"]! ),
                                                             0x21 : ( name: "AND", mode: defaultAddressingModes["indirectX"]! ),
                                                             0x24 : ( name: "BIT", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x25 : ( name: "AND", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x26 : ( name: "ROL", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x28 : ( name: "PLP", mode: defaultAddressingModes["implied"]! ),
                                                             0x29 : ( name: "AND", mode: defaultAddressingModes["immediate"]! ),
                                                             0x2a : ( name: "ROL", mode: defaultAddressingModes["accumulator"]! ),
                                                             0x2c : ( name: "BIT", mode: defaultAddressingModes["absolute"]! ),
                                                             0x2d : ( name: "AND", mode: defaultAddressingModes["absolute"]! ),
                                                             0x2e : ( name: "ROL", mode: defaultAddressingModes["absolute"]! ),
                                                             0x30 : ( name: "BMI", mode: defaultAddressingModes["relative"]! ),
                                                             0x31 : ( name: "AND", mode: defaultAddressingModes["indirectY"]! ),
                                                             0x35 : ( name: "AND", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x36 : ( name: "ROL", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x38 : ( name: "SEC", mode: defaultAddressingModes["implied"]! ),
                                                             0x39 : ( name: "AND", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0x3d : ( name: "AND", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x3e : ( name: "ROL", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x40 : ( name: "RTI", mode: defaultAddressingModes["implied"]! ),
                                                             0x41 : ( name: "EOR", mode: defaultAddressingModes["indirectX"]! ),
                                                             0x45 : ( name: "EOR", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x46 : ( name: "LSR", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x48 : ( name: "PHA", mode: defaultAddressingModes["implied"]! ),
                                                             0x49 : ( name: "EOR", mode: defaultAddressingModes["immediate"]! ),
                                                             0x4a : ( name: "LSR", mode: defaultAddressingModes["accumulator"]! ),
                                                             0x4c : ( name: "JMP", mode: defaultAddressingModes["absolute"]! ),
                                                             0x4d : ( name: "EOR", mode: defaultAddressingModes["absolute"]! ),
                                                             0x4e : ( name: "LSR", mode: defaultAddressingModes["absolute"]! ),
                                                             0x50 : ( name: "BVC", mode: defaultAddressingModes["relative"]! ),
                                                             0x51 : ( name: "EOR", mode: defaultAddressingModes["indirectY"]! ),
                                                             0x55 : ( name: "EOR", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x56 : ( name: "LSR", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x58 : ( name: "CLI", mode: defaultAddressingModes["implied"]! ),
                                                             0x59 : ( name: "EOR", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0x5d : ( name: "EOR", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x5e : ( name: "LSR", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x60 : ( name: "RTS", mode: defaultAddressingModes["implied"]! ),
                                                             0x61 : ( name: "ADC", mode: defaultAddressingModes["indirectX"]! ),
                                                             0x65 : ( name: "ADC", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x66 : ( name: "ROR", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x68 : ( name: "PLA", mode: defaultAddressingModes["implied"]! ),
                                                             0x69 : ( name: "ADC", mode: defaultAddressingModes["immediate"]! ),
                                                             0x6a : ( name: "ROR", mode: defaultAddressingModes["accumulator"]! ),
                                                             0x6c : ( name: "JMP", mode: defaultAddressingModes["indirect"]! ),
                                                             0x6d : ( name: "ADC", mode: defaultAddressingModes["absolute"]! ),
                                                             0x6e : ( name: "ROR", mode: defaultAddressingModes["absolute"]! ),
                                                             0x70 : ( name: "BVS", mode: defaultAddressingModes["relative"]! ),
                                                             0x71 : ( name: "ADC", mode: defaultAddressingModes["indirectY"]! ),
                                                             0x75 : ( name: "ADC", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x76 : ( name: "ROR", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x78 : ( name: "SEI", mode: defaultAddressingModes["implied"]! ),
                                                             0x79 : ( name: "ADC", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0x7d : ( name: "ADC", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x7e : ( name: "ROR", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0x81 : ( name: "STA", mode: defaultAddressingModes["indirectX"]! ),
                                                             0x84 : ( name: "STY", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x85 : ( name: "STA", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x86 : ( name: "STX", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0x88 : ( name: "DEY", mode: defaultAddressingModes["implied"]! ),
                                                             0x8a : ( name: "TXA", mode: defaultAddressingModes["implied"]! ),
                                                             0x8c : ( name: "STY", mode: defaultAddressingModes["absolute"]! ),
                                                             0x8d : ( name: "STA", mode: defaultAddressingModes["absolute"]! ),
                                                             0x8e : ( name: "STX", mode: defaultAddressingModes["absolute"]! ),
                                                             0x90 : ( name: "BCC", mode: defaultAddressingModes["relative"]! ),
                                                             0x91 : ( name: "STA", mode: defaultAddressingModes["indirectY"]! ),
                                                             0x94 : ( name: "STY", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x95 : ( name: "STA", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0x96 : ( name: "STX", mode: defaultAddressingModes["zeroPageY"]! ),
                                                             0x98 : ( name: "TYA", mode: defaultAddressingModes["implied"]! ),
                                                             0x99 : ( name: "STA", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0x9a : ( name: "TXS", mode: defaultAddressingModes["implied"]! ),
                                                             0x9d : ( name: "STA", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xa0 : ( name: "LDY", mode: defaultAddressingModes["immediate"]! ),
                                                             0xa1 : ( name: "LDA", mode: defaultAddressingModes["indirectX"]! ),
                                                             0xa2 : ( name: "LDX", mode: defaultAddressingModes["immediate"]! ),
                                                             0xa4 : ( name: "LDY", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xa5 : ( name: "LDA", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xa6 : ( name: "LDX", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xa8 : ( name: "TAY", mode: defaultAddressingModes["implied"]! ),
                                                             0xa9 : ( name: "LDA", mode: defaultAddressingModes["immediate"]! ),
                                                             0xaa : ( name: "TAX", mode: defaultAddressingModes["implied"]! ),
                                                             0xac : ( name: "LDY", mode: defaultAddressingModes["absolute"]! ),
                                                             0xad : ( name: "LDA", mode: defaultAddressingModes["absolute"]! ),
                                                             0xae : ( name: "LDX", mode: defaultAddressingModes["absolute"]! ),
                                                             0xb0 : ( name: "BCS", mode: defaultAddressingModes["relative"]! ),
                                                             0xb1 : ( name: "LDA", mode: defaultAddressingModes["indirectY"]! ),
                                                             0xb4 : ( name: "LDY", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xb5 : ( name: "LDA", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xb6 : ( name: "LDX", mode: defaultAddressingModes["zeroPageY"]! ),
                                                             0xb8 : ( name: "CLV", mode: defaultAddressingModes["implied"]! ),
                                                             0xb9 : ( name: "LDA", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0xba : ( name: "TSX", mode: defaultAddressingModes["implied"]! ),
                                                             0xbc : ( name: "LDY", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xbd : ( name: "LDA", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xbe : ( name: "LDX", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0xc0 : ( name: "CPY", mode: defaultAddressingModes["immediate"]! ),
                                                             0xc1 : ( name: "CMP", mode: defaultAddressingModes["indirectX"]! ),
                                                             0xc4 : ( name: "CPY", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xc5 : ( name: "CMP", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xc6 : ( name: "DEC", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xc8 : ( name: "INY", mode: defaultAddressingModes["implied"]! ),
                                                             0xc9 : ( name: "CMP", mode: defaultAddressingModes["immediate"]! ),
                                                             0xca : ( name: "DEX", mode: defaultAddressingModes["implied"]! ),
                                                             0xcc : ( name: "CPY", mode: defaultAddressingModes["absolute"]! ),
                                                             0xcd : ( name: "CMP", mode: defaultAddressingModes["absolute"]! ),
                                                             0xce : ( name: "DEC", mode: defaultAddressingModes["absolute"]! ),
                                                             0xd0 : ( name: "BNE", mode: defaultAddressingModes["relative"]! ),
                                                             0xd1 : ( name: "CMP", mode: defaultAddressingModes["indirectY"]! ),
                                                             0xd5 : ( name: "CMP", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xd6 : ( name: "DEC", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xd8 : ( name: "CLD", mode: defaultAddressingModes["implied"]! ),
                                                             0xd9 : ( name: "CMP", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0xdd : ( name: "CMP", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xde : ( name: "DEC", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xe0 : ( name: "CPX", mode: defaultAddressingModes["immediate"]! ),
                                                             0xe1 : ( name: "SBC", mode: defaultAddressingModes["indirectX"]! ),
                                                             0xe4 : ( name: "CPX", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xe5 : ( name: "SBC", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xe6 : ( name: "INC", mode: defaultAddressingModes["zeroPage"]! ),
                                                             0xe8 : ( name: "INX", mode: defaultAddressingModes["implied"]! ),
                                                             0xe9 : ( name: "SBC", mode: defaultAddressingModes["immediate"]! ),
                                                             0xea : ( name: "NOP", mode: defaultAddressingModes["implied"]! ),
                                                             0xec : ( name: "CPX", mode: defaultAddressingModes["absolute"]! ),
                                                             0xed : ( name: "SBC", mode: defaultAddressingModes["absolute"]! ),
                                                             0xee : ( name: "INC", mode: defaultAddressingModes["absolute"]! ),
                                                             0xf0 : ( name: "BEQ", mode: defaultAddressingModes["relative"]! ),
                                                             0xf1 : ( name: "SBC", mode: defaultAddressingModes["indirectY"]! ),
                                                             0xf5 : ( name: "SBC", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xf6 : ( name: "INC", mode: defaultAddressingModes["zeroPageX"]! ),
                                                             0xf8 : ( name: "SED", mode: defaultAddressingModes["implied"]! ),
                                                             0xf9 : ( name: "SBC", mode: defaultAddressingModes["absoluteY"]! ),
                                                             0xfd : ( name: "SBC", mode: defaultAddressingModes["absoluteX"]! ),
                                                             0xfe : ( name: "INC", mode: defaultAddressingModes["absoluteX"]! ), ]

func loadOpCodePrototypes(addressingModes addressingModesFileName: String?,
                          opCodePrototypes opCodePrototypesFileName: String?,
                          errorsTo errorStream: inout FileHandleOutputStream) throws -> [ UInt8 : OpCodePrototype ] {
    var addressingModes = [ String: AddressingMode ]()
    
    if addressingModesFileName != nil {
        try onEachLine(of: addressingModesFileName!) { number, line in
            let fields = line.split(separator: " ")
            
            guard fields.count >= 3 else {
                errorStream.writeln("Unable to parse line \(number + 1) of \(addressingModesFileName!).")
                return
            }
            
            guard let size = UInt8(String(fields[1])) else {
                errorStream.writeln("Unable to parse \(fields[1]) as an integer, on line \(number + 1) of \(addressingModesFileName!).")
                return
            }
            
            var type: ArgumentType {
                switch fields[2] {
                case "relative":
                    return .relative
                    
                case "value":
                    return .value
                    
                case "none":
                    return .none
                    
                default:
                    return .address
                }
            }
            
            var template: String {
                if fields.count >= 4 {
                    return String(fields[3])
                } else {
                    return ""
                }
            }
            
            addressingModes[String(fields[0])] = ( size: size, type: type, template: template )
        }
    } else {
        addressingModes = defaultAddressingModes
    }
    
    if opCodePrototypesFileName != nil {
        var opCodePrototypes = [ UInt8 : OpCodePrototype ]()
        var currentOpCode: String? = nil

        try onEachLine(of: opCodePrototypesFileName!) { number, line in
            func parseOpCodePrototype(_ line: String, continuation: (_ id: UInt8, _ name: String, _ addressingMode: String) -> ()) {
                let fields = line.split(separator: " ")
                
                if line.hasPrefix(" ") {
                    guard currentOpCode != nil else {
                        errorStream.writeln("No current op-code on line \(number + 1) of \(opCodePrototypesFileName!).")
                        return
                    }
                    
                    guard fields.count >= 2 else {
                        errorStream.writeln("Unable to parse line \(number + 1) of \(opCodePrototypesFileName!).")
                        return
                    }
                    
                    guard let id = fromHex(value: String(fields[0])) else {
                        return
                    }
                    
                    continuation(id, currentOpCode!, String(fields[1]))
                } else {
                    guard fields.count >= 3 else {
                        errorStream.writeln("Unable to parse line \(number + 1) of \(opCodePrototypesFileName!).")
                        return
                    }
                    
                    guard let id = fromHex(value: String(fields[1])) else {
                        return
                    }
                    
                    currentOpCode = String(fields[0])
                    
                    continuation(id, currentOpCode!, String(fields[2]))
                }
            }
            
            parseOpCodePrototype(line) { id, name, addressingMode in
                opCodePrototypes[id] = ( name: name, mode: addressingModes[addressingMode]! )
            }
        }
        return opCodePrototypes
    } else {
        return defaultOpCodePrototypes
    }
}

enum OpCode {
    case opCode(id: UInt8, name: String, mode: AddressingMode, arguments: [UInt8])
    case none(value: [UInt8])
}
