# HarmonyOSSearchLayout

search是一个搜索页面模版，使用它可以很快速的实现一个带有历史搜索和热门搜索的搜索页面，通过属性可以实现我们常见的搜索样式。


<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/search/search.png" width="300px" />
</p>

## 开发环境

DevEco Studio NEXT Developer Beta1,Build Version: 5.0.7.200

Api版本：**12**

modelVersion：5.0.0

## 快速使用

远程依赖方式使用【推荐】

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/search
```

方式二：在工程的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/search": "^1.0.0"}
```

## 代码案例

```typescript
import { HotBean, SearchLayout } from '@abner/search';

@Entry
@Component
struct Index {
  @State hotList: HotBean[] = []

  aboutToAppear(): void {
      this.hotList.push(new HotBean("程序员一鸣", { bgColor: Color.Red }))
      this.hotList.push(new HotBean("AbnerMing", { bgColor: Color.Orange }))
      this.hotList.push(new HotBean("鸿蒙干货铺", { bgColor: Color.Pink }))
      this.hotList.push(new HotBean("程序员一哥", { bgColor: Color.Gray }))
  }

  build() {
    RelativeContainer() {
      SearchLayout({
        hotList: this.hotList,
        onItemClick: (text: string) => {
          console.log("===条目点击：" + text)
        },
        onSearchAttribute: (attr) => {
          attr.onSubmit = (text) => {
            console.log("===点击搜索：" + text)
          }
        }
      })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
      .width('100%')
  }
}
```



## 属性介绍

### SearchLayout属性

| 属性                      | 类型                                        | 概述              |
|-------------------------|-------------------------------------------|-----------------|
| hotList                 | HotBean[]                                 | 热门搜索数据          |
| onHistoryItemAttribute  | (attribute: HistoryItemAttribute) => void | 历史条目属性，在回调函数中设置 |
| onHotItemAttribute      | (attribute: HotItemAttribute) => void     | 热门条目属性，在回调函数中设置 |
| onHistoryTagAttribute   | (attribute: HistoryTagAttribute) => void  | 历史标签属性，在回调函数中设置 |
| onHotTagAttribute       | (attribute: HotTagAttribute) => void      | 热门标签属性，在回调函数中设置 |
| onSearchAttribute       | (attribute: SearchViewAttribute) => void  | 搜索属性，在回调函数中设置   |
| historyViewMarginTop    | Length                                    | 搜索组件距离顶部的边距     |
| historyViewMarginBottom | Length                                    | 搜索组件距离底部的边距     |
| hotViewMarginTop        | Length                                    | 热门组件距离顶部的边距     |
| rootMargin              | Padding/ Length/ LocalizedPadding         | 整体的边距           |
| searchLeftView          | BuilderParam                              | 自定义搜索左边的视图      |
| searchRightView         | BuilderParam                              | 自定义搜索右边的视图      |
| onItemClick             | (text: string) => void                    | 历史和热门点击条目回调     |
| searchResultController  | SearchResultController                    | 执行搜索控制          |

### HistoryItemAttribute属性

| 属性              | 类型                                             | 概述   |
|-----------------|------------------------------------------------|------|
| fontColor       | ResourceColor                                  | 字体颜色 |
| fontSize        | number/ string / Resource                      | 字体大小 |
| backgroundColor | ResourceColor                                  | 背景颜色 |
| padding         | Padding /Length/ LocalizedPadding              | 内边距  |
| borderRadius    | Length/BorderRadiuses/ LocalizedBorderRadiuses | 圆角度数 |
| fontWeight      | number / FontWeight/ string                    | 字重   |

### HotItemAttribute属性

| 属性               | 类型                                        | 概述     |
|------------------|-------------------------------------------|--------|
| fontColor        | ResourceColor                             | 字体颜色   |
| fontSize         | number/ string / Resource                 | 字体大小   |
| backgroundColor  | ResourceColor                             | 背景颜色   |
| fontWeight       | number / FontWeight/ string               | 字重     |
| labelSize        | Length                                    | 标签大小   |
| labelMarginRight | Length                                    | 标签距离右边 |
| columnsTemplate  | string                                    | 热门网格列数 |
| rowsGap          | Length                                    | 横向间距   |
| labelFontColor   | ResourceColor                             | 标签字体颜色 |
| labelFontSize    | number/string/Resource                    | 标签字体大小 |
| labelFontWeight  | number / FontWeight /string               | 标签字重   |
| labelPadding     | Padding / Length       / LocalizedPadding | 标签内边距  |

