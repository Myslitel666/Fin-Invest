<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { activeLink } from './../../stores/activeLinkStore';
    import { onMount } from 'svelte';
    import { themeStore } from "svelte-elegant/stores/themeStore";

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
    onclick = {() => {
        // Устанавливаем текущую ссылку как активную
        activeLink.set(href);
    }}
>
    <slot/>
</a>

<style>

</style>