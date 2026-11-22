# tp — recueil d'exercices TP

Feuille de recueil d'exercices TP — cover page avec métadonnées (auteur,
dépôt, licence, tikz centerpiece), préambule moderne avec environnements
`td-exo` / `td-sol` / `cleanalgo`, compiles en light/dark via `\THEME`
(mappé depuis `\lhtheme` — `latex_handler compile --theme dark` fonctionne).
Basé sur `tmp/` (HAI904I Algorithmique Spécialisée).

## Contents

| Document | Kind | Notes |
| --- | --- | --- |
| `src/main.tex` | TP sheet (`article`) | Cover + exercices `tds/01..04`. |
| `assets/preamble.tex` | Preamble + class | Palettes light/dark, macros, envs. |
| `assets/cover.tex` | Cover page | Métadonnées spécifiques (auteur, dépôt, licence). |
| `assets/tikz_cover.tex` | TikZ centerpiece | Graph de l'exemple. |
| `assets/tds/*.tex` | Exercices | Énoncés numériques (copiés depuis tmp). |

## Use

```sh
latex_handler new mon_tp --template tp
cd mon_tp
latex_handler compile --file src/main.tex
latex_handler compile --theme all
```

## Assets

Fichiers copiés depuis `tmp/src/assets/` — on peut ajouter des exercices
dans `assets/tds/` depuis le `main.tex`.
