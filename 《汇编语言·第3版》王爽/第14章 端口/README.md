第14章 端口
---

CPU除了可以直接操控寄存器外和内存单元外，还可以操作端口，从而实现对其他设备的操控。比如键盘鼠标，就是利用端口来操作的。本章的练习主要介绍了如何通过端口对CMOS RAM中时间存储单元进行读写。

在in和out指令中，只能使用ax或al来存放从端口中读入的数据或要发送到端口中的数据。访问8位端口时用al，访问16位端口时用ax。

```s
# 对0~255以内的端口进行读写时：
in al，20h
out 20h，al

# 对256~65535的端口进行读写时，端口放在dx中：
mov dx，3f8h
in al，dx
out dx，al
```

## 需要掌握的汇编指令
- in/out 端口输入输出指令
- shl/shr 左移/右移指令

## PC机常用硬件端口

| I/O地址 |	功能 |
| - | -- |
| 0 |	DMA通道0，内存地址寄存器 |
| 1 |	DMA通道0，传输计数寄存器 |
| 2 |	DMA通道1，内存地址寄存器 |
| 3 |	DMA通道1，传输计数寄存器 |
| 4 |	DMA通道2，内存地址寄存器 |
| 5 |	DMA通道2，传输计数寄存器 |
| 6 |	DMA通道3，内存地址寄存器 |
| 7 |	DMA通道3，传输计数寄存器 |
| 8 |	DMA通道0—3的状态寄存器 |
| 0AH | DMA通道0—3的屏蔽寄存器 |
| 0BH | DMA通道0—3的方式寄存器 |
| 0CH | DMA清除字节指针 |
| 0DH | DMA主清除字节 |
| 0EH | DMA通道0—3的清屏蔽寄存器 |
| 0FH | DMA通道0—3的写屏蔽寄存器 |
| 19H | DMA起始寄存器 |
| 20H—3FH | 可编程中断控制器使用 |
| 40H | 可编程中断计时器使用，读/写计数器0 |
| 41H | 可编程中断计时器寄存器 |
| 42H | 可编程中断计时器杂项寄存器 |
| 43H | 可编程中断计时器，控制字寄存器 |
| 44H | 可编程中断计时器，杂项寄存器(AT) |
| 47H | 可编程中断计时器，计数器0的控制字寄存器 |
| 48H—5FH | 可编程中断计时器使用 |
| 60H—61H | 键盘输入数据缓冲区 |
| 61H | AT：8042控制寄存器 |
| XT：8255输出寄存器 |
| 62H | 8255输入寄存器 |
| 63H | 8255命令方式寄存器 |
| 64H | 8042键盘输入缓冲区/8042状态 |
| 65H—6FH | 8255/8042专用 |
| 70H | CMOS RAM地址寄存器 |
| 71H | CMOS RAM数据寄存器 |
| 80H | 生产测试端口 |
| 81H | DMA通道2，页表地址寄存器 |
| 82H | DMA通道3，页表地址寄存器 |
| 83H | DMA通道1，页表地址寄存器 |
| 87H | DMA通道0，页表地址寄存器 |
| 89H | DMA通道6，页表地址寄存器 |
| 8AH | DMA通道7，页表地址寄存器 |
| 8BH | DMA通道5，页表地址寄存器 |
| 8FH | DMA通道4，页表地址寄存器 |
| 93—9FH | DMA控制器专用 |
| A0H | NMI屏蔽寄存器/可编程中断控制器2 |
| A1H | 可编程中断控制器2屏蔽 |
| C0H | DMA通道0，内存地址寄存器 |
| C2H | DMA通道0，传输地址寄存器 |
| C4H | DMA通道1，内存地址寄存器 |
| C6H | DMA通道1，传输地址寄存器 |
| C8H | DMA通道2，内存地址寄存器 |
| CAH | DMA通道2，传输地址寄存器 |
| CCH | DMA通道3，内存地址寄存器 |
| CEH | DMA通道3，传输地址寄存器 |
| D0H | DMA状态寄存器 |
| D2H | DMA写请求寄存器 |
| D4H | DMA屏蔽寄存器 |
| D6H | DMA方式寄存器 |
| D8H | DMA清除字节指针 |
| DAH | DMA主清 |
| DCH | DMA清屏蔽寄存器 |
| DEH | DMA写屏蔽寄存器 |
| DF—EFH | 保留 |
| F0—FFH | 协处理器使用 |
| 100—16FH | 保留 |
| 0170H | 1号硬盘数据寄存器 |
| 0171H | 1号硬盘错误寄存器 |
| 0172H | 1号硬盘数据扇区计数 |
| 0173H | 1号硬盘扇区数 |
| 0174H | 1号硬盘柱面(低字节) |
| 0175H | 1号硬盘柱面(高字节) |
| 0176H | 1号硬盘驱动器/磁头寄存器 |
| 0177H | 1号硬盘状态寄存器 |
| 01F0H | 0号硬盘数据寄存器 |
| 01F1H | 0号硬盘错误寄存器 |
| 01F2H | 0号硬盘数据扇区计数 |
| 01F3H | 0号硬盘扇区数 |
| 01F4H | 0号硬盘柱面(低字节) |
| 01F5H | 0号硬盘柱面(高字节) |
| 01F6H | 0号硬盘驱动器/磁头寄存器 |
| 01F7H | 0号硬盘状态寄存器 |
| 1F9—1FFH | 保留 |
| 200—2FH | 游戏控制端口 |
| 210—21FH | 扩展单元 |
| 0278H | 3号并行口，数据端口 |
| 0279H | 3号并行口，状态端口 |
| 027AH | 3号并行口，控制端口 |
| 2B0—2DFH | 保留 |
| 02E0H | EGA/VGA使用 |
| 02E1H | GPIP(0号适配器) |
| 02E2H | 数据获取(0号适配器) |
| 02E3H | 数据获取(1号适配器) |
| 2E4—2F7H | 保留 |
| 02F8H | 2号串行口，发送/保持寄存器 |
| 02F9H | 2号串行口，中断有效寄存器 |
| 02FAH | 2号串行口，中断ID寄存器 |
| 02FBH | 2号串行口，线控制寄存器 |
| 02FCH | 2号串行口，调制解调控制寄存器 |
| 02FDH | 2号串行口，线状态寄存器 |
| 02FEH | 2号串行口，调制解调状态寄存器 |
| 02FFH | 保留 |
| 300—31FH | 原型卡 |
| 0320H | 硬盘适配器寄存器 |
| 0322H | 硬盘适配器控制/状态寄存器 |
| 0324H | 硬盘适配器提示/中断状态寄存器 |
| 325—347H | 保留 |
| 348—357H | DCA3278 |
| 366—36FH | PC网络 |
| 0372H | 软盘适配器数据输出/状态寄存器 |
| 375-376H | 软盘适配器数据寄存器 |
| 0377H | 软盘适配器数据输入寄存器 |
| 0378H | 2号并行口，数据端口 |
| 0379H | 2号并行口，状态端口 |
| 037AH | 2号并行口，控制端口 |
| 380—38FH | SDLC及BSC通讯 |
| 390—393H | Cluster适配器0 |
| 3A0—3AFH | BSC通讯 |
| 3B0—3BFH | MDA视频寄存器 |
| 03BCH | 1号并行口，数据端口 |
| 03BDH | 1号并行口，状态端口 |
| 03BEH | 1号并行口，控制端口 |
| 03C0—03CFH | EGA/VGA视频寄存器 |
| 03D0—03D7H | CGA视频寄存器 |
| 03F0—03F7H | 软盘控制寄存器 |
| 03F8H | 1号串行口，发送/保持寄存器 |
| 03F9H | 1号串行口，中断有效寄存器 |
| 03FAH | 1号串行口，中断ID寄存器 |
| 03FBH | 1号串行口，线控制寄存器 |
| 03FCH | 1号串行口，调制解调控制寄存器 |
| 03FDH | 1号串行口，线状态寄存器 |
| 03FEH | 1号串行口，调制解调状态寄存器 |
| 03FFH | 保留 |

> 《汇编语言》书中需要掌握CMOS端口（70h/71h）和键盘端口（60h）