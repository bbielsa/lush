local class = require('30log')


local inode = class()
function inode:init(nodepath, args)
    self.path = nodepath
    
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

    self.type = args.type
end

return {
    inode = inode    
}

