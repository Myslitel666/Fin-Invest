<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { themeStore } from "svelte-elegant/stores/themeStore";

    export let src = '';

    let theme: IColorThemeStore | undefined;

    // Подписываемся на изменения темы
    themeStore.subscribe(value => {
        theme = value; //Инициализация объекта темы
    });
</script>

<div 
    class = 'box'
    style:border = {`1px solid ${theme?.border.disabled.color}`}
    style:height = 5rem
    style:width = 15rem
    style:border-radius = {theme?.border.borderRadius}
    style:--bg-color = {theme?.disabled.touch}
>
    
</div>

<style>
    .box:hover {
        cursor:pointer;
        background-color: var(--bg-color);
    }
</style>