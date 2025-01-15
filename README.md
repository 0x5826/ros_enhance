# ros_enhance
script for mikrotik routeros

## 1. chnroute.rsc
```
:log info "[network_chnroute_v4] start download chnroute_v4.rsc ..."
:local downloadurl "https://ghproxy.seckv.com/https://raw.githubusercontent.com/0x5826/ros_chnroute/refs/heads/main/chnroute_v4.rsc"
/tool fetch http-method=get url=$downloadurl
:log info "[network_chnroute] chnroute_v4.rsc downloaded."
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="chnroute_v4.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 300000) do={
    /import file=chnroute_v4.rsc
    :log info "[network_chnroute_v4] chnroute_v4 address list updated!"
  }
}
```
