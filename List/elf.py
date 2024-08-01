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

    # エントリポイント，プログラムヘッダテーブル，セクションヘッダテーブルの取得
    if data[4] == 1: #16bitの場合
        e1 = struct.unpack("<lll",data[24:24+12])
        entrypoint = e1[0]
        print("entrypoint = " + hex(entrypoint)) #エントリーポイントのメモリアドレス
        phoff = e1[1] #str(data[28] + data[29] + data[30] + data[31])
        print("phoff = " + hex(phoff)) #プログラムヘッダテーブルの最初のポイント
        shoff = e1[2]#str(data[32] + data[33] + data[34] + data[35])
        print("shoff = " + hex(shoff)) #セクションヘッダテーブルの最初のポイント
        e2 = struct.unpack("<6H",data[40:40+12])  #2bitずつ
        ehsize = e2[0] #str(data[40] + data[41])
        print("ehsize = " + hex(ehsize)) #このヘッダーのサイズ
        phetsize = e2[1] #プログラムヘッダテーブルのエントリーサイズ
        print("phetsize = " + hex(phetsize)) 
        phnum = e2[2] #プログラムヘッダテーブルのエントリー数
        print("phnum = " + hex(phnum)) 
        shensize = e2[3] #セクションヘッダテーブルのエントリーサイズ
        print("shensize = " + hex(shensize)) 
        shennum = e2[4] #セクションヘッダテーブルのエントリー数
        print("shennum = " + hex(shennum))
        shstrndx = e2[5] #セクションヘッダテーブル内でセクション名を持つエントリの位置
        print("shstrndx = " + hex(shstrndx))

        sehd = []
        for i in range(shennum):
            shptr = shoff + i * shensize #エントリのスタート位置
            sehd.append(struct.unpack("<10l",data[shptr:shptr+shensize]))
        print(sehd)
        print(sehd[shstrndx][4]) #.strtabのオフセット
        shstr = data[sehd[shstrndx][4]:sehd[shstrndx][4]+sehd[shstrndx][5]]

        rden = 0
        for i in range(shennum):
            sname = ''
            for ch in shstr[sehd[i][0]:]:
                if ch == 0:
                    print(i,sname)
                    print(data[sehd[i][4]:sehd[i][4]+sehd[i][5]])
                    print(" ")
                    break
                else:
                    sname = sname + chr(ch)
            
            if sname == ".rodata":
                rden = i
                
        print(".rodata:" + str(rden))
        print(data[sehd[rden][4]:sehd[rden][4]+sehd[rden][5]])
