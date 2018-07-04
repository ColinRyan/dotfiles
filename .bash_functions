installflow () {
    yarn add --dev babel-cli babel-core babel-eslint babel-plugin-transform-remove-console babel-preset-flow eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-flow eslint-plugin-flowtype eslint-plugin-import eslint-plugin-prettier flow-bin babel-plugin-transform-runtime babel-preset-env
    cp ~/.config/skeletons/.eslintrc.json ./
    cp ~/.config/skeletons/.babelrc ./
    cp ~/.config/skeletons/.flowconfig ./
    yarn run flow
}
