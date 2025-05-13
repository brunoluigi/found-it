# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tw-animate-css" # @1.2.5
pin "@tailwindcss/forms", to: "@tailwindcss--forms.js" # @0.5.10
pin "mini-svg-data-uri" # @1.4.4
pin "tailwindcss/colors", to: "tailwindcss--colors.js" # @4.1.4
pin "tailwindcss/defaultTheme", to: "tailwindcss--defaultTheme.js" # @4.1.4
pin "tailwindcss/plugin", to: "tailwindcss--plugin.js" # @4.1.4
pin "@tailwindcss/typography", to: "@tailwindcss--typography.js" # @0.5.16
pin "cssesc" # @3.0.0
pin "lodash.castarray" # @4.4.0
pin "lodash.isplainobject" # @4.0.6
pin "lodash.merge" # @4.6.2
pin "postcss-selector-parser" # @6.0.10
pin "util-deprecate" # @1.0.2
pin "tippy.js", to: "https://cdn.jsdelivr.net/npm/tippy.js@6.3.7/+esm"
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/+esm"

pin "@floating-ui/dom", to: "@floating-ui--dom.js" # @1.7.0
pin "@floating-ui/core", to: "@floating-ui--core.js" # @1.7.0
pin "@floating-ui/utils", to: "@floating-ui--utils.js" # @0.2.9
pin "@floating-ui/utils/dom", to: "@floating-ui--utils--dom.js" # @0.2.9
