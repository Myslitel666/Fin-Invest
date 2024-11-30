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
        theme = value; // Инициализация объекта темы
    });

    // Состояние для управления раскрытием
    let isOpen = false;

    // Функция для переключения состояния
    function toggleDetails() {
        isOpen = !isOpen;
    }
</script>

<!-- Основной Box -->
<button 
    class="box"
    on:click={toggleDetails}
    style:border={`1px solid ${theme?.border.disabled.color}`}
    style:width="35rem"
    style:border-radius={theme?.border.borderRadius}
    style:--bg-color={theme?.disabled.touch}
>
    <img src={stockLogo} alt={stockTitle} class="stock-logo" />
    <div class="box-content">
        <p>{stockTitle}</p>
        <p 
            class="price"
            style:color={theme?.colors.primary}
        >
            Price: {price} ₽
        </p>
    </div>
</button>

<!-- Дополнительная информация под Box с плавным раскрытием -->
<div 
    class="details" 
    style:height={isOpen ? '4.25rem' : '0'}
>
    <p><span style:font-weight = 600>Lots Quantity: </span> {lotsQuantity} шт.</p>
    <p><span style:font-weight = 600>Lot Value: </span> {lotValue.replace('.', ',')} ₽</p>
    <p><span style:font-weight = 600>Comission: </span> {comission} ₽</p>
</div>

<style>
    .box {
        display: flex;
        align-items: center;
        justify-content: flex-start; /* Прижимаем содержимое к левому краю */
        padding: 1.5rem;
        border: 1px solid #ddd;
        border-radius: 0.5rem;
        transition: background-color 0.3s;
    }

    .box:hover {
        cursor: pointer;
        background-color: var(--bg-color);
    }

    .box-content {
        margin-left: 1rem;
    }

    .box-content p {
        display: flex;
        justify-content: flex-start; /* Прижимаем содержимое к левому краю */
    }

    .stock-logo {
        width: 85px;
        height: 85px;
        border-radius: 50%; /* Делаем изображение круглым */
    }

    .price {
        font-weight: bold;
    }

    .details {
        font-size: 0.9rem;
        color: #555;
        padding-left: 1.5rem;
        overflow: hidden;
        transition: height 0.3s ease; /* Плавный переход */
    }

    .details p {
        margin-bottom: 0.3rem;
    }

    .details p:last-child {
        margin-bottom: 0;
    }
</style>
