(() => {
  const app = Elm.Main.init({
    // We can't init without a node.  That doesn't mean we need to really render
    // anything meaningful, though.
    node: document.getElementById('root')
  })

  app.ports.outOfElm.subscribe(x => console.log(x))

  app.ports.intoElm.send(1234)
})()
