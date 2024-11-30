<script lang='ts'>
	import { themeMode, themeStore } from 'svelte-elegant/stores/themeStore';
    import type { IColorThemeStore } from "svelte-elegant/interfaces";

    let theme: IColorThemeStore | undefined;

    // Подписываемся на изменения темы
    themeStore.subscribe(value => {
        theme = value; //Инициализация объекта темы
    });
</script>

<nav    
    class = 'menu'
    style:background-color = {$themeMode === 'light' ? '#f8f8f8' : '#1c1c1c'}
    style:transition = 'all 0.3s'
>
    <slot />
</nav>

<style>
    .menu {
        display: flex;
        flex-direction: column;
        height: 100vh;
        width: 15rem;
        position: fixed;
        padding-top: 5.25rem;
        padding-left: 0.66rem;
        padding-right: 0.66rem;
    }
</style>