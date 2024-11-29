<script lang='ts'>
    import { activeLink } from './../../stores/activeLinkStore';
    import { onMount } from 'svelte';

    export let href = ''
    export let bgColor = 'red'

    let isActive = false;

    // Реактивно следим за состоянием активной ссылки
    $: isActive = $activeLink === href;

    onMount(() => {
        let currentRoute = window.location.pathname;
        if (currentRoute === href) activeLink.set(href);
    });
</script>

<a 
    href = {href}
    style:background-color = {isActive ? bgColor : ''}
    onclick = {() => {
        // Устанавливаем текущую ссылку как активную
        activeLink.set(href);
    }}
>
    <slot/>
</a>

<style>

</style>