<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { themeStore } from "svelte-elegant/stores/themeStore";

	export let stockTitle: string;
	export let stockLogo: string;
    export let lotsQuantity: string;
    export let lotValue: string;
    export let comission: string;
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
        <p style:font-weight = 600>{stockTitle}</p>
        <p>Lots Quantity: {lotsQuantity} шт.</p>
        <p>Lot Value: {lotValue.replace('.',',')} ₽</p>
        <p>Comission: {comission} ₽</p>
        <p 
            class="price"
            style:color={theme?.colors.primary}
        >
            Price: {price} ₽
        </p>
    </div>
</div>

<style>
    .box {
		display: flex;
		align-items: center;
		padding: 1.75rem;
		border: 1px solid #ddd;
		border-radius: 0.5rem;

		width: 200px;
	}

    .box-content p {
        margin-bottom: 0.18rem;
    }

    .box-content {
        margin-left: 1rem;
    }

	.stock-logo {
		width: 85px;
		height: 85px;
		border-radius: 50%; /* Делаем изображение круглым */
	}

	.price {
		font-weight: bold;
	}

    .box:hover {
        cursor:pointer;
        background-color: var(--bg-color);
    }
</style>