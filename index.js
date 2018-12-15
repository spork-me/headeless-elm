(() => {
  const app = Elm.Main.init({
    // We can't init without a node.  That doesn't mean we need to really render
    // anything meaningful, though.
    node: document.getElementById('root')
  })

  app.ports.outOfElm.subscribe(x => console.log(x))


  document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('input').addEventListener('blur', (event) => {
      app.ports.intoElm.send(event.target.value)
    })
  })
})()
