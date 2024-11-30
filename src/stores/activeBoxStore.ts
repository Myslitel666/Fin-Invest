import { writable } from 'svelte/store';

// Хранилище для текущего активного href
export const activeStockId = writable(-1);