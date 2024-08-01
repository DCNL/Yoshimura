   # エントリポイント，プログラムヘッダテーブル，セクションヘッダテーブルの取得
    if data[4] == 1: #16bitの場合
        e1 = struct.unpack("<lll",data[24:24+12])
        entrypoint = e1[0]
        print("entrypoint = " + hex(entrypoint)) #エントリーポイントのメモリアドレス
        phoff = e1[1] #str(data[28] + data[29] + data[30] + data[31])
        print("phoff = " + hex(phoff)) #プログラムヘッダテーブルの最初のポイント
        shoff = e1[2]#str(data[32] + data[33] + data[34] + data[35])
        print("shoff = " + hex(shoff)) #セクションヘッダテーブルの最初のポイント
        e2 = struct.unpack("<6H",data[40:40+12])  #2byteずつ
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