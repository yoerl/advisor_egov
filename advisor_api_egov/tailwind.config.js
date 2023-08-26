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
      '44': '11rem', // 144px
      '48': '12rem', // 160px
      '52': '13rem', // 160px
      '56': '14rem', // 160px
      '60': '15rem', // 160px
      '96': '24rem', // 160px
      '96': '24rem', // 160px
      '100': '25rem', // 160px

      // 필요한 만큼 더 추가할 수 있습니다.
    },
    extend: {
colors: {
'#E8E9F1': '#E8E9F1',
'#0C426E': '#0C426E',
'#929ED7': '#929ED7',
'#A5A5A5': '#A5A5A5',
'#9594A1': '#9594A1'
}

},
  },
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
  ],
}

//npx tailwindcss -i ./src/main/webapp/dist/input.css -o ./src/main/webapp/dist/tailwind.min.css --watch
