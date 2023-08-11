# ros_enhance
script for mikrotik routeros

## 1. chnroute.rsc
```
:log info "[network_chnroute] start download chnroute.rsc ..."
:local downloadurl "https://cdn.jsdelivr.net/gh/0x5826/ros_enhance@main/chnroute.rsc"
/tool fetch http-method=get url=$downloadurl
:log info "[network_chnroute] chnroute.rsc downloaded."
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="chnroute.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 300000) do={
    /import file=chnroute.rsc
    :log info "[network_chnroute] chnroute address list updated!"
  }
}
```
