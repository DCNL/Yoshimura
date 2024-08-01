def getCommand(self, cmd, paths):
    if not cmd.strip():
        return None
    path = None
    if cmd in self.commands:
        return self.commands[cmd]
    if cmd[0] in (".", "/"):
        path = self.fs.resolve_path(cmd, self.cwd)
        if not self.fs.exists(path):
            return None
    else:
        for i in [f"{self.fs.resolve_path(x, self.cwd)}/{cmd}" for x in paths]:
            if self.fs.exists(i):
                path = i
                break

    txt = os.path.normpath(
        "{}/txtcmds/{}".format(CowrieConfig.get("honeypot", "share_path"), path)
    )
    if os.path.exists(txt) and os.path.isfile(txt):
        return self.txtcmd(txt)

    if path in self.commands:
        return self.commands[path]

    log.msg(f"Can't find command {cmd}")
    return None