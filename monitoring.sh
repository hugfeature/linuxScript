#!/bin/bash  
# ��ȡҪ��صı��ط�����IP��ַ  
IP=`ifconfig | grep inet | grep -vE 'inet6|127.0.0.1' | awk '{print $2}'`  
echo "IP��ַ��"$IP  
   
# ��ȡcpu�ܺ���  
cpu_num=`grep -c "model name" /proc/cpuinfo`  
echo "cpu�ܺ�����"$cpu_num  
   
# 1����ȡCPU������  
################################################  
#us �û��ռ�ռ��CPU�ٷֱ�  
#sy �ں˿ռ�ռ��CPU�ٷֱ�  
#ni �û����̿ռ��ڸı�����ȼ��Ľ���ռ��CPU�ٷֱ�  
#id ����CPU�ٷֱ�  
#wa �ȴ����������CPUʱ��ٷֱ�  
#hi Ӳ���ж�  
#si ����ж�  
#################################################  
# ��ȡ�û��ռ�ռ��CPU�ٷֱ�  
cpu_user=`top -b -n 1 | grep Cpu | awk '{print $2}' | cut -f 1 -d "%"`  
echo "�û��ռ�ռ��CPU�ٷֱȣ�"$cpu_user  
   
# ��ȡ�ں˿ռ�ռ��CPU�ٷֱ�  
cpu_system=`top -b -n 1 | grep Cpu | awk '{print $4}' | cut -f 1 -d "%"`  
echo "�ں˿ռ�ռ��CPU�ٷֱȣ�"$cpu_system  
   
# ��ȡ����CPU�ٷֱ�  
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}' | cut -f 1 -d "%"`  
echo "����CPU�ٷֱȣ�"$cpu_idle  
   
# ��ȡ�ȴ��������ռCPU�ٷֱ�  
cpu_iowait=`top -b -n 1 | grep Cpu | awk '{print $10}' | cut -f 1 -d "%"`  
echo "�ȴ��������ռCPU�ٷֱȣ�"$cpu_iowait  
   
#2����ȡCPU�������л����жϴ���  
# ��ȡCPU�жϴ���  
cpu_interrupt=`vmstat -n 1 1 | sed -n 3p | awk '{print $11}'`  
echo "CPU�жϴ�����"$cpu_interrupt  
   
# ��ȡCPU�������л�����  
cpu_context_switch=`vmstat -n 1 1 | sed -n 3p | awk '{print $12}'`  
echo "CPU�������л�������"$cpu_context_switch  
   
#3����ȡCPU������Ϣ  
# ��ȡCPU15����ǰ�����ڵĸ���ƽ��ֵ  
cpu_load_15min=`uptime | awk '{print $11}' | cut -f 1 -d ','`  
echo "CPU 15����ǰ�����ڵĸ���ƽ��ֵ��"$cpu_load_15min  
   
# ��ȡCPU5����ǰ�����ڵĸ���ƽ��ֵ  
cpu_load_5min=`uptime | awk '{print $10}' | cut -f 1 -d ','`  
echo "CPU 5����ǰ�����ڵĸ���ƽ��ֵ��"$cpu_load_5min  
   
# ��ȡCPU1����ǰ�����ڵĸ���ƽ��ֵ  
cpu_load_1min=`uptime | awk '{print $9}' | cut -f 1 -d ','`  
echo "CPU 1����ǰ�����ڵĸ���ƽ��ֵ��"$cpu_load_1min  
   
# ��ȡ�������(����״̬�ȴ��Ľ�����)  
cpu_task_length=`vmstat -n 1 1 | sed -n 3p | awk '{print $1}'`  
echo "CPU������г��ȣ�"$cpu_task_length  
   
#4����ȡ�ڴ���Ϣ  
# ��ȡ�����ڴ�����  
mem_total=`free | grep Mem | awk '{print $2}'`  
echo "�����ڴ�������"$mem_total  
   
# ��ȡ����ϵͳ��ʹ���ڴ�����  
mem_sys_used=`free | grep Mem | awk '{print $3}'`  
echo "��ʹ���ڴ�����(����ϵͳ)��"$mem_sys_used  
   
# ��ȡ����ϵͳδʹ���ڴ�����  
mem_sys_free=`free | grep Mem | awk '{print $4}'`  
echo "ʣ���ڴ�����(����ϵͳ)��"$mem_sys_free  
   
# ��ȡӦ�ó�����ʹ�õ��ڴ�����  
mem_user_used=`free | sed -n 3p | awk '{print $3}'`  
echo "��ʹ���ڴ�����(Ӧ�ó���)��"$mem_user_used  
   
# ��ȡӦ�ó���δʹ���ڴ�����  
mem_user_free=`free | sed -n 3p | awk '{print $4}'`  
echo "ʣ���ڴ�����(Ӧ�ó���)��"$mem_user_free  
   
   
# ��ȡ���������ܴ�С  
mem_swap_total=`free | grep Swap | awk '{print $2}'`  
echo "���������ܴ�С��"$mem_swap_total  
   
# ��ȡ��ʹ�ý���������С  
mem_swap_used=`free | grep Swap | awk '{print $3}'`  
echo "��ʹ�ý���������С��"$mem_swap_used  
   
# ��ȡʣ�ཻ��������С  
mem_swap_free=`free | grep Swap | awk '{print $4}'`  
echo "ʣ�ཻ��������С��"$mem_swap_free  
   
  
#5����ȡ����I/Oͳ����Ϣ  
echo "ָ���豸(/dev/sda)��ͳ����Ϣ"  
# ÿ�����豸����Ķ��������  
disk_sda_rs=`iostat -kx | grep sda| awk '{print $4}'`  
echo "ÿ�����豸����Ķ����������"$disk_sda_rs  
   
# ÿ�����豸�����д�������  
disk_sda_ws=`iostat -kx | grep sda| awk '{print $5}'`  
echo "ÿ�����豸�����д���������"$disk_sda_ws  
   
# ���豸�����I/O������г���ƽ��ֵ  
disk_sda_avgqu_sz=`iostat -kx | grep sda| awk '{print $9}'`  
echo "���豸�����I/O������г���ƽ��ֵ"$disk_sda_avgqu_sz  
   
# ÿ�����豸�����I/O����ƽ��ʱ��  
disk_sda_await=`iostat -kx | grep sda| awk '{print $10}'`  
echo "ÿ�����豸�����I/O����ƽ��ʱ�䣺"$disk_sda_await  
   
# ���豸�����I/O����ʱ���ֵ  
disk_sda_svctm=`iostat -kx | grep sda| awk '{print $11}'`  
echo "���豸�����I/O����ʱ���ֵ��"$disk_sda_svctm  
   
# ���豸����I/O�����CPUʱ��ٷ�ռ��  
disk_sda_util=`iostat -kx | grep sda| awk '{print $12}'`  
echo "���豸����I/O�����CPUʱ��ٷ�ռ�ȣ�"$disk_sda_util  