local class = require('30log')


local inode = class()
function inode:__init(args)
    self.name = args.name
    
    -- stat info
    self.device = args.dev
    self.inode = args.ino
    self.mode = args.mode
    self.links = args.nlink
    self.userid = args.uid
    self.groupid = args.gid
    self.rdevice = args.rdev
    self.size = args.size
    self.blocksize = args.blksize
    self.blocks = args.blocks
    self.accesstime = args.atime
    self.modifytime = args.mtime
    self.createtime = args.ctime
end

return {
    inode = inode    
}

