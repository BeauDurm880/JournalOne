// config/webpack/loaders/babel.js
module.exports = {
    test: /\.jsx?$/, // Matches both .js and .jsx files
    exclude: /node_modules/, // Exclude node_modules
    use: {
      loader: 'babel-loader',
      options: {
        presets: ['@babel/preset-env'], // Use Babel preset for latest ECMAScript features
      },
    },
  };
  