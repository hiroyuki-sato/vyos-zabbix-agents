VERSION="2.2.1"
BASE_URL="http://www.zabbix.com/downloads/${VERSION}"

OSTYPE=$(shell uname -a | grep -o x86_64 )

ifeq ($(OSTYPE),x86_64)
  ARCH=amd64  
  FILE="zabbix_agents_${VERSION}.linux2_6.amd64.tar.gz"
else
  ARCH=i386
  FILE="zabbix_agents_${VERSION}.linux2_6.i386.tar.gz"
endif

all: 
#	test -f ${FILE} || wget ${BASE_URL}/${FILE}
	wget ${BASE_URL}/${FILE}

install:
	@tar xvfz ${FILE} -C ${DESTDIR} 
	mkdir -p ${DESTDIR}/usr
	mv ${DESTDIR}/bin ${DESTDIR}/sbin ${DESTDIR}/usr
	mv ${DESTDIR}/conf ${DESTDIR}/etc


clean:
	rm -f ${FILE}





