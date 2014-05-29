# Gitolite server
# 此文件用于构建一个Gitolite的服务器
# 需要:
# 	admin.pub: gitolite使用的管理key，使用你自己的pub key代替
# 运行:
#  	必须对外暴露ssh端口。 
#   为了控制git仓库的存储位置，可以在运行时通过Volumes参数来指定本机目录
#   例： docker run -d --name gitolite -p 22022:22 -v /var/data/git:/home/git/repositories localhost:5000/gitolite

FROM ubuntu:trusty
MAINTAINER Beta CZ <hlj8080@gmail.com>

# 安装必要软件
RUN apt-get update
RUN apt-get install -y git perl openssh-server

# 创建git用户
RUN useradd git -m
# 上传管理员的公钥文件
ADD admin.pub /home/git/admin.pub

# 安装gitolite
RUN su - git -c 'git clone git://github.com/sitaramc/gitolite'
RUN su - git -c 'mkdir -p $HOME/bin \
	&& gitolite/install -to $HOME/bin \
	&& $HOME/bin/gitolite setup -pk admin.pub'

#备份初始仓库
RUN su - git -c 'mkdir $HOME/ori_repo && cp -R $HOME/repositories/* $HOME/ori_repo'

# 配置ssh服务不接受客户端语言环境变量,以防客户端与服务器语言不匹配时出现告警
RUN sed  -i 's/AcceptEnv/# \0/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

# 修复fatal: protocol error: bad line length character: Welc
RUN sed -i 's/session\s\+required\s\+pam_loginuid.so/# \0/' /etc/pam.d/sshd

EXPOSE 22

ADD start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["/start.sh"]

