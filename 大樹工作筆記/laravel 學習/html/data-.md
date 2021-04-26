
## [data-*](https://developer.mozilla.org/zh-TW/docs/Web/HTML/Global_attributes/data-*)

```js
    let task_id = this.id;
    let checkbox = document.getElementById(task_id);
    let data = checkbox.getAttribute('data-checkbox');
```
```html
<input  class="m-2 "  type="checkbox"  id="task_checkbox${key}" ${value.iscompleted ? "checked":""} data-checkbox="${key}">
```