## Vim配置文件

### 概述
此配置简单，并没有整合过多的插件，因为平时的开发中，我还是主要使用IDE。现在主流的IDE一般都有Vim模式插件。
当然Vim也可以通过配置而变的强大，甚至媲美IDE。但是面对类似于Java等语言开发项目时，还是难以应付的。

想配置强大的Vim请移步下面的链接:

1. [spf13](https://github.com/spf13/spf13-vim)
2. [ma6174](https://github.com/ma6174/vim)
3. [do-vimrc](https://github.com/humiaozuzu/dot-vimrc)
4. [ivim](https://github.com/kepbod/ivim)

### 插件列表
* [vundle](https://github.com/VundleVim/Vundle.vim)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [syntastic](https://github.com/scrooloose/syntastic)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [vim-surround](https://github.com/tpope/vim-surround)

### 绑定快捷键
* resize +10 `<leader>1`, resize -10 `<leader>2`, vertical resize -10 `<leader>3`, vertical resize +10 `<leader>4`
* 分屏之后不同之间互相移动，上移`<leader>w`,下移`<leader>s`,左移`<leader>a`,右移`<leader>d`

### 安装(只提供了Linux和osx的shell，如果使用Windows请参考上面的链接)
#### curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/JameChou/jc-vim/master/install.sh)"
```

#### wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/JameChou/jc-vim/master/install.sh -O -)"
```

## tmux配置说明
1. 重新绑定了prefix <C-a>。
2. pane之间的切换使用prefix + (vim 上下左右)的方式。
3. 在session中可以使用prefix + ?的方式查看其他快捷键。

## 效果图
![screenshot](./screenshot.png)
