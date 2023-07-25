/** @type {import('tailwindcss').Config} */
module.exports = {
  optimize: false,
  content: ["./src/**/*.{html,js,jsp}"],
  theme: {
    spacing: {
      '2': '0.5rem', // 8px
      '4': '1rem', // 16px
      '8': '2rem', // 32px
      '12': '3rem', // 48px
      '16': '4rem', // 64px
      '20': '5rem', // 80px
      '24': '6rem', // 96px
      '28': '7rem', // 112px
      '32': '8rem', // 128px
      '36': '9rem', // 144px
      '40': '10rem', // 160px
      '44': '11rem', // 176px
      '48': '12rem', // 192px
      '52': '13rem', // 208px
      '56': '14rem', // 224px
      '60': '15rem', // 240px
      '64': '16rem', // 256px
      '68': '17rem', // 272px
      '72': '18rem', // 288px
      '76': '19rem', // 304px
      '80': '20rem', // 320px
      '84': '21rem', // 336px
      '88': '22rem', // 352px
      '92': '23rem', // 368px
      '96': '24rem', // 384px
      '100': '25rem', // 400px
      '104': '26rem', // 416px
      '108': '27rem', // 432px
      '112': '28rem', // 448px
      '116': '29rem', // 464px
      '120': '30rem', // 480px
      // 필요한 만큼 더 추가할 수 있습니다.
    },
    extend: {},
  },
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
  ],
}


//npx tailwindcss -i ./src/main/webapp/dist/input.css -o ./src/main/webapp/dist/tailwind.min.css --watch
