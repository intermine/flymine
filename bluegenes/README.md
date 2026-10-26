# BlueGenes settings for FlyMine

BlueGenes keeps some of FlyMine's settings in the mine's userprofile database
rather than in any file, so a database rebuild, or a slip in the BlueGenes
Admin page, loses them. The copies here are the reference.

| File | BlueGenes property | What it is |
|---|---|---|
| `layout.report.edn` | `layout.report` | Report page layouts: for each class (here `Gene`), the categories and the classes, tools and templates shown in each, in order. Saved from https://www.flymine.org on 2026-10-26; the gene page shows the JBrowse 2 panel, not the JBrowse 1 one. |

The homepage notice (property `notice`) is deliberately not kept: it is
set for the occasion from the Admin page.

The files are read and written with `scripts/bluegenes-properties.py` from
[intermineorg/docker_template](https://github.com/intermineorg/docker_template)
(Python 3.8+, no dependencies; its README, "Adding a BlueGenes tool to report
pages", has the details). From a checkout of that repository:

```sh
# does the live mine match this copy? (exit status 1 if not)
scripts/bluegenes-properties.py check https://www.flymine.org/flymine <this repo>/bluegenes/layout.report.edn

# after changing the layout in the Admin page: save it here and commit
scripts/bluegenes-properties.py export https://www.flymine.org/flymine -o <this repo>/bluegenes --key layout.report

# put this copy back on the mine (after a rebuild, or to undo an Admin-page
# change): needs the superuser's API token (BlueGenes, logged in as the
# superuser: Account, API access key); --dry-run first shows what would change
scripts/bluegenes-properties.py apply https://www.flymine.org/flymine <this repo>/bluegenes/layout.report.edn \
    --token-file ~/.flymine-superuser-token
```

`apply` saves the live values under `bluegenes-backups/<date-time>/` before
writing, and reads the mine back afterwards to confirm. The file can also be
edited by hand (it is EDN; keep each `{:label ..., :value ..., :type ...,
:collapse nil}` entry intact) and applied, but the Admin page followed by
`export` is less error-prone.
