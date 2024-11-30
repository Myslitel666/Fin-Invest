<script lang="ts">
	import Box from '../../components/ui/Box.svelte';
	import { onMount } from 'svelte';
	import type { Stock } from '../../interfaces/stock';

	async function getAssets() {
        const response = await fetch('/api/getAssets');
        const data = await response.json();

		console.log(data);
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
			<Box
				stockId = {stock.stockid}
				stockTitle={stock.stocktitle}
				stockLogo={stock.stocklogo}
			/>
		{/each}
	</div>
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
</style>
