<nav class = 'menu'>
    <slot />
</nav>

<style>
    .menu {
        display: flex;
        flex-direction: column;
        height: 100vh;
        width: 15rem;
        background-color: #f8f8f8;
        position: fixed;
        padding-top: 5.5rem;
        padding-left: 1rem;
    }
</style>