### HistoryTagAttribute属性

| 属性          | 类型                                         | 概述      |
|-------------|--------------------------------------------|---------|
| title       | string/ Resource                           | 历史tag标题 |
| fontColor   | ResourceColor                              | 字体颜色    |
| fontSize    | number/ string / Resource                  | 字体大小    |
| fontWeight  | number / FontWeight/ string                | 字重      |
| margin      | Margin/ Length / LocalizedMargin           | 外边距     |
| deleteSrc   | PixelMap / ResourceStr/ DrawableDescriptor | 删除icon  |
| imageWidth  | Length                                     | 图片宽度    |
| imageHeight | Length                                     | 图片高度    |
| height      | Length                                     | 整体的高度   |

### HotTagAttribute属性

| 属性          | 类型                                         | 概述      |
|-------------|--------------------------------------------|---------|
| title       | string/ Resource                           | 历史tag标题 |
| fontColor   | ResourceColor                              | 字体颜色    |
| fontSize    | number/ string / Resource                  | 字体大小    |
| fontWeight  | number / FontWeight/ string                | 字重      |
| margin      | Margin/ Length / LocalizedMargin           | 外边距     |

### SearchViewAttribute属性

| 属性                    | 类型                                              | 概述                                     |
|-----------------------|-------------------------------------------------|----------------------------------------|
| placeholder           | ResourceStr                                     | 占位字符                                   |
| placeholderColor      | ResourceColor                                   | 设置placeholder文本颜色                      |
| placeholderFont       | Font                                            | 设置placeholder文本样式，包括字体大小，字体粗细，字体族，字体风格 |
| value                 | string                                          | 设置当前显示的搜索文本内容                          |
| textFont              | Font                                            | 设置搜索框内输入文本样式，包括字体大小，字体粗细，字体族，字体风格      |
| fontColor             | ResourceColor                                   | 设置输入文本的字体颜色                            |
| textAlign             | TextAlign                                       | 设置文本在搜索框中的对齐方式                         |
| icon                  | string                                          | 设置搜索图标路径，默认使用系统搜索图标                    |
| copyOption            | CopyOptions                                     | 设置输入的文本是否可复制                           |
| height                | Length                                          | 搜索组件高度                                 |
| margin                | Margin /Length / LocalizedMargin                | 搜索组件外边距                                |
| searchIcon            | IconOptions /SymbolGlyphModifier                | 设置左侧搜索图标样式                             |
| cancelButton          | CancelButtonOptions / CancelButtonSymbolOptions | 设置右侧清除按钮样式                             |
| caretStyle            | CaretStyle                                      | 设置光标样式                                 |
| enableKeyboardOnFocus | boolean                                         | 设置Search通过点击以外的方式获焦时，是否主动拉起软键盘         |
| selectionMenuHidden   | boolean                                         | 设置是否不弹出系统文本选择菜单                        |
| type                  | SearchType                                      | 设置输入框类型。                               |
| maxLength             | number                                          | 设置文本的最大输入字符数                           |
| enterKeyType          | EnterKeyType                                    | 设置输入法回车键类型                             |
| onSubmit              | (value: string) => void                         | 点击搜索                                   |

## 常见案例

### 单独调用搜索

```typescript
//声明控制器
searchResultController: SearchResultController = new SearchResultController()
//设置属性
SearchLayout({
  hotList: this.hotList,
  searchResultController:this.searchResultController,
  onItemClick: (text: string) => {
    console.log("===条目点击：" + text)
  },
  onSearchAttribute: (attr) => {
    //搜索属性
    attr.onSubmit = (text) => {
      console.log("===点击搜索：" + text)
    }
  }
})
//调用
this.searchResultController.submit()
```

### 设置数字标签

主要还是设置数据源

```typescript
this.hotList.push(new HotBean("程序员一鸣", { name:"1" }))
this.hotList.push(new HotBean("AbnerMing", { name:"2"  }))
this.hotList.push(new HotBean("鸿蒙干货铺", { name:"3" }))
this.hotList.push(new HotBean("程序员一哥", { name:"4"  }))
```


## 咨询作者

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>


## License

```
Copyright (C) AbnerMing, HarmonyOSSearchLayout Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```