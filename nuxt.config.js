module.exports = {
  mode: 'spa',
  render: {
    resourceHints: false,
  },
  router: {
    mode: 'hash',
  },
  build: {
    vendor: [
      'vuetify',
      'vue-axios',
      'moment',
      'socket.io-client',
    ],
  },
  plugins: [
    '~/plugins/vuetify',
    '~/plugins/axios',
    '~/plugins/misc',
    '~/plugins/socket',
  ],
  proxy: {
    '/api': 'http://127.0.0.1:34001',
    ws: true,
  },
  modules: [
    '@nuxtjs/pwa',
    '@nuxtjs/proxy',

  ],
  loading: { color: '#3B8070' },
  manifest: {
    theme_color: '#3B8070',
  },
  head: {
    title: 'Veh',
    meta: [
      { charset: 'utf-8' },
      { 'http-equiv': 'X-UA-Compatible', content: 'IE=edge' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { name: 'theme-color', content: '#0ff5' },
      { name: 'fragment', content: '!' },
      { name: 'mobile-web-app-capable', content: 'yes' },
      { name: 'apple-mobile-web-app-capable', content: 'yes' },
      { name: 'apple-mobile-web-app-status-bar-style', content: 'black' },
      { name: 'msapplication-TileImage', content: '/icon/veh.PNG' },
      { name: 'msapplication-TileColor', content: '#000' },
    ],
    link: [
      { rel: 'shortcut icon', href: '/icon/veh.PNG' },
      { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/icon/veh.PNG' },
      { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/icon/veh.PNG' },
      { rel: 'apple-touch-icon', href: '/icon/veh.PNG' },
      { rel: 'stylesheet', href: 'css/cv_style.css' },
      { rel: 'stylesheet', href: 'css/fontawesome-free/css/all.css' },
    ],
  },
}
