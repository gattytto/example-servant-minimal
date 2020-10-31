 [![Contribute](https://www.eclipse.org/che/factory-contribute.svg)](che.openshift.io/f?url=https://raw.githubusercontent.com/gattytto/example-servant-minimal/8.8.4/devfile.yaml) [![Contribute](https://www.eclipse.org/che/factory-contribute.svg)](https://che.openshift.io/f?url=https://github.com/gattytto/example-servant-minimal/tree/8.8.4)

This is a very minimal example of a project that uses

- `servant` to specify a REST API,
- `servant-server` to implement a server,
- `hspec` and `servant-client` for the test-suite.

To set up the project and run the test-suite, do:

``` bash
stack setup
stack test --fast
```

To execute the test-suite faster while developing, do:
``` bash
chmod go-w .ghci .
stack exec ghci test/Spec.hs
```

and then at the `ghci` prompt do:

``` haskell
:main
```

to run the tests and

``` haskell
:r
:main
```

to reload the code (after making changes) and run the tests again.

To run the app, do:

``` bash
stack exec example-servant-minimal
```

Then you can query the server like this:

``` bash
curl localhost:3000/item
```
