with open(sys.argv[1]) as f: # コマンド引数のファイルを開く
    ip = None
    cmd = 'wget'
    for line in f: # ファイルから一行ずつ読み込む
        dic = json.loads(line) # 一行のJSONデータを辞書形式に変換する
        if dic['eventid'] == 'cowrie.command.input':

        #ip = dic['src_ip']
        #print('[src_ip] =', dic['src_ip'])
        #print(dic['input'])
        
            if cmd in dic['input']:
                if dic['src_ip'] != ip:
                  ip = dic['src_ip']
                  print('[src_ip] =', dic['src_ip'])
                  print(dic['input'])
