// config/webpack/environment.js
const { environment } = require('@rails/webpacker');
const { merge } = require('webpack-merge');

// Define Babel loader configuration
const babelLoader = {
  test: /\.js$/,
  exclude: /node_modules/,
  use: {
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env'],
      plugins: [
        '@babel/plugin-proposal-class-properties',
        '@babel/plugin-proposal-object-rest-spread',
        '@babel/plugin-transform-private-methods',
        '@babel/plugin-syntax-dynamic-import'
      ]
    }
  }
};

// Append Babel loader to Webpack environment
environment.loaders.append('babel', babelLoader);

// Merge additional configuration for Webpack 5
environment.config.merge({
  resolve: {
    fallback: {
      // Add fallbacks for Node.js core modules if needed
      // Example: crypto: require.resolve('crypto-browserify'),
    }
  },
  node: false // Disable Node polyfills as per Webpack 5 requirements
});

module.exports = environment;


