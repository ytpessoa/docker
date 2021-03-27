docker network ls
# NETWORK ID          NAME                DRIVER              SCOPE
# 71bf00cfd1a8        bridge              bridge              local
# 737f6b1062b6        host                host                local
# 705d18fc30ec        none                null                local



# Modo Bridge: container saindo pra internet pela bridge
$ docker container run --rm alpine ash -c "ifconfig"
# eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02
#           inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0

# lo        Link encap:Local Loopback
#           inet addr:127.0.0.1  Mask:255.0.0.0

# --rm remove o container após execução



# Mode None: container isolado de outros contaners e da intenet
$ docker container run --rm --net none alpine ash -c "ifconfig"
# lo        Link encap:Local Loopback
#           inet addr:127.0.0.1  Mask:255.0.0.0

docker network inspect bridge
# "Subnet": "172.17.0.0/16",
# "Gateway": "172.17.0.1"




# Exercicio: c1 <-----ping-----> c2
docker container run --rm -d --name c1 alpine sleep 1000
docker container exec -it c1 ifconfig
# eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02  
#           inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0
docker container run --rm -d --name c2 alpine sleep 1000
docker container exec -it c2 ifconfig
# eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:03  
#           inet addr:172.17.0.3  Bcast:172.17.255.255  Mask:255.255.0.0
docker container exec -it c1 ping 172.17.0.3
# PING 172.17.0.3 (172.17.0.3): 56 data bytes
# 64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.056 ms
docker container exec -it c1 ping www.google.com
# PING www.google.com (172.217.29.68): 56 data bytes
# 64 bytes from 172.217.29.68: seq=0 ttl=37 time=112.504 ms


# Exercicio Nova Rede:
docker network create --driver bridge rede_nova
# NETWORK ID          NAME                DRIVER              SCOPE
# 20c1de8b358f        rede_nova           bridge              local
docker network inspect rede_nova
# "Subnet": "172.18.0.0/16",
# "Gateway": "172.18.0.1"
docker container run --rm -d --name c3 --net rede_nova alpine sleep 1000
docker network inspect rede_nova
# "Name": "c3",
# "IPv4Address": "172.18.0.2/16",
docker container run --rm -d --name c4 --net rede_nova alpine sleep 1000
docker network inspect rede_nova
# "Name": "c4",
# "IPv4Address": "172.18.0.3/16",


docker container exec -it c3 ifconfig
# eth0 inet addr:172.18.0.2  Bcast:172.18.255.255  Mask:255.255.0.0
docker container exec -it c4 ifconfig
# eth0  inet addr:172.18.0.3  Bcast:172.18.255.255  Mask:255.255.0.0

docker container exec -it c3 ping 172.18.0.3
#64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.416 ms





#Exercicio Rede Modo Host: + velocidade pois não passa pela bridge. Porém fica mais exposta
docker container run --rm -d --name c5 --net host alpine sleep 1000
docker container exec -it c5 ifconfig
# br-20c1de8b358f Link encap:Ethernet  HWaddr 02:42:D5:0F:5C:7A  
#           inet addr:172.18.0.1  Bcast:172.18.255.255  Mask:255.255.0.0

# docker0   Link encap:Ethernet  HWaddr 02:42:16:A7:C9:E0  
#           inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
  
# eth0      Link encap:Ethernet  HWaddr 02:50:00:00:00:01  
#           inet addr:192.168.65.3  Bcast:192.168.65.15  Mask:255.255.255.0
  
# lo        Link encap:Local Loopback  
#           inet addr:127.0.0.1  Mask:255.0.0.0
#           inet6 addr: ::1/128 Scope:Host

# services1 Link encap:Ethernet  HWaddr 1E:E3:05:03:47:19  
#           inet addr:192.168.65.4  Bcast:0.0.0.0  Mask:255.255.255.255
#           inet6 addr: fe80::1ce3:5ff:fe03:4719/64 Scope:Link

# veth575b36b Link encap:Ethernet  HWaddr 26:DF:92:B5:FC:7D  
#           inet6 addr: fe80::24df:92ff:feb5:fc7d/64 Scope:Link
#           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
  
# veth715cf88 Link encap:Ethernet  HWaddr 2E:56:DA:7B:20:77  
#           inet6 addr: fe80::2c56:daff:fe7b:2077/64 Scope:Link
#           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
  
# vethd00a9ce Link encap:Ethernet  HWaddr CE:F3:47:D1:2D:48  
#           inet6 addr: fe80::ccf3:47ff:fed1:2d48/64 Scope:Link
#           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1



