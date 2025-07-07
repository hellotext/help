module.exports = {
  plugins: [
    require("postcss-import"),
    require("tailwindcss"),
    require("autoprefixer"),
    ...(process.env.JEKYLL_ENV == "production"
      ? [
          require("cssnano")({
            preset: [
              "default",
              {
                cssDeclarationSorter: false,
                calc: false,
                colormin: false,
                convertValues: false,
                discardComments: {
                  removeAll: true,
                },
                normalizeCharset: false,
                reduceIdents: false,
                zindex: false,
              },
            ],
          }),
        ]
      : []),
  ],
};
