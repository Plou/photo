var path = require('path'),
    rootPath = path.normalize(__dirname + '/..'),
    env = process.env.NODE_ENV || 'development';

var config = {
  development: {
    root: rootPath,
    app: {
      name: 'photo'
    },
    port: 3000,
    db: 'mongodb://localhost/photo-demo'
  },

  test: {
    root: rootPath,
    app: {
      name: 'photo'
    },
    port: 3000,
    db: 'mongodb://localhost/photo-test'
  },

  production: {
    root: rootPath,
    app: {
      name: 'photo'
    },
    port: 3000,
    db: 'mongodb://localhost/photo-production'
  }
};

module.exports = config[env];
