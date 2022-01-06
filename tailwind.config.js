const plugin = require('tailwindcss/plugin');

module.exports = {
    purge: {
        enabled:true,
        content:['./*.erb', './**/*.erb'],
    },
    darkMode: false, // or 'media' or 'class'
    theme: {},
    variants: {
        extend: {
            backgroundColor: ['label-checked'],
            scale: ['group-hover'], 
        },
    },
    plugins: [
        plugin(({ addVariant, e }) => {
            addVariant('label-checked', ({ modifySelectors, separator }) => {
                modifySelectors(
                    ({ className }) => {
                        const eClassName = e(`label-checked${separator}${className}`);
                        const yourSelector = 'input[type="radio"]'; 
                        return `${yourSelector}:checked ~ .${eClassName}`; 
                    }
                )
            })
        }),
    ],
};