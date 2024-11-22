<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { themeStore } from "svelte-elegant/stores/themeStore";

    export let stockId: number;
	export let stockTitle: string;
	export let stockLogo: string;
	export let price: string;

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
    style:width = 35rem
    style:border-radius = {theme?.border.borderRadius}
    style:--bg-color = {theme?.disabled.touch}
>
    <img src={stockLogo} alt={stockTitle} class="stock-logo" />
    <div 
        class = 'box-content'
    >
        <p>{stockTitle}</p>
        <p 
            class="price"
            style:color={theme?.colors.primary}
        >
            Price: {price}
        </p>
    </div>
</div>

<style>
    .box {
		display: flex;
		align-items: center;
		padding: 1rem;
		border: 1px solid #ddd;
		border-radius: 0.5rem;

		width: 200px;
	}

    .box-content {
        margin-left: 1rem;
    }

	.stock-logo {
		width: 80px;
		height: 80px;
		border-radius: 50%; /* Делаем изображение круглым */
		margin-bottom: 0.5rem;
	}

	.price {
		font-weight: bold;
	}

    .box:hover {
        cursor:pointer;
        background-color: var(--bg-color);
    }
</style>