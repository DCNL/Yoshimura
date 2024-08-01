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
                    break
                else:
                    sname = sname + chr(ch)
            
            if sname == ".rodata":
                rden = i
                
        print(".rodata:" + str(rden))
        print(data[sehd[rden][4]:sehd[rden][4]+sehd[rden][5]])
