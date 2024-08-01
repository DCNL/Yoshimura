        self.deferred = self.download(self.url, self.outfile)
         #URLとoutファイルを引数にdownload関数で不正サイト情報defferdを取得
        if self.deferred:
            self.deferred.addCallback(self.success)         # 情報を得られたらsuccessメソッドへ
            self.deferred.addErrback(self.error, self.url)  # 情報を上手く得られなかったらerrorメソッドへ
        else:
            self.exit()