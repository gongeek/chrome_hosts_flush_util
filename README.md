# 方法1：装扩展解决

+ https://blog.cyeam.com/tool/2018/10/26/host
+ https://www.jianshu.com/p/a8cc2c04ee7c

# 方法2：chrome_hosts_flush_util

applescript tool for web developer

System requirements:

  OS X 10.10.2
  
  Google Chrome for OSX 41.0.2272.104 (64-bit)

Usage:

  1.flush_chrome_sockets.applescript is to resolve the problem that Chrome can't use the correct hosts after modifying hosts file because of  Chrome using socket pools.
    
    chmod 755 flush_chrome_sockets.applescript

    ./flush_chrome_sockets.applescript
