import { HotBean, SearchLayout, SearchResultController } from '@abner/search';

@Entry
@Component
struct Index {
  searchResultController: SearchResultController = new SearchResultController()
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
        searchResultController: this.searchResultController,
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
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}