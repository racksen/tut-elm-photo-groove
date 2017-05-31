# photo-groove-app-with-elm


### About:
This is a sample photo groove application explained in Elm In Action book. Used the Webpack starter setup for writing this app and it comes with followin features:

* Dev server with live reloading, HMR
* Support for CSS/SCSS (with Autoprefixer), image assets
* Bootstrap 3.3+ (Sass version)
* Bundling and minification for deployment
* Basic app scaffold, using `Html.beginnerProgram`
* A snippet of example code to get you started!


### Install:
Clone this repo into a new project folder, e.g. `my-elm-project`:
```
git clone https://github.com/rackse/tut-elm-photo-groove my-elm-project
cd my-elm-project
```

Re-initialize the project folder as your own repo:
```
rm -rf .git         # on Windows: rmdir .git /s /q
git init
git add .
git commit -m 'first commit'
```

Install all dependencies using the handy `reinstall` script:
```
npm run reinstall
```
*This does a clean (re)install of all npm and elm packages, plus a global elm install.*


### Serve locally:
```
npm start
```
* Access app at `http://localhost:8080/`
* Get coding! The entry point file is `src/elm/Main.elm`
* Browser will refresh automatically on any file changes..


### Build & bundle for prod:
```
npm run build
```

* Files are saved into the `/dist` folder
* To check it, open `dist/index.html`


### Changelog
**Ver 0.1.0**
* Renamed the `src/elm/componenets/Hello.elm` as `PhotoGroove.elm`
* Apply hash filenames for bundled JS and CSS (prevents caching)
* Image and favicon assets copied to `dist/`
