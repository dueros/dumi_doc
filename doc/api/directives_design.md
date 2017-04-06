# directives的交互设计参考

## directives的执行顺序
一条返回值的结构体，包含一个directives数组

  * 顺序执行directives数组中的指令
  * SpeechSynthesizer.Speak 指令，需要播报完了再取下一条
  * udioPlayer的指令，操作后台的播放器进程，执行时间会很短，执行完后立即取下一条。
  * Speaker等其它指令，block直接执行。

如果收到一条新的返回值结构体，停止之前的directives数组的执行（如果正在播报SpeechSynthesizer.Speak，停止播报），丢弃尚未执行的directives，执行新返回的directives数组。但是AudioPlayer的播放列表保持不变



## 声音内容输入输出的分类：

Channel：

  * Alerts：闹钟Alerts
  * Dialog：用户对话，包括SpeechRecognizer, 不带channel="Content"的SpeechSynthesizer
  * Content：播放的内容，包括AudioPlayer指令的内容，带有channel="Content"的SpeechSynthesizer指令的内容 （会被用来读新闻，读故事等）

原则上，声音输入输出的优先级应该是Alerts > Dialog > Content

