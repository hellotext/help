let nextInstanceId = 0

export class EditorialTabs {
  constructor(element) {
    this.element = element
    this.handleClick = (event) => this.select(this.tabs.indexOf(event.currentTarget))
    this.handleKeydown = (event) => {
      if (event.altKey || event.ctrlKey || event.metaKey) return

      const currentIndex = this.tabs.indexOf(event.currentTarget)
      const lastIndex = this.tabs.length - 1
      const nextIndex = {
        ArrowLeft: currentIndex === 0 ? lastIndex : currentIndex - 1,
        ArrowRight: currentIndex === lastIndex ? 0 : currentIndex + 1,
        Home: 0,
        End: lastIndex,
      }[event.key]

      if (nextIndex === undefined) return

      event.preventDefault()
      this.select(nextIndex)
      this.tabs[nextIndex].focus({ preventScroll: true })
    }
  }

  connect() {
    if (this.connected) return

    this.tablist = this.element.querySelector('[data-editorial--tabs-target~="tablist"]')
    this.tabs = Array.from(this.element.querySelectorAll('[data-editorial--tabs-target~="tab"]'))
    this.panels = Array.from(this.element.querySelectorAll('[data-editorial--tabs-target~="panel"]'))
    if (!this.tablist || this.tabs.length < 2 || this.tabs.length !== this.panels.length) return

    let prefix
    do {
      prefix = `editorial-tabs-${++nextInstanceId}`
    } while (
      this.tabs.some((_, index) => this.element.ownerDocument.getElementById(`${prefix}-tab-${index}`)) ||
      this.panels.some((_, index) => this.element.ownerDocument.getElementById(`${prefix}-panel-${index}`))
    )

    this.tabs.forEach((tab, index) => {
      const panel = this.panels[index]
      tab.id = `${prefix}-tab-${index}`
      tab.setAttribute('aria-controls', `${prefix}-panel-${index}`)
      tab.addEventListener('click', this.handleClick)
      tab.addEventListener('keydown', this.handleKeydown)
      panel.id = `${prefix}-panel-${index}`
      panel.setAttribute('role', 'tabpanel')
      panel.setAttribute('aria-labelledby', tab.id)
      panel.tabIndex = 0
    })

    this.connected = true
    this.select(0)
    this.tablist.hidden = false
  }

  select(index) {
    if (!this.connected || !Number.isInteger(index) || index < 0 || index >= this.tabs.length) return

    this.tabs.forEach((tab, tabIndex) => {
      const selected = tabIndex === index
      tab.setAttribute('aria-selected', String(selected))
      tab.tabIndex = selected ? 0 : -1
      this.panels[tabIndex].hidden = !selected
    })
  }

  destroy() {
    if (!this.connected) return

    this.tabs.forEach((tab) => {
      tab.removeEventListener('click', this.handleClick)
      tab.removeEventListener('keydown', this.handleKeydown)
      for (const attribute of ['id', 'aria-controls', 'aria-selected', 'tabindex']) tab.removeAttribute(attribute)
    })
    this.panels.forEach((panel) => {
      panel.hidden = false
      for (const attribute of ['id', 'role', 'aria-labelledby', 'tabindex']) panel.removeAttribute(attribute)
    })
    this.tablist.hidden = true
    this.connected = false
  }
}
