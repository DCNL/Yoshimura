hdct = len(self.url) #urlの文字数の取得
hd = None

hd = '{:04}'.format(hdct) #formatメソッドを利用し,4桁の数字とするために0埋めを行う.
hd += url


now  = datetime.datetime.now()

fname = "/HD/malwares/tmp/MW" + str(now.date()) + "_" + str(now.time())

self.file = open(fname, "wb")
self.file.write(hd)
self.file.write(data)
self.file.close()