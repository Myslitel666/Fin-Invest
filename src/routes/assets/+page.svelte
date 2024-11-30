<script lang="ts">
	import Box from '../../components/ui/Box.svelte';
	import { Header } from 'svelte-elegant';
	import { ColorThemeSwitch } from 'svelte-elegant';
	import { onMount } from 'svelte';

	// Массив структур stocks
	let stocks = [
		
	];

	// lotsQuantity={stock.lotsQuantity}
	// lotValue={stock.lotValue}
	// comission={stock.comission}
	// price={stock.price}
</script>

<section>
	<div class = 'content'>
		{#each stocks as stock}
			<Box
				stockId = {stock.stockId}
				stockTitle={stock.stockTitle}
				stockLogo={stock.stockLogo}
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
