##  20190409 GridView＆DetailsView

###  GridView
工具箱>資料

\>SqlDataSource
設定資料夾來源

\>GridView
選擇資料夾來源
### DetailsView 
\>DetailsView
選擇資料夾來源

* 可以插入資料(GridView無法插入資料)

### DetailsView 連接GridView
DetailsView 連接GridView

![alt](./image/20190409where.PNG)

GridView添加樞紐分析表選取模式

![alt](./image/20190409選取.png)

### 同步顯示(DataBind) 
修改DetailsView，GridVie同步改變資料

![alt](./image/20190409item.PNG)
member.aspx.cs
![alt](./image/20190409databind.PNG)

### 超連接轉換
兩個頁面，藉由網址傳輸訊息，使頁面改變

member.aspx

![alt](./image/20190409選取2.PNG)
對應網頁網址: memberDetail.aspx?id={0}

memberDetail.aspx

![alt](./image/20190409where2.PNG)

QuerString 可以接收網址欄位的資訊

![alt](./image/20190409網址.PNG)
