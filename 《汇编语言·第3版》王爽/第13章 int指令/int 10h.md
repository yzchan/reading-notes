10h是BIOS所提供的中断例程，其所提供的子程序如下
```
00H：设置显示器模式
01H：设置光标形状
02H：设置光标位置
03H：读取光标信息
04H：读取光笔位置
05H：设置显示页
06H、07H：初始化或滚屏
08H：读光标处的字符及其 属性
09H：在光标处按指定属性显示字符
0AH：在当前光标处显示字符
0BH：设置调色板、背景色或边框
0CH：写图形象素
0DH：读图形象素
0EH：在Teletype模式下显示字符
0FH：读取显示器模式
10H：颜色
11H：字体
12H：显示器的配置
13H：在Teletype模式下显示字符串
1AH：读取/设置显示组合编码
1BH：读取功能/状态信息
1CH：保存/恢复显示器状态
```