<script lang="ts">
    import { onMount, onDestroy } from "svelte";

    export let isOpen = false;
    export let toggleButtonId = 'modal-toggle-button'

    // Функция для закрытия меню при клике вне его
    function close(event: MouseEvent) {
        const modal = document.querySelector('.modal');
        const toggleButton = document.getElementById(toggleButtonId);
    
        if (
            isOpen && 
            modal && 
            toggleButton && 
            !modal.contains(event.target as Node) && 
            !toggleButton.contains(event.target as Node)
        ) {
            isOpen = false;
        }
    }

    onMount(() => {
        if (typeof window !== 'undefined') {
            document.addEventListener('click', close);
        }
    });

    onDestroy(() => {
        if (typeof window !== 'undefined') {
            document.removeEventListener('click', close);
        }
    });
</script>

<div 
    class="modal-overlay"
    style:visibility="{isOpen ? 'visible' : 'hidden'}"
>
    <div class="modal">
        <slot/>
    </div>
</div>

<style>
    /* Перекрывающий фон */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.25); /* Полупрозрачный тёмный фон */
        display: flex; /* Центрирование модального окна */
        justify-content: center;
        align-items: center;
        z-index: 1000; /* Поверх всего контента */
    }

    /* Само модальное окно */
    .modal {
        position: relative; /* Относительное позиционирование для внутреннего содержимого */
        width: 15rem;
        height: 15rem;
        background-color: #ffffff;
        border-radius: 1rem;
        box-shadow: 0 4px 12px 6px rgba(0, 0, 0, 0.2);
    }
</style>
