/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140724-64 [Jul 24 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of ./DSDT/raw/SSDT-12.aml, Mon Aug  4 20:44:58 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000D33 (3379)
 *     Revision         0x01
 *     Checksum         0x70
 *     OEM ID           "SgRef"
 *     OEM Table ID     "SgPeg"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("./DSDT/raw/SSDT-12.aml", "SSDT", 1, "SgRef", "SgPeg", 0x00001000)
{

    External (_SB_.PCI0.GFX0._DOD, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD01._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD01._DGS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._ADR, IntObj)
    External (EECP, FieldUnitObj)
    External (GPRW, MethodObj)    // 2 Arguments
    External (NVP2, PowerResObj)
    External (NVP3, PowerResObj)
    External (OFSG, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (XBAS, FieldUnitObj)

    Scope (\_SB.PCI0.PEG0)
    {
        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            NVP3
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            NVP2
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            NVP3
        })
        OperationRegion (RPCI, SystemMemory, 0xF8008000, 0x0E00)
        Field (RPCI, DWordAcc, Lock, Preserve)
        {
            Offset (0x04), 
            NVME,   2, 
            Offset (0x84), 
            NVPM,   2, 
            Offset (0xAC), 
                ,   4, 
            CMLW,   6, 
            Offset (0xB0), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1, 
            RTLK,   1, 
            Offset (0x214), 
            Offset (0x216), 
            LNKS,   4, 
            Offset (0x504), 
            Offset (0x506), 
            PCFG,   2, 
            Offset (0x508), 
            TREN,   1, 
            Offset (0xC20), 
                ,   4, 
            AFES,   2, 
            Offset (0xD0C), 
                ,   20, 
            LREV,   1
        }

        Method (RBP0, 1, NotSerialized)
        {
            Store (Add (Add (\XBAS, 0x8000), Arg0), Local7)
            OperationRegion (PCI0, SystemMemory, Local7, One)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   8
            }

            Return (TEMP) /* \_SB_.PCI0.PEG0.RBP0.TEMP */
        }

        Method (WBP0, 2, NotSerialized)
        {
            Store (Add (Add (\XBAS, 0x8000), Arg0), Local7)
            OperationRegion (PCI0, SystemMemory, Local7, One)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   8
            }

            Store (Arg1, TEMP) /* \_SB_.PCI0.PEG0.WBP0.TEMP */
            Return (TEMP) /* \_SB_.PCI0.PEG0.WBP0.TEMP */
        }

        Method (BSPR, 2, NotSerialized)
        {
            Store (Add (Add (Add (\XBAS, 0x8000), 0x091C), Multiply (
                Arg0, 0x20)), Local7)
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, DWordAcc, NoLock, Preserve)
            {
                    ,   31, 
                TEMP,   1
            }

            Store (Arg1, TEMP) /* \_SB_.PCI0.PEG0.BSPR.TEMP */
        }

        Method (C7OK, 1, NotSerialized)
        {
            OperationRegion (MWHB, SystemMemory, \XBAS, 0x1000)
            Field (MWHB, DWordAcc, NoLock, Preserve)
            {
                Offset (0x48), 
                MHEN,   1, 
                    ,   14, 
                MHBR,   17
            }

            OperationRegion (MBAR, SystemMemory, Add (ShiftLeft (MHBR, 0x0F), 0x5000), 0x1000)
            Field (MBAR, ByteAcc, NoLock, Preserve)
            {
                Offset (0xDA8), 
                    ,   2, 
                C7AD,   1
            }

            Store (Arg0, C7AD) /* \_SB_.PCI0.PEG0.C7OK.C7AD */
        }

        Device (PEGA)
        {
            Name (_ADR, One)  // _ADR: Address
            OperationRegion (ACAP, PCI_Config, \EECP, 0x14)
            Field (ACAP, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                LCT1,   16
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x09, 0x04))
            }
        }
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (HVID, Zero)
        Name (HDID, Zero)
        Name (FBDL, Zero)
        Name (MBDL, Zero)
        Name (CBDL, Zero)
        Name (HSTR, Zero)
        Name (UULN, Zero)
        Name (INDX, Zero)
        Name (POFF, Zero)
        Name (PLEN, Zero)
        Name (PDAT, Zero)
        Name (WLSB, Zero)
        Name (WMSB, Zero)
        Name (DMLW, Zero)
        Name (DAT0, Buffer (0x04EC)
        {
            /* 0000 */  0xD8, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0008 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x09,  /* ........ */
            /* 0010 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x04,  /* ........ */
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x0C, 0x09, 0x04, 0x00,  /* ........ */
            /* 0020 */  0x00, 0x00, 0x00, 0x10, 0x09, 0x04, 0x00, 0x00,  /* ........ */
            /* 0028 */  0x00, 0x00, 0x0C, 0x08, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0030 */  0x00, 0x20, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* . ...... */
            /* 0038 */  0x24, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x28,  /* $......( */
            /* 0040 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x09,  /* ......,. */
            /* 0048 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x30, 0x09, 0x04,  /* .....0.. */
            /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x2C, 0x08, 0x04, 0x00,  /* ....,... */
            /* 0058 */  0x00, 0x00, 0x00, 0x40, 0x09, 0x04, 0x00, 0x00,  /* ...@.... */
            /* 0060 */  0x00, 0x00, 0x44, 0x09, 0x04, 0x00, 0x00, 0x00,  /* ..D..... */
            /* 0068 */  0x00, 0x48, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .H...... */
            /* 0070 */  0x4C, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x50,  /* L......P */
            /* 0078 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x08,  /* ......L. */
            /* 0080 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x09, 0x04,  /* .....`.. */
            /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x64, 0x09, 0x04, 0x00,  /* ....d... */
            /* 0090 */  0x00, 0x00, 0x00, 0x68, 0x09, 0x04, 0x00, 0x00,  /* ...h.... */
            /* 0098 */  0x00, 0x00, 0x6C, 0x09, 0x04, 0x00, 0x00, 0x00,  /* ..l..... */
            /* 00A0 */  0x00, 0x70, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .p...... */
            /* 00A8 */  0x6C, 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x80,  /* l....... */
            /* 00B0 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x84, 0x09,  /* ........ */
            /* 00B8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x88, 0x09, 0x04,  /* ........ */
            /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x8C, 0x09, 0x04, 0x00,  /* ........ */
            /* 00C8 */  0x00, 0x00, 0x00, 0x90, 0x09, 0x04, 0x00, 0x00,  /* ........ */
            /* 00D0 */  0x00, 0x00, 0x8C, 0x08, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 00D8 */  0x00, 0xA0, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00E0 */  0xA4, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xA8,  /* ........ */
            /* 00E8 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xAC, 0x09,  /* ........ */
            /* 00F0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x09, 0x04,  /* ........ */
            /* 00F8 */  0x00, 0x00, 0x00, 0x00, 0xAC, 0x08, 0x04, 0x00,  /* ........ */
            /* 0100 */  0x00, 0x00, 0x00, 0xC0, 0x09, 0x04, 0x00, 0x00,  /* ........ */
            /* 0108 */  0x00, 0x00, 0xC4, 0x09, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0110 */  0x00, 0xC8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0118 */  0xCC, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0,  /* ........ */
            /* 0120 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x08,  /* ........ */
            /* 0128 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x09, 0x04,  /* ........ */
            /* 0130 */  0x00, 0x00, 0x00, 0x00, 0xE4, 0x09, 0x04, 0x00,  /* ........ */
            /* 0138 */  0x00, 0x00, 0x00, 0xE8, 0x09, 0x04, 0x00, 0x00,  /* ........ */
            /* 0140 */  0x00, 0x00, 0xEC, 0x09, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0148 */  0x00, 0xF0, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0150 */  0xEC, 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x30,  /* .......0 */
            /* 0158 */  0x0C, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A,  /* ........ */
            /* 0160 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x0A, 0x04,  /* ........ */
            /* 0168 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x0A, 0x04, 0x00,  /* ........ */
            /* 0170 */  0x00, 0x00, 0x00, 0x0C, 0x0A, 0x04, 0x00, 0x00,  /* ........ */
            /* 0178 */  0x00, 0x00, 0xA0, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0180 */  0x00, 0xA4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0188 */  0xA8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xAC,  /* ........ */
            /* 0190 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x0A,  /* ........ */
            /* 0198 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x0A, 0x04,  /* ........ */
            /* 01A0 */  0x00, 0x00, 0x00, 0x00, 0xB8, 0x0A, 0x04, 0x00,  /* ........ */
            /* 01A8 */  0x00, 0x00, 0x00, 0xBC, 0x0A, 0x04, 0x00, 0x00,  /* ........ */
            /* 01B0 */  0x00, 0x00, 0xC0, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 01B8 */  0x00, 0xC4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 01C0 */  0xC8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC,  /* ........ */
            /* 01C8 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0A,  /* ........ */
            /* 01D0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xD4, 0x0A, 0x04,  /* ........ */
            /* 01D8 */  0x00, 0x00, 0x00, 0x00, 0xD8, 0x0A, 0x04, 0x00,  /* ........ */
            /* 01E0 */  0x00, 0x00, 0x00, 0xDC, 0x0A, 0x04, 0x00, 0x00,  /* ........ */
            /* 01E8 */  0x00, 0x00, 0xE0, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 01F0 */  0x00, 0xE4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 01F8 */  0xE8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xEC,  /* ........ */
            /* 0200 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x0A,  /* ........ */
            /* 0208 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xF4, 0x0A, 0x04,  /* ........ */
            /* 0210 */  0x00, 0x00, 0x00, 0x00, 0xF8, 0x0A, 0x04, 0x00,  /* ........ */
            /* 0218 */  0x00, 0x00, 0x00, 0xFC, 0x0A, 0x04, 0x00, 0x00,  /* ........ */
            /* 0220 */  0x00, 0x00, 0x10, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0228 */  0x00, 0x14, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0230 */  0x18, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x1C,  /* ........ */
            /* 0238 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x20, 0x0A,  /* ...... . */
            /* 0240 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x24, 0x0A, 0x04,  /* .....$.. */
            /* 0248 */  0x00, 0x00, 0x00, 0x00, 0x28, 0x0A, 0x04, 0x00,  /* ....(... */
            /* 0250 */  0x00, 0x00, 0x00, 0x2C, 0x0A, 0x04, 0x00, 0x00,  /* ...,.... */
            /* 0258 */  0x00, 0x00, 0x30, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ..0..... */
            /* 0260 */  0x00, 0x34, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .4...... */
            /* 0268 */  0x38, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x3C,  /* 8......< */
            /* 0270 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x40, 0x0A,  /* ......@. */
            /* 0278 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x0A, 0x04,  /* .....D.. */
            /* 0280 */  0x00, 0x00, 0x00, 0x00, 0x48, 0x0A, 0x04, 0x00,  /* ....H... */
            /* 0288 */  0x00, 0x00, 0x00, 0x4C, 0x0A, 0x04, 0x00, 0x00,  /* ...L.... */
            /* 0290 */  0x00, 0x00, 0x50, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ..P..... */
            /* 0298 */  0x00, 0x54, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .T...... */
            /* 02A0 */  0x58, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C,  /* X......\ */
            /* 02A8 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x0A,  /* ......`. */
            /* 02B0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x64, 0x0A, 0x04,  /* .....d.. */
            /* 02B8 */  0x00, 0x00, 0x00, 0x00, 0x68, 0x0A, 0x04, 0x00,  /* ....h... */
            /* 02C0 */  0x00, 0x00, 0x00, 0x6C, 0x0A, 0x04, 0x00, 0x00,  /* ...l.... */
            /* 02C8 */  0x00, 0x00, 0x70, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ..p..... */
            /* 02D0 */  0x00, 0x74, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .t...... */
            /* 02D8 */  0x78, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x7C,  /* x......| */
            /* 02E0 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0A,  /* ........ */
            /* 02E8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x84, 0x0A, 0x04,  /* ........ */
            /* 02F0 */  0x00, 0x00, 0x00, 0x00, 0x88, 0x0A, 0x04, 0x00,  /* ........ */
            /* 02F8 */  0x00, 0x00, 0x00, 0x8C, 0x0A, 0x04, 0x00, 0x00,  /* ........ */
            /* 0300 */  0x00, 0x00, 0x90, 0x0A, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0308 */  0x00, 0x94, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0310 */  0x98, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x9C,  /* ........ */
            /* 0318 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x18, 0x09,  /* ........ */
            /* 0320 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x38, 0x09, 0x04,  /* .....8.. */
            /* 0328 */  0x00, 0x00, 0x00, 0x00, 0x58, 0x09, 0x04, 0x00,  /* ....X... */
            /* 0330 */  0x00, 0x00, 0x00, 0x78, 0x09, 0x04, 0x00, 0x00,  /* ...x.... */
            /* 0338 */  0x00, 0x00, 0x98, 0x09, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0340 */  0x00, 0xB8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0348 */  0xD8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF8,  /* ........ */
            /* 0350 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x24, 0x02,  /* ......$. */
            /* 0358 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x01, 0x04,  /* ........ */
            /* 0360 */  0x00, 0x00, 0x00, 0x00, 0x60, 0x02, 0x04, 0x00,  /* ....`... */
            /* 0368 */  0x00, 0x00, 0x00, 0x28, 0x0C, 0x04, 0x00, 0x00,  /* ...(.... */
            /* 0370 */  0x00, 0x00, 0x38, 0x0C, 0x04, 0x00, 0x00, 0x00,  /* ..8..... */
            /* 0378 */  0x00, 0x14, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0380 */  0x04, 0x00, 0x02, 0x00, 0x00, 0x0C, 0x00, 0x01,  /* ........ */
            /* 0388 */  0x00, 0x19, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x01,  /* ........ */
            /* 0390 */  0x00, 0x1C, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x01,  /* ........ */
            /* 0398 */  0x00, 0x20, 0x00, 0x02, 0x00, 0x00, 0x22, 0x00,  /* . ....". */
            /* 03A0 */  0x02, 0x00, 0x00, 0x24, 0x00, 0x02, 0x00, 0x00,  /* ...$.... */
            /* 03A8 */  0x26, 0x00, 0x02, 0x00, 0x00, 0x28, 0x00, 0x04,  /* &....(.. */
            /* 03B0 */  0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x04, 0x00,  /* ....,... */
            /* 03B8 */  0x00, 0x00, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x3D,  /* ...<...= */
            /* 03C0 */  0x00, 0x01, 0x00, 0x3E, 0x00, 0x02, 0x00, 0x00,  /* ...>.... */
            /* 03C8 */  0x84, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x8C,  /* ........ */
            /* 03D0 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x92, 0x00,  /* ........ */
            /* 03D8 */  0x02, 0x00, 0x00, 0x94, 0x00, 0x04, 0x00, 0x00,  /* ........ */
            /* 03E0 */  0x00, 0x00, 0x98, 0x00, 0x02, 0x00, 0x00, 0xA2,  /* ........ */
            /* 03E8 */  0x00, 0x02, 0x00, 0x00, 0xA8, 0x00, 0x02, 0x00,  /* ........ */
            /* 03F0 */  0x00, 0xAC, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 03F8 */  0xB0, 0x00, 0x02, 0x00, 0x00, 0xB4, 0x00, 0x04,  /* ........ */
            /* 0400 */  0x00, 0x00, 0x00, 0x00, 0xBC, 0x00, 0x02, 0x00,  /* ........ */
            /* 0408 */  0x00, 0xC8, 0x00, 0x02, 0x00, 0x00, 0xD0, 0x00,  /* ........ */
            /* 0410 */  0x02, 0x00, 0x00, 0xEC, 0x00, 0x04, 0x00, 0x00,  /* ........ */
            /* 0418 */  0x00, 0x00, 0x14, 0x01, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0420 */  0x00, 0x44, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .D...... */
            /* 0428 */  0x50, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x58,  /* P......X */
            /* 0430 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x01,  /* ......\. */
            /* 0438 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x01, 0x04,  /* ........ */
            /* 0440 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x04, 0x00,  /* ........ */
            /* 0448 */  0x00, 0x00, 0x00, 0x04, 0x02, 0x04, 0x00, 0x00,  /* ........ */
            /* 0450 */  0x00, 0x00, 0x08, 0x02, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 0458 */  0x00, 0x28, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  /* .(...... */
            /* 0460 */  0x2C, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x38,  /* ,......8 */
            /* 0468 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x40, 0x02,  /* ......@. */
            /* 0470 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x02, 0x04,  /* .....D.. */
            /* 0478 */  0x00, 0x00, 0x00, 0x00, 0x50, 0x02, 0x04, 0x00,  /* ....P... */
            /* 0480 */  0x00, 0x00, 0x00, 0x58, 0x02, 0x04, 0x00, 0x00,  /* ...X.... */
            /* 0488 */  0x00, 0x00, 0x5C, 0x02, 0x04, 0x00, 0x00, 0x00,  /* ..\..... */
            /* 0490 */  0x00, 0xD0, 0x0C, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0498 */  0x34, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF4,  /* 4....... */
            /* 04A0 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x0D,  /* ........ */
            /* 04A8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xA4, 0x0D, 0x04,  /* ........ */
            /* 04B0 */  0x00, 0x00, 0x00, 0x00, 0xA8, 0x0D, 0x04, 0x00,  /* ........ */
            /* 04B8 */  0x00, 0x00, 0x00, 0xAC, 0x0D, 0x04, 0x00, 0x00,  /* ........ */
            /* 04C0 */  0x00, 0x00, 0xB0, 0x0D, 0x04, 0x00, 0x00, 0x00,  /* ........ */
            /* 04C8 */  0x00, 0xB4, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 04D0 */  0xB8, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xBC,  /* ........ */
            /* 04D8 */  0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x01,  /* ........ */
            /* 04E0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x04,  /* ........ */
            /* 04E8 */  0xFF, 0xFF, 0xFF, 0xFF                           /* .... */
        })
        Name (DAT1, Buffer (0x43)
        {
            /* 0000 */  0x06, 0x00, 0x02, 0xFF, 0xFF, 0x1E, 0x00, 0x02,  /* ........ */
            /* 0008 */  0xFF, 0xFF, 0xAA, 0x00, 0x02, 0xFF, 0xFF, 0xC0,  /* ........ */
            /* 0010 */  0x00, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xD2, 0x00,  /* ........ */
            /* 0018 */  0x02, 0xFF, 0xFF, 0xC4, 0x01, 0x04, 0xFF, 0xFF,  /* ........ */
            /* 0020 */  0xFF, 0xFF, 0xD0, 0x01, 0x04, 0xFF, 0xFF, 0xFF,  /* ........ */
            /* 0028 */  0xFF, 0xF0, 0x01, 0x04, 0xFF, 0xFF, 0xFF, 0xFF,  /* ........ */
            /* 0030 */  0x9C, 0x0D, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xB2,  /* ........ */
            /* 0038 */  0x00, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0xFF,  /* ........ */
            /* 0040 */  0xFF, 0xFF, 0xFF                                 /* ... */
        })
        OperationRegion (PCIM, SystemMemory, 0xF8200040, 0x04)
        Field (PCIM, DWordAcc, NoLock, Preserve)
        {
            NVOS,   32
        }

        OperationRegion (PCIS, SystemMemory, 0xF8200000, 0x0500)
        Field (PCIS, DWordAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            CMDR,   32, 
            VGAR,   1984, 
            Offset (0x488), 
                ,   25, 
            MLTF,   1
        }

        Name (VGAB, Buffer (0xF8)
        {
             0x00                                             /* . */
        })
        OperationRegion (GPR, SystemIO, 0x1C00, 0x60)
        Field (GPR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x0C), 
                ,   1, 
            GP01,   1, 
                ,   15, 
            GP17,   1, 
            Offset (0x38), 
                ,   18, 
            GP50,   1, 
                ,   3, 
            GP54,   1, 
            Offset (0x48)
        }

        OperationRegion (PT80, SystemIO, 0x80, 0x04)
        Field (PT80, DWordAcc, Lock, Preserve)
        {
            P80H,   32
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (Zero, \_SB.PCI0.PEG0.PEGP._ADR) /* External reference */
        }

        Method (GMXB, 0, NotSerialized)
        {
            Store (PCFG, HSTR) /* \_SB_.PCI0.PEG0.PEGP.HSTR */
            If (LEqual (HSTR, 0x03))
            {
                Store (0x08, Local0)
            }
            Else
            {
                Store (0x04, Local0)
            }

            Return (Local0)
        }

        Method (PUAB, 0, NotSerialized)
        {
            Store (Zero, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
            Store (Zero, CBDL) /* \_SB_.PCI0.PEG0.PEGP.CBDL */
            Store (PCFG, HSTR) /* \_SB_.PCI0.PEG0.PEGP.HSTR */
            If (LEqual (HSTR, 0x03))
            {
                Store (Zero, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                Store (0x08, CBDL) /* \_SB_.PCI0.PEG0.PEGP.CBDL */
            }
            Else
            {
                If (LEqual (LREV, Zero))
                {
                    Store (Zero, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                    Store (0x04, CBDL) /* \_SB_.PCI0.PEG0.PEGP.CBDL */
                }
                Else
                {
                    Store (0x04, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                    Store (0x04, CBDL) /* \_SB_.PCI0.PEG0.PEGP.CBDL */
                }
            }

            Store (One, INDX) /* \_SB_.PCI0.PEG0.PEGP.INDX */
            If (LNotEqual (CBDL, Zero))
            {
                While (LLessEqual (INDX, CBDL))
                {
                    BSPR (FBDL, Zero)
                    Increment (FBDL)
                    Increment (INDX)
                }
            }
        }

        Method (PDUB, 1, NotSerialized)
        {
            Store (Zero, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
            Store (Arg0, CBDL) /* \_SB_.PCI0.PEG0.PEGP.CBDL */
            If (LEqual (CBDL, Zero))
            {
                Return (Zero)
            }

            If (LEqual (HSTR, 0x03))
            {
                If (LEqual (LREV, Zero))
                {
                    Store (Subtract (0x08, CBDL), FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                }
                Else
                {
                    Store (Zero, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                }
            }
            Else
            {
                If (LEqual (LREV, Zero))
                {
                    Store (Subtract (0x04, CBDL), FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                }
                Else
                {
                    Store (0x04, FBDL) /* \_SB_.PCI0.PEG0.PEGP.FBDL */
                }
            }

            Store (One, INDX) /* \_SB_.PCI0.PEG0.PEGP.INDX */
            While (LLessEqual (INDX, CBDL))
            {
                BSPR (FBDL, One)
                Increment (FBDL)
                Increment (INDX)
            }
        }

        Method (SPP0, 0, NotSerialized)
        {
            Store (Zero, INDX) /* \_SB_.PCI0.PEG0.PEGP.INDX */
            While (One)
            {
                Store (DerefOf (Index (DAT0, INDX)), WLSB) /* \_SB_.PCI0.PEG0.PEGP.WLSB */
                Increment (INDX)
                Store (DerefOf (Index (DAT0, INDX)), WMSB) /* \_SB_.PCI0.PEG0.PEGP.WMSB */
                Increment (INDX)
                Store (Or (ShiftLeft (WMSB, 0x08), WLSB), POFF) /* \_SB_.PCI0.PEG0.PEGP.POFF */
                Store (DerefOf (Index (DAT0, INDX)), PLEN) /* \_SB_.PCI0.PEG0.PEGP.PLEN */
                Increment (INDX)
                If (LEqual (POFF, 0xFFFF))
                {
                    Break
                }

                While (LGreater (PLEN, Zero))
                {
                    Store (RBP0 (POFF), Index (DAT0, INDX))
                    Increment (INDX)
                    Increment (POFF)
                    Decrement (PLEN)
                }
            }
        }

        Method (RPP0, 0, NotSerialized)
        {
            Store (Zero, INDX) /* \_SB_.PCI0.PEG0.PEGP.INDX */
            While (One)
            {
                Store (DerefOf (Index (DAT0, INDX)), WLSB) /* \_SB_.PCI0.PEG0.PEGP.WLSB */
                Increment (INDX)
                Store (DerefOf (Index (DAT0, INDX)), WMSB) /* \_SB_.PCI0.PEG0.PEGP.WMSB */
                Increment (INDX)
                Store (Or (ShiftLeft (WMSB, 0x08), WLSB), POFF) /* \_SB_.PCI0.PEG0.PEGP.POFF */
                Store (DerefOf (Index (DAT0, INDX)), PLEN) /* \_SB_.PCI0.PEG0.PEGP.PLEN */
                Increment (INDX)
                If (LEqual (POFF, 0xFFFF))
                {
                    Break
                }

                While (LGreater (PLEN, Zero))
                {
                    WBP0 (POFF, DerefOf (Index (DAT0, INDX)))
                    Increment (INDX)
                    Increment (POFF)
                    Decrement (PLEN)
                }
            }
        }

        Method (CLP0, 0, NotSerialized)
        {
            Store (Zero, INDX) /* \_SB_.PCI0.PEG0.PEGP.INDX */
            While (One)
            {
                Store (DerefOf (Index (DAT1, INDX)), WLSB) /* \_SB_.PCI0.PEG0.PEGP.WLSB */
                Increment (INDX)
                Store (DerefOf (Index (DAT1, INDX)), WMSB) /* \_SB_.PCI0.PEG0.PEGP.WMSB */
                Increment (INDX)
                Store (Or (ShiftLeft (WMSB, 0x08), WLSB), POFF) /* \_SB_.PCI0.PEG0.PEGP.POFF */
                Store (DerefOf (Index (DAT1, INDX)), PLEN) /* \_SB_.PCI0.PEG0.PEGP.PLEN */
                Increment (INDX)
                If (LEqual (POFF, 0xFFFF))
                {
                    Break
                }

                While (LGreater (PLEN, Zero))
                {
                    WBP0 (POFF, DerefOf (Index (DAT1, INDX)))
                    Increment (INDX)
                    Increment (POFF)
                    Decrement (PLEN)
                }
            }
        }

        Method (SGON, 0, Serialized)
        {
            Store (0x61, P80H) /* \_SB_.PCI0.PEG0.PEGP.P80H */
            Store (Zero, GP50) /* \_SB_.PCI0.PEG0.PEGP.GP50 */
            Sleep (0x64)
            Store (One, GP54) /* \_SB_.PCI0.PEG0.PEGP.GP54 */
            While (LNotEqual (GP17, One))
            {
                Sleep (One)
            }

            Sleep (0x012C)
            Store (One, GP50) /* \_SB_.PCI0.PEG0.PEGP.GP50 */
            Sleep (0x64)
            Store (Zero, AFES) /* \_SB_.PCI0.PEG0.AFES */
            Store (Zero, LNKD) /* \_SB_.PCI0.PEG0.LNKD */
            Store (0x67, P80H) /* \_SB_.PCI0.PEG0.PEGP.P80H */
            While (LLess (LNKS, 0x07))
            {
                Store (0x20, Local0)
                While (Local0)
                {
                    If (LLess (\_SB.PCI0.PEG0.LNKS, 0x07))
                    {
                        Stall (0x64)
                        Decrement (Local0)
                    }
                    Else
                    {
                        Break
                    }
                }

                If (LEqual (Local0, Zero))
                {
                    Store (One, \_SB.PCI0.PEG0.RTLK)
                    Stall (0x64)
                }
            }

            Store (Zero, CMDR) /* \_SB_.PCI0.PEG0.PEGP.CMDR */
            Store (VGAB, VGAR) /* \_SB_.PCI0.PEG0.PEGP.VGAR */
            Store (0x00100006, CMDR) /* \_SB_.PCI0.PEG0.PEGP.CMDR */
            Store (Zero, MLTF) /* \_SB_.PCI0.PEG0.PEGP.MLTF */
            Store (0x71, P80H) /* \_SB_.PCI0.PEG0.PEGP.P80H */
            Store (One, OFSG) /* External reference */
            Return (One)
        }

        Method (SGOF, 0, Serialized)
        {
            Store (0x60, P80H) /* \_SB_.PCI0.PEG0.PEGP.P80H */
            Store (VGAR, VGAB) /* \_SB_.PCI0.PEG0.PEGP.VGAB */
            Store (One, LNKD) /* \_SB_.PCI0.PEG0.LNKD */
            While (LNotEqual (LNKS, Zero))
            {
                Sleep (One)
            }

            Store (0x02, AFES) /* \_SB_.PCI0.PEG0.AFES */
            Store (Zero, GP50) /* \_SB_.PCI0.PEG0.PEGP.GP50 */
            Sleep (0x64)
            Store (Zero, GP54) /* \_SB_.PCI0.PEG0.PEGP.GP54 */
            Sleep (0x012C)
            Store (One, GP50) /* \_SB_.PCI0.PEG0.PEGP.GP50 */
            Sleep (0x64)
            Store (0x70, P80H) /* \_SB_.PCI0.PEG0.PEGP.P80H */
            Store (Zero, OFSG) /* External reference */
            Return (Zero)
        }

        Method (SGST, 0, Serialized)
        {
            If (LEqual (OSYS, 0x07DD))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (\_SB.PCI0.GFX0._DOD ())
        }

        Device (DD01)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD01._ADR ())
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                Return (\_SB.PCI0.GFX0.DD01._DGS ())
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
            }
        }
    }
}

