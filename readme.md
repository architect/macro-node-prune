[<img src="https://s3-us-west-2.amazonaws.com/arc.codes/architect-logo-500b@2x.png" width=500>](https://www.npmjs.com/package/@architect/architect)

## [`@architect/macro-node-prune`](https://www.npmjs.com/package/@architect/macro-node-prune)

> Node.js-specific Architect macro based on [`node-prune`](https://github.com/tuananh/node-prune) that cleans `node_modules` cruft from your Functions during deployment


## Warning

Pruning your `node_modules` tree(s) has some inherent risks. While we have found it to be stable and reliable, the packages your project uses may provide different results.

For example: while unlikely, a package that includes and makes use of a file with a commonly `.npmignore`d filename may be impacted by this pruner. For a list of files and folders that are pruned, please [review the pruner script source](https://github.com/architect/macro-node-prune/blob/master/prune.sh).


## Installation

1. Run: `npm i @architect/macro-node-prune`

2. Then add the following to your Architect project file (usually `.arc`):

```
@macros
architect/macro-node-prune
```

> Note, no `@` in the macro name!

3. Deploy your project (`npx deploy`) and watch the filesizes drop 📉


## Results

In practice, we have seen average filesize and file count reductions of about 25-30% across the board. That's a meaningful number for cloud functions!


## Disabling the macro

If for whatever reason you need to disable the macro, simply comment it out in (or remove it from) your Architect project file:

```
@macros
# architect/macro-node-prune
```


## Limitations

- Architect supports shared code by selectively copying `src/shared` and `src/views` into all Functions' `node_modules` dirs by default.
  - Because this macro runs just prior to deployment, it must avoid Architect shared code dirs so as not to inadvertently destroy user files.
  - As such, any `node_modules` folders within `src/shared` or `src/views` will not be pruned.
- This macro relies on shelling out to a bash script, so ymmv on Windows.
