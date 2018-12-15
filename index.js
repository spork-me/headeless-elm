(() => {
  const app = Elm.Main.init({
    // We can't init without a node.  That doesn't mean we need to really render
    // anything meaningful, though.
    node: document.getElementById('root')
  })
})()
