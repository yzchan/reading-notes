; 实验17
; ===================================================================
; 通过int 13h中断提供的方法访问磁盘非常的不方便。可以考虑通过对所有面和磁道上的扇区进行统一编址（0~2879）。然后我们通过对逻辑扇区进行读写就直观的多。
; 逻辑扇区号 = (面号*80 + 磁道号) * 18 + 扇区号 -1
; 安装一个新的int 7ch中断例程，实现通过逻辑扇区号对软盘进行读写
; ===================================================================
; 入参
; (ah)传递功能号：0表示读  1表示写
; (dx)传递需要操作的逻辑扇区号
; es:bx指向需要读出或写入的内存起始地址

