<script lang="ts">
	import { themeMode } from 'svelte-elegant/stores/themeStore';
	import StockBox from '../../components/ui/StockBox.svelte';
	import { onMount } from 'svelte';
	import type { Stock } from '../../interfaces/stock';
	import Plus from '../../components/icons/Plus.svelte';
	import { Button } from 'svelte-elegant';

	async function getAssets() {
        const response = await fetch('/api/getAssets');
        const data = await response.json();

        return data;
    };

	// Массив структур stocks
	let stocks:Stock[] = [];

	onMount(async () => {
		stocks = await getAssets();
    });

	// lotsQuantity={stock.lotsQuantity}
	// lotValue={stock.lotValue}
	// comission={stock.comission}
	// price={stock.price}
</script>

<section>
	<div class = 'content'>
		{#each stocks as stock}
			<StockBox
				stockId = {stock.stockid}
				stockTitle={stock.stocktitle}
				stockLogo={stock.stocklogo}
			/>
		{/each}
	</div>
	<div class = 'btn-plus'>
		<Button 
			width = '3.15rem'
			height = '3.15rem'
			borderRadius = 50%
			padding = 0.66rem
			boxShadow = { $themeMode === 'light' ? '0px 4px 12px 3px rgba(0, 0, 0, 0.2)' : '0px 0px 36px 3px rgba(255, 255, 255, 0.3)' }
		>
			<Plus 
				size = 2.5rem 
			/>
		</Button>
	<div>
	
</section>

<style>
	section {
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.content {
		margin-top: 5.33rem;
		margin-bottom: 1rem;
		display: flex;
		flex-direction: column;
		gap: 0.45rem;
	}

	.btn-plus {
		position: fixed;
		margin-top: 7.8rem;
		margin-left: 41rem;
	}
</style>
