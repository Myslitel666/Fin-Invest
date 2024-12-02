<script lang='ts'>
    import type { IColorThemeStore } from "svelte-elegant/interfaces";
    import { themeStore, themeMode } from "svelte-elegant/stores/themeStore";
    import { Box } from "svelte-elegant";
    import TriangularBracket from "../icons/TriangularBracket.svelte";
    import { activeStockId } from "../../stores/activeBoxStore";

    export let stockId: number;
    export let stockTitle = '';
    export let stockLogo = '';
    export let lotsQuantity = '';
    export let lotValue = '';
    export let comission = '';
    export let price = '';

    // Состояние для управления раскрытием
    let isOpen = false;

    let theme: IColorThemeStore | undefined;

    // Подписываемся на изменения темы
    themeStore.subscribe(value => {
        theme = value; // Инициализация объекта темы
    });

    $: isOpen = $activeStockId === stockId;

    // Функция для переключения состояния
    function toggleDetails() {
        if (isOpen === false) {
            activeStockId.set(stockId);
        }
        else {
            activeStockId.set(-1);
        }
    }
</script>

<!-- Основной Box -->
<Box 
    padding = 1.5rem
    width = 35rem
    onclick={toggleDetails}
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
    <div 
        class = 'triangular-btn'
        style:rotate = {isOpen ? '-90deg' : ''}
        style:transition = 'rotate 0.3s'
    >
        <TriangularBracket stroke = {$themeMode === 'light' ? '#afafaf' : '#fff'}/>
    </div>
</Box>

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

    .triangular-btn {
        margin-left: auto;
    }

    .details p {
        margin-bottom: 0.3rem;
    }

    .details p:last-child {
        margin-bottom: 0;
    }


</style>
