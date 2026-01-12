import { DigitGenerator } from './DigitGenerator'
import { QRCodeGenerator } from './QRCodeGenerator'
import { StrongPassGenerator } from './StrongPassGenerator'

@Entry
@Component
struct Index {
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string) {
    if (name === 'StrongPassGenerator') {
      StrongPassGenerator()
    }
    else if(name === 'DigitGenerator'){
      DigitGenerator()
    }
    else if(name === 'QRCodeGenerator'){
      QRCodeGenerator()
    }
  }

  build() {
    Navigation(this.pageStack){
      RelativeContainer() {
        Column(){
          Text('We Authenticator')
            .margin(2)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
          this.button('Strong Pass Generator', this.strongPassGenerator)
          this.button('Digit Generator', this.numberGenerator)
          this.button('QR Code Generator', this.qrCodeGenerator)
          Text(' Smart, safe, and cryptographically strong! ')
            .margin(2)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Italic)
        }
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      }
      .height('100%')
      .width('100%')
      .padding({
        bottom: 10
      })
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .navDestination(this.PagesMap)
    .hideBackButton(true)
    .ignoreLayoutSafeArea()
  }

  private strongPassGenerator = () => {
    this.pageStack.pushPathByName('StrongPassGenerator', null);
  }
  private numberGenerator = () => {
    this.pageStack.pushPathByName('DigitGenerator', null);
  }
  private qrCodeGenerator = () => {
    this.pageStack.pushPathByName('QRCodeGenerator', null);
  }

  @Builder
  button(text: string, onClick: () => void) {
    Button({ type: ButtonType.Normal }) {
      Text(text)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
    }
    .width('70%')
    .height('15%')
    .backgroundColor(Color.Pink)
    .borderRadius(24)
    .borderColor(Color.White)
    .onClick(onClick)
    .margin(2)
  }
}