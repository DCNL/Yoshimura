import struct
f = open("niggabox","rb")
data = f.read()
if data[0:4] == b'\x7fELF':
    print("ELF")
    match data[4]:
        case 1:
            print("32bit")
        case 2:
            print("64bit")
    match data[5]:
        case 1:
            print("little endian")
        case 2:
            print("big endian")
    match data[18]:
        case 0x07:
            print("Intel 80860")
        case 0x13:
            print("Intel 80960")
        case 0x28:
            print("Arm")