const HtmlWebpackPlugin   = require('html-webpack-plugin'); //installed via npm
const { VueLoaderPlugin } = require('vue-loader')
const webpack             = require('webpack'); //to access built-in plugins
const path                = require('path');

module.exports = {
  mode: "development",
  entry: './src/index.ts',
  output: {
    path: path.resolve(__dirname, 'dist'),
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: 'ts-loader',
        options: {
          appendTsSuffixTo: [/(\.vue)$/],
        },
        exclude: /node_modules/,
      },
      {
        test: /\.vue$/,
        use: 'vue-loader'
      },
      {
        test: /\.js$/,
        loader: 'babel-loader'
      },
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({ template: './src/index.dev.html', inject: true }),
    new VueLoaderPlugin()
  ]
};
