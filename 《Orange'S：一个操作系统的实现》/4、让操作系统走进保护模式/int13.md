# int 13h

int 13h中断又称直接磁盘服务(Direct Disk Service)。

## 00H功能 — 磁盘系统复位

入口参数：AH＝00H

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

## 01H — 读取磁盘系统状态

入口参数：AH＝01H

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

出口参数：AH＝00H，AL＝状态代码，
其定义如下：

| 错误代码 | 错误说明                                 |
|------|--------------------------------------|
| 00H  | 无错                                   |
| 01H  | 非法命令                                 |
| 02H  | 地址目标未发现                              |
| 03H  | 磁盘写保护(软盘)                            |
| 04H  | 扇区未发现                                |
| 05H  | 复位失败(硬盘)                             |
| 06H  | 软盘取出(软盘)                             |
| 07H  | 错误的参数表(硬盘)                           |
| 08H  | DMA越界(软盘)                            |
| 09H  | DMA超过64K界限                           |
| 0AH  | 错误的扇区标志(硬盘)                          |
| 0BH  | 错误的磁道标志(硬盘)                          |
| 0CH  | 介质类型未发现(软盘)                          |
| 0DH  | 格式化时非法扇区号(硬盘)                        |
| 0EH  | 控制数据地址目标被发现(硬盘)                      |
| 0FH  | DMA仲裁越界(硬盘)                          |
| 10H  | 不正确的CRC或ECC编码                        |
| 11H  | ECC校正数据错(硬盘)                         |
|      | CRC:Cyclic Redundancy Check code     |
|      | ECC:Error Checking & Correcting code |
| 20H  | 控制器失败                                |
| 40H  | 查找失败                                 |
| 80H  | 磁盘超时(未响应)                            |
| AAH  | 驱动器未准备好(硬盘)                          |
| BBH  | 未定义的错误(硬盘)                           |
| CCH  | 写错误(硬盘)                              |
| E0H  | 状态寄存器错(硬盘)                           |
| FFH  | 检测操作失败(硬盘)                           |

## 02H — 读扇区

入口参数：AH＝02H

AL＝扇区数

CH＝柱面

CL＝扇区

DH＝磁头

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

## 03H — 写扇区

入口参数：AH＝03H

AL＝扇区数

CH＝柱面

CL＝扇区

DH＝磁头

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

## 04H — 检验扇区

入口参数：AH＝04H

AL＝扇区数

CH＝柱面

CL＝扇区

DH＝磁头

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，AH＝00H，AL＝被检验的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

## 05H — 格式化磁道

入口参数：AH＝05H

AL＝交替(Interleave)

CH＝柱面

DH＝磁头

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

ES:BX＝地址域列表的地址

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明



## 06H — 格式化坏磁道

入口参数：AH＝06H

AL＝交替

CH＝柱面

DH＝磁头

DL＝80H-0FFH：硬盘

ES:BX＝地址域列表的地址

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

## 07H — 格式化驱动器

入口参数：AH＝07H

AL＝交替

CH＝柱面

DL＝80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明


## 08H — 读取驱动器参数

入口参数：AH＝08H

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

出口参数：CF＝1——操作失败，AH＝状态代码，参见功能号01H中的说明，否则， BL＝01H - 360K

＝02H - 1.2M

＝03H - 720K

＝04H - 1.44M

CH＝柱面数的低8位

CL的位7-6＝柱面数的该2位

CL的位5-0＝扇区数

DH＝磁头数

DL＝驱动器数

ES:DI＝磁盘驱动器参数表地址

## 09H — 初始化硬盘参数

入口参数：AH＝09H

DL＝80H-0FFH：硬盘(还有有关参数表问题，在此从略)

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

## 0AH — 读长扇区（每个扇区随带四个字节的ECC编码）

入口参数：AH＝0AH

AL＝扇区数

CH＝柱面

CL＝扇区

DH＝磁头

DL＝80H-0FFH：硬盘

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明


## 0BH — 写长扇区（每个扇区随带四个字节的ECC编码）

入口参数：AH＝0BH

AL＝扇区数

CH＝柱面

CL＝扇区

DH＝磁头

DL＝80H-0FFH：硬盘

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明


## 0CH — 查寻


入口参数：AH＝0CH

CH＝柱面的低8位

CL(7-6位)＝柱面的高2位

DH＝磁头

DL＝80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明


## 0DH — 硬盘系统复位

入口参数：AH＝0DH

DL＝80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明





## 0EH — 读扇区缓冲区

入口参数：AH＝0EH

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，否则，AH＝状态代码，参见功能号01H中的说明

## 0FH — 写扇区缓冲区

入口参数：AH＝0FH

ES:BX＝缓冲区的地址

出口参数：CF＝0——操作成功，否则，AH＝状态代码，参见功能号01H中的说明



## 10H — 读取驱动器状态

入口参数：AH＝10H

DL＝80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

## 11H — 校准驱动器


入口参数：AH＝11H

DL＝80H-0FFH：硬盘

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明


## 12H — 控制器RAM诊断


入口参数：AH＝12H

出口参数：CF＝0——操作成功，否则，AH＝状态代码，参见功能号01H中的说明



## 13H — 控制器驱动诊断

入口参数：AH＝13H

出口参数：CF＝0——操作成功，否则，AH＝状态代码，参见功能号01H中的说明


## 14H — 控制器内部诊断


入口参数：AH＝14H

出口参数：CF＝0——操作成功，否则，AH＝状态代码，参见功能号01H中的说明



## 15H — 读取磁盘类型

入口参数：AH＝15H

DL＝驱动器，00H-7FH：软盘；80H-0FFH：硬盘

出口参数：CF＝1——操作失败，AH＝状态代码，参见功能号01H中的说明， 否则，AH＝00H - 未安装驱动器

＝01H - 无改变线支持的软盘驱动器

＝02H - 带有改变线支持的软盘驱动器

＝03H - 硬盘，CX:DX＝512字节的扇区数

## 16H — 读取磁盘变化状态


入口参数：AH＝16H

DL＝00H-7FH：软盘

出口参数：CF＝0——磁盘未改变，AH＝00H，否则，AH＝06H，参见功能号01H中的说明



## 17H — 设置磁盘类型


入口参数：AH＝17H

DL＝00H-7FH：软盘 AL＝00H - 未用

＝01H - 360K在360K驱动器中

＝02H - 360K在1.2M驱动器中

＝03H - 1.2M在1.2M驱动器中

＝04H - 720K在720K驱动器中

出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态编码，参见功能号01H中的说明


## 18H — 设置格式化媒体类型


入口参数：AH＝18H

CH＝柱面数

CL＝每磁道的扇区数

DL＝00H-7FH：软盘

出口参数：CF＝0——操作成功，AH＝00H，ES:DI＝介质类型参数表地址，否则，AH＝状态编码，参见功能号01H中的说明

## 19H — 磁头保护（仅在PS/2中有效）

(26)、功能19H

功能描述：磁头保护，仅在PS/2中有效，在此从略

## 1AH — 格式化ESDI驱动器（仅在PS/2中有效）

(27)、功能1AH

功能描述：格式化ESDI驱动器，仅在PS/2中有效，在此从略


