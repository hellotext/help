import { EditorialTabs } from './editorial_tabs.js'

document.querySelectorAll('[data-controller~="editorial--tabs"]').forEach((element) => {
  new EditorialTabs(element).connect()
})
