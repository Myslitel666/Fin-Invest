<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { activeLink } from './../../stores/activeLinkStore';
    import { onMount } from 'svelte';
    import { themeStore, themeMode } from "svelte-elegant/stores/themeStore";

    export let href = ''

    let isActive = false;

    let theme: IColorThemeStore | undefined;

    // Подписываемся на изменения темы
    themeStore.subscribe(value => {
        theme = value; //Инициализация объекта темы
    });

    // Реактивно следим за состоянием активной ссылки
    $: isActive = $activeLink === href;

    onMount(() => {
        let currentRoute = window.location.pathname;
        if (currentRoute === href) activeLink.set(href);
    });
</script>

<a 
    href = {href}
    style:background-color = {isActive ? theme?.colors.primary : ''}
    style:--Xl-hover = {theme?.disabled.touch}
    style:color = {isActive ? '#fff' : $themeMode === 'light' ? '#383838' : 'white'}
    onclick = {() => {
        // Устанавливаем текущую ссылку как активную
        activeLink.set(href);
    }}
>
    <slot/>
</a>

<style>
    a {
        display: flex;
        align-items: center;
        padding: 0.75rem;
        border-radius: 4px;
 
    }

    a:hover {
        background-color: var(--Xl-hover);
    }
</style>