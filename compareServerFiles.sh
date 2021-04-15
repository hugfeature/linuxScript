#!/bin/bash
#####################################
#�����̨������ָ��Ŀ¼�µ��ļ�һ����
#####################################
#ͨ���Ա���̨���������ļ���md5ֵ���ﵽ���һ���Ե�Ŀ��
dir=/data/web
b_ip=*.*.*.*
#��ָ��Ŀ¼�µ��ļ�ȫ��������������Ϊmd5sum����Ĳ����������õ������ļ���md5ֵ����д�뵽ָ���ļ���
find $dir -type f|xargs md5sum > /tmp/md5_a.txt
ssh $b_ip "find $dir -type f|xargs md5sum > /tmp/md5_b.txt"
scp $b_ip:/tmp/md5_b.txt /tmp
#���ļ�����Ϊ�����������һһ�ȶ�
for f in `awk '{print 2} /tmp/md5_a.txt'`
do
#��a����Ϊ��׼����b���������ڱ��������е��ļ�ʱֱ����������ڵĽ��
if grep -qw "$f" /tmp/md5_b.txt
then
md5_a=`grep -w "$f" /tmp/md5_a.txt|awk '{print 1}'`
md5_b=`grep -w "$f" /tmp/md5_b.txt|awk '{print 1}'`
#���ļ�����ʱ�����md5ֵ��һ��������ļ��ı�Ľ��
if [ $md5_a != $md5_b ]
then
echo "$f changed."
fi
else
echo "$f deleted."
fi
done