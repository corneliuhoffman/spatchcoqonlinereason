const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: {
    Main: './lib/js/src/Main.js',
    Index: './lib/js/src/technical/index.js',
    Tree: './lib/js/src/technical/tree.js',
    Latex: './lib/js/src/technical/latex.js',
    Coqmanager: './lib/js/src/technical/coqmanager.js',
    Controller: './lib/js/src/Controller.js',



  },
  module: {
    rules: [{
      test: /\.less$/,
      use: ["style-loader", "css-loader", "less-loader"]
    }]
  },

  output: {
    path: __dirname + '/public',
    filename: '[name].js',
    library: 'Lib[name]'
  },
  plugins: [
    new ExtractTextPlugin("styles.css")
  ],
